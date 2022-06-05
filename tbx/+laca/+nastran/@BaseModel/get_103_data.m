function [data,folder_name] = get_103_data(model,varargin)
p = inputParser();
p.addParameter('Silent',true);
p.addParameter('BinFolder','');
p.addParameter('SourceFolder','')
p.parse(varargin{:});
res = p.Results;

folder_name = laca.nastran.create_tmp_bin('BinFolder',res.BinFolder,...
    'SourceFolder',res.SourceFolder);
% write the model
model.writeToFile(fullfile(folder_name,'Source','Model'));

% run NASTRAN
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
f06file = mni.result.f06(fullfile(folder_name,'bin','sol103.f06'));
data = f06file.read_modes();

%append modeshapes onto data structture
vecs = f06file.read_modeshapes();
for i = 1:length(data)
    mode = data(i).Mode;
    data(i).EigenVector =  [vecs.T1(mode,:)',vecs.T2(mode,:)',...
        vecs.T3(mode,:)',vecs.R1(mode,:)',...
        vecs.R2(mode,:)',vecs.R3(mode,:)'];
    data(i).IDs = vecs.GID(1,:)';
end


end

