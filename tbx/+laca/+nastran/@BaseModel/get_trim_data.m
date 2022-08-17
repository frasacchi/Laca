function [data,p_data,f_data,folder_name] = get_trim_data(obj,varargin)
if ~isa(obj,'laca.nastran.BaseModel')
    error('Model must inherit laca.nastran.model abstract class')
end

p = inputParser();
p.addParameter('Silent',true);
p.addParameter('BinFolder','');
p.addParameter('SourceFolder','')
p.addParameter('StopOnFatal',false)
p.addParameter('NumAttempts',3)
p.KeepUnmatched = true;
p.parse(varargin{:});
res = p.Results;


folder_name = laca.nastran.create_tmp_bin('BinFolder',res.BinFolder,...
    'SourceFolder',res.SourceFolder);
% write the model
obj.writeToFile(fullfile(folder_name,'Source','Model'));

%create trim cards
obj.write_trim(fullfile(folder_name,'Source','trim.bdf'));

attempt = 1;
while attempt<p.Results.NumAttempts+1
    % run NASTRAN
    current_folder = pwd;
    cd(fullfile(folder_name,'Source'))
    fprintf('Computing sol144 for Model %s: %s; V=%.1f m/s; AoA=%.2f deg ... ',...
        obj.Name,obj.config_string(),obj.V,rad2deg(obj.ANGLEA.Value));
    command = ['C:\MSC.Software\MSC_Nastran\20181\bin\nastran.exe',...
        ' ','sol144.bdf',...
        ' ',sprintf('out=..%s%s%s',filesep,'bin',filesep)];
    if res.Silent
        command = [command,' ','1>NUL 2>NUL'];
    end
    tic;
    system(command);
    toc;
    cd(current_folder);
    %get Results
    f06filename = fullfile(folder_name,'bin','sol144.f06');
    data_file = mni.result.f06(f06filename);
    if data_file.isEmpty
        attempt = attempt + 1;
        fprintf('%s is empty on attempt %.0f...\n',f06filename,attempt)
        continue
    elseif data_file.isfatal
        if p.Results.StopOnFatal
            error('Fatal error detected in f06 file %s...',f06filename)
        else
            attempt = attempt + 1;
            fprintf('Fatal error detected on attempt %.0f in f06 file %s... \n',attempt,f06filename)
            continue
        end
    else
        break
    end
end
if attempt > p.Results.NumAttempts
    fprintf('Failed after %.0f attempts %s... STOPPING\n',p.Results.NumAttempts,f06filename)
    error('Failed after %.0f attempts %s...',p.Results.NumAttempts,f06filename)
end
data = data_file.read_disp;
p_data = data_file.read_aeroP;
f_data = data_file.read_aeroF;
end

