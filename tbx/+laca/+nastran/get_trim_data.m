function [data,p_data,f_data,folder_name] = get_trim_data(model,trim_params,varargin)
    p = inputParser();
    p.addParameter('Silent',true);
    p.addParameter('bin_folder',[]);
    p.parse(varargin{:});
    
    
    folder_name = laca.nastran.create_tmp_bin(p.Results.bin_folder);
    % write the model 
    model.writeToFolder(fullfile(folder_name,'Source','Model'));
   
    %create trim cards
    trim_params.write_trim(fullfile(folder_name,'Source','trim.bdf'));

    % run NASTRAN
    current_folder = pwd;
    cd(fullfile(folder_name,'Source'))
    fprintf('Computing sol144 for Model %s at a velocity %.1f m/s\n',...
        model.Name,trim_params.V);         
    command = ['C:\MSC.Software\MSC_Nastran\20181\bin\nastran.exe',...
        ' ','sol144.bdf',...
        ' ',['out=../bin',filesep],'',];
    if p.Results.Silent
       command = [command,' ','1>NUL 2>NUL'];
    end
    system(command);
    cd(current_folder);
    
    %get Results
    data_file = mni.result.f06(fullfile(folder_name,'bin','sol144.f06'));
    
    data = data_file.read_disp;
    p_data = data_file.read_aeroP;
    f_data = data_file.read_aeroF;
end

