function [data,folder_name] = get_flutter_data(obj,varargin)
p = inputParser();
p.addParameter('Silent',true);
p.addParameter('BinFolder','');
p.addParameter('SourceFolder','')
p.addParameter('StopOnFatal',false)
p.addParameter('NumAttempts',3)
p.addParameter('other',{})
p.KeepUnmatched = true;
p.parse(varargin{:});
res = p.Results;

folder_name = laca.nastran.create_tmp_bin('BinFolder',res.BinFolder,...
    'SourceFolder',res.SourceFolder);
% write the model
obj.writeToFile(fullfile(folder_name,'Source','Model'));

%create flutter points
obj.write_flutter(fullfile(folder_name,'Source','flutter.bdf'));

attempt = 1;
while attempt<p.Results.NumAttempts+1
    % run NASTRAN
    current_folder = pwd;
    cd(fullfile(folder_name,'Source'))
    fprintf('Computing sol145 for Model %s: %s at %.0f velocities ...',...
        obj.Name,obj.config_string(),length(obj.V));
    command = ['C:\MSC.Software\MSC_Nastran\20181\bin\nastran.exe',...
        ' ','sol145.bdf',...
        ' ',sprintf('out=..%s%s%s',filesep,'bin',filesep)];
    if res.Silent
        command = [command,' ','1>NUL 2>NUL'];
    end
    tic;
    system(command);
    toc;
    cd(current_folder);
    %get Results
    f06_filename = fullfile(folder_name,'bin','sol145.f06');
    f06_file = mni.result.f06(f06_filename);
    if f06_file.isEmpty
        attempt = attempt + 1;
        fprintf('%s is empty on attempt %.0f...\n',f06_filename,attempt)
        continue
    elseif f06_file.isfatal
        if p.Results.StopOnFatal
            error('Fatal error detected in f06 file %s...',f06_filename)
        else
            attempt = attempt + 1;
            fprintf('Fatal error detected on attempt %.0f in f06 file %s... \n',attempt,f06_filename)
            continue
        end
    else
        break
    end
end
if attempt > p.Results.NumAttempts
    fprintf('Failed after %.0f attempts %s... STOPPING\n',p.Results.NumAttempts,f06_filename)
    error('Failed after %.0f attempts %s...',p.Results.NumAttempts,f06_filename)
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
        for o_i = 1:length(p.Results.other)
            if ischar(p.Results.other{o_i}{2}) || length(p.Results.other{o_i}{2})<=1
                data((i-1)*Vs+j).(p.Results.other{o_i}{1}) = p.Results.other{o_i}{2};
            else
                data((i-1)*Vs+j).(p.Results.other{o_i}{1}) = p.Results.other{o_i}{2}(j);
            end
        end
    end
end

% extract eigen vectors
eigen_vec = mni.result.f06(fullfile(folder_name,'bin','sol145.f06')).read_flutter_eigenvector();

%assign eigen vectors to modes if they equate
for i = 1:length(eigen_vec)
    [~,I] = min(abs([data.CMPLX]-eigen_vec(i).EigenValue));
    data(I).IDs = eigen_vec(i).IDs;
    data(I).EigenVector = eigen_vec(i).EigenVector;
    %         if nnz(I)>1
    % %             warning('multiple candidate mode found for eigen value [%f,%f] - not applied to any')
    %         elseif nnz(I)==1
    %             data(I).IDs = eigen_vec(i).IDs;
    %             data(I).EigenVector = eigen_vec(i).EigenVector;
    %         end
end
end

