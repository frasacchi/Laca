function bin_name = create_tmp_bin(bin_name)
    % create a random string of 5 characters
    if ~exist('bin_name','var') || isempty(bin_name)
        vals = [48:57,65:90,97:122];
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
    % make the folder structure
    mkdir(bin_name)
    mkdir(fullfile(bin_name,'Source'))
    mkdir(fullfile(bin_name,'bin'))
    
    % copy all files in source into the new directory
    copyfile(fullfile(pwd,'..','Source'),fullfile(bin_name,'Source'));
end

