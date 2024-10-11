function write_stationary(obj,filename)
    fid = fopen(filename,'w+');
    mni.printing.bdf.writeFileStamp(fid);
    mni.printing.bdf.writeComment(fid,'This file contains the trim cnoditions for a 101 solution')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');

    % create boundary conditions
    write_boundary_conditions(obj,fid)

    %write gravity card
    mni.printing.cards.GRAV(11,obj.g*obj.LoadFactor,obj.Grav_Vector)...
        .writeToFile(fid);

    fclose(fid);
end

