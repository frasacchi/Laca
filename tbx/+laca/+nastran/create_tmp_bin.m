function bin_name = create_tmp_bin(varargin)
    p = inputParser();
    p.addParameter('BinFolder','')
    p.addParameter('SourceFolder','')
    p.parse(varargin{:})
    bin_name = p.Results.BinFolder;

    % create a random string of 5 characters
    if isempty(bin_name)
        % make sure only valid charcters in random string
        vals = [48:57,65:90,97:122]; 
        % keep generating folders until it doesn't already exist
        while true
            idx = char(vals(randi([1 length(vals)],1,3)));
            bin_name = ['bin_',idx];
            % create directory
            if ~isfolder(bin_name)
                break
            end
        end
    else
        if isfolder(bin_name)
            rmdir(bin_name,'s'); 
        end   
    end
    % make the folder
    mkdir(bin_name)

    % copy all files in source into the new directory
    if isfolder(p.Results.SourceFolder)
        copyfile(p.Results.SourceFolder,bin_name);
    end
end

