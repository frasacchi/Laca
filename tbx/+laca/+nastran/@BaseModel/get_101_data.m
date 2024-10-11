function [data,folder_name] = get_101_data(obj,varargin)
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

%create trim cards
obj.write_stationary(fullfile(folder_name,'Source','trim.bdf'));

% run NASTRAN
attempt = 1;
while attempt<4
    current_folder = pwd;
    cd(fullfile(folder_name,'Source'))
    fprintf('Computing sol144 for Model %s: %s ... ',...
        obj.Name,obj.config_string());
    command = ['C:\MSC.Software\MSC_Nastran\20181\bin\nastran.exe',...
        ' ','sol101.bdf',...
        ' ',['out=../bin',filesep]];
    if p.Results.Silent
        command = [command,' ','1>NUL 2>NUL'];
    end
    tic;system(command);tt = toc;
    fprintf('Elapsed Time: %.2f sec\n',tt);
    cd(current_folder);
    %get Results
    f06filename = fullfile(folder_name,'bin','sol101.f06');
    data_file = mni.result.f06(f06filename);
    if data_file.isEmpty
        attempt = attempt + 1;
        fprintf('%s is empty on attempt %.0f...\n',f06filename,attempt)
        continue
    elseif data_file.isfatal
        fprintf('Fatal error detected in f06 file %s... STOPPING\n',f06filename)
        error('Fatal error detected in f06 file %s...',f06filename)
    else
        break
    end
end
if attempt == 4
    fprintf('Failed after 3 attempts %s... STOPPING\n',f06filename)
    error('Failed after 3 attempts %s...',f06filename)
end
data = data_file.read_disp();
end

