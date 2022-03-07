function write_flutter(obj,filename)
    fid = fopen(filename,'w+');
    mni.printing.bdf.writeFileStamp(fid);
    mni.printing.bdf.writeComment(fid, 'this file contain the flutter cards for a 145 solution')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    
    % create control links
    if ~isempty(obj.ControlLinks)
        mni.printing.bdf.writeSubHeading(fid,'Control Links');
        arrayfun(@(x)x.writeToFile(fid),obj.ControlLinks)
    end
    
    % create constraint GP
    obj.write_support(fid);
    
    %create eigen solver and frequency bounds
    mni.printing.bdf.writeComment(fid, 'Eigen Decomposition Method')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    mni.printing.cards.EIGR(10,'MGIV','F1',0,...
         'F2',obj.FreqRange(2),'NORM','MAX')...
         .writeToFile(fid);
%     mni.printing.cards.EIGR(10,'MGIV','ND',42,'NORM','MAX')...
%         .writeToFile(fid);

    % define frequency / modes of interest
    mni.printing.bdf.writeComment(fid, 'Filter Frequencies and Modes of Interest')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    mni.printing.cards.PARAM('LMODES','i',0).writeToFile(fid);
    mni.printing.cards.PARAM('LMODESFL','i',0).writeToFile(fid);
    mni.printing.cards.PARAM('LFREQ','r',obj.FreqRange(1)).writeToFile(fid);
    mni.printing.cards.PARAM('HFREQ','r',obj.FreqRange(2)).writeToFile(fid);
    mni.printing.cards.PARAM('LFREQFL','r',obj.FreqRange(1)).writeToFile(fid);
    mni.printing.cards.PARAM('HFREQFL','r',obj.FreqRange(2)).writeToFile(fid);
    
    
    % Aero Properties Section
    mni.printing.bdf.writeComment(fid, 'Aerodynamic Properties')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    %create AERO card
    mni.printing.cards.AERO(obj.RefChord,obj.RefDensity).writeToFile(fid);
    
    %create FLFACT cards
    fl_cards = [{mni.printing.cards.FLFACT(1,obj.rho/obj.RefDensity)},...
        {mni.printing.cards.FLFACT(2,obj.Mach)},...
        {mni.printing.cards.FLFACT(3,obj.V)}]; 
  
    for i = 1:length(fl_cards)
        fl_cards{i}.writeToFile(fid)
    end
    
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    f_card = mni.printing.cards.FLUTTER(FMETHOD,obj.FlutterMethod,1,2,3,[]);
    f_card.writeToFile(fid)
    fclose(fid);
end

