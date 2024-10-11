function write_gust_case_control(obj,filename)
    fid = fopen(filename,'w+');
    mni.printing.bdf.writeFileStamp(fid);
    mni.printing.bdf.writeComment(fid,'This file contain the gust subcase defintions for a 146 solution')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    
    %% create subcases
    for i = 1:length(obj.GustAmplitude)
        fprintf(fid,'SUBCASE  %.0f\n GUST = %.0f\n DLOAD = %.0f\n',i,i*10,i);
    end
    
    fclose(fid);
end

