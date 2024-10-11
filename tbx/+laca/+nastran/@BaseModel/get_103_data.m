function [data,folder_name] = get_103_data(model,varargin)
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
model.writeToFile(fullfile(folder_name,'Source','Model'));
%create trim cards
obj.write_modal(fullfile(folder_name,'Source','trim.bdf'));

% run NASTRAN
attempt = 1;
while attempt<4
current_folder = pwd;
cd(fullfile(folder_name,'Source'))
fprintf('Computing sol103 for Model %s',model.Name);
command = ['C:\MSC.Software\MSC_Nastran\20181\bin\nastran.exe',...
    ' ','sol103.bdf',...
    ' ',['out=../bin',filesep]];
if p.Results.Silent
    command = [command,' ','1>NUL 2>NUL'];
end
system(command);
cd(current_folder);
%get Results
    f06filename = fullfile(folder_name,'bin','sol103.f06');
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

%append modeshapes onto data structture
vecs = data_file.read_modeshapes();
for i = 1:length(data)
    mode = data(i).Mode;
    data(i).EigenVector =  [vecs.T1(mode,:)',vecs.T2(mode,:)',...
        vecs.T3(mode,:)',vecs.R1(mode,:)',...
        vecs.R2(mode,:)',vecs.R3(mode,:)'];
    data(i).IDs = vecs.GID(1,:)';
end


end

