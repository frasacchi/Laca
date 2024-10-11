function [f06_file,folder_name] = get_gust_data(obj,varargin)
    p = inputParser();
    p.addParameter('Silent',true);
    p.addParameter('BinFolder','');
    p.addParameter('SourceFolder','')
    p.KeepUnmatched = true;
    p.parse(varargin{:});
    res = p.Results;
    
    folder_name = laca.nastran.create_tmp_bin('BinFolder',res.BinFolder,...
        'SourceFolder',res.SourceFolder);
    % write the model 
    obj.writeToFile(fullfile(folder_name,'Source','Model'));

    %create gust case control
    obj.write_gust_case_control(fullfile(folder_name,'Source','gust_case_control.bdf'));

    %create gust data
    obj.write_gust(fullfile(folder_name,'Source','gust.bdf'));
    
    % run NASTRAN
    current_folder = pwd;
    cd(fullfile(folder_name,'Source'))
    fprintf('Computing sol146 for Model %s: %s; at %.0f Gust Lengths ...',...
        obj.Name,obj.config_string(),length(obj.GustAmplitude));        
    command = ['C:\MSC.Software\MSC_Nastran\20181\bin\nastran.exe',...
        ' ','sol146.bdf',...
        ' ',sprintf('out=..%s%s%s',filesep,'bin',filesep)];
    if res.Silent
       command = [command,' ','1>NUL 2>NUL'];
    end
    tic;
    system(command);
    toc;
    cd(current_folder);
    
    %get Results
    f06_filename = fullfile(folder_name,'bin','sol146.f06');
    f06_file = mni.result.f06(f06_filename);
    
    if f06_file.isfatal
        error('Fatal error detected in f06 file, %s',fullfile(pwd,f06_filename));        
    end
end

