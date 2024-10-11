function write_flutter(obj,filename)
    fid = fopen(filename,'w+');
    mni.printing.bdf.writeFileStamp(fid);
    mni.printing.bdf.writeComment(fid,'This file contain the flutter cards for a 145 solution')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');

    
    % create boundary conditions
    write_boundary_conditions(obj,fid)    
    
    %create eigen solver and frequency bounds
    mni.printing.bdf.writeComment(fid,'Eigen Decomposition Method')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    mni.printing.cards.EIGR(10,'MGIV','F1',0,...
         'F2',obj.FreqRange(2),'NORM','MAX')...
         .writeToFile(fid);
%     mni.printing.cards.EIGR(10,'MGIV','ND',42,'NORM','MAX')...
%         .writeToFile(fid);

    % define frequency / modes of interest
    mni.printing.bdf.writeComment(fid,'Frequencies and Modes of Interest')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    mni.printing.cards.PARAM('LMODES','i',obj.LModes).writeToFile(fid);
    mni.printing.cards.PARAM('LMODESFL','i',obj.LModes).writeToFile(fid);
    mni.printing.cards.PARAM('LFREQ','r',obj.FreqRange(1)).writeToFile(fid);
    mni.printing.cards.PARAM('HFREQ','r',obj.FreqRange(2)).writeToFile(fid);
    mni.printing.cards.PARAM('LFREQFL','r',obj.FreqRange(1)).writeToFile(fid);
    mni.printing.cards.PARAM('HFREQFL','r',obj.FreqRange(2)).writeToFile(fid);
    
    
    % Aero Properties Section
    mni.printing.bdf.writeComment(fid,'Aerodynamic Properties')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    %create AERO card
    mni.printing.cards.AERO(obj.RefChord,obj.RefDensity,ACSID=obj.ACSID).writeToFile(fid);
    
    mni.printing.bdf.writeComment(fid,'Flutter Card and Properties')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    %create FLFACT cards
    fl_cards = [{mni.printing.cards.FLFACT(obj.Flfact_rho_id,...
        obj.rho/obj.RefDensity)},...
        {mni.printing.cards.FLFACT(obj.Flfact_mach_id,obj.Mach)},...
        {mni.printing.cards.FLFACT(obj.Flfact_v_id,obj.V)}]; 
    for i = 1:length(fl_cards)
        fl_cards{i}.writeToFile(fid)
    end

    %create flutter entry
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    f_card = mni.printing.cards.FLUTTER(obj.FlutterID,...
        obj.FlutterMethod,obj.Flfact_rho_id,...
        obj.Flfact_mach_id,obj.Flfact_v_id,[]);
    f_card.writeToFile(fid)
    fclose(fid);
end

