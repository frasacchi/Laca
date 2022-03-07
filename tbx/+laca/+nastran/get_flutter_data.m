function [data,folder_name] = get_flutter_data(model,trim_params,varargin)
    p = inputParser();
    p.addParameter('Silent',true);
    p.addParameter('bin_folder',[]);
    p.parse(varargin{:});
    
    folder_name = laca.nastran.create_tmp_bin(p.Results.bin_folder);
    % write the model 
    model.writeToFolder(fullfile(folder_name,'Source','Model'));

    %create flutter points
    trim_params.write_flutter(fullfile(folder_name,'Source','flutter.bdf'));
    
    % run NASTRAN
    current_folder = pwd;
    cd(fullfile(folder_name,'Source'))
    fprintf('Computing sol145 for model %s at %.0f velocities\n',...
        model.Name,length(trim_params.V));        
    command = ['C:\MSC.Software\MSC_Nastran\20181\bin\nastran.exe',...
        ' ','sol145.bdf',...
        ' ',['out=../bin',filesep]];
    if p.Results.Silent
       command = [command,' ','1>NUL 2>NUL'];
    end
    system(command);
    cd(current_folder);
    
    %get Results
    f06_filename = fullfile(folder_name,'bin','sol145.f06');
    f06_file = mni.result.f06(f06_filename);
    
    if f06_file.isfatal
        error('Fatal error detected in f06 file, %s',fullfile(pwd,f06_filename));        
    end
    res = f06_file.read_flutter();
    % split each configuration onto its own row
    names = fieldnames(res);
    data = [];
    for i =1:length(res)
        Vs = length(res(i).V);
        for j = 1:Vs
            for k = 1:length(names)
                if length(res(i).(names{k}))==1
                    data((i-1)*Vs+j).(names{k}) = res(i).(names{k});
                elseif strcmp(names{k},'CMPLX')
                    cmplx = res(i).(names{k})(j,:);
                    data((i-1)*Vs+j).(names{k}) = complex(cmplx(1),cmplx(2));
                else
                    data((i-1)*Vs+j).(names{k}) = res(i).(names{k})(j);
                end
            end     
        end
    end
    
    % extract eigen vectors
    eigen_vec = mni.result.f06(fullfile(folder_name,'bin','sol145.f06')).read_flutter_eigenvector();
    
    %assign eigen vectors to modes if they equate
    for i = 1:length(eigen_vec)
        I = abs([data.CMPLX]-eigen_vec(i).EigenValue)<1e-3;
        if nnz(I)>1
%             warning('multiple candidate mode found for eigen value [%f,%f] - not applied to any')
        elseif nnz(I)==1
            data(I).IDs = eigen_vec(i).IDs;
            data(I).EigenVector = eigen_vec(i).EigenVector;
        end
    end
end

