function write_trim(obj,filename)
    fid = fopen(filename,'w+');
    mni.printing.bdf.writeFileStamp(fid);
    mni.printing.bdf.writeHeading(fid,'this file contain the trim card for a 144 solution')
    
    % create aestat cards
    mni.printing.bdf.writeSubHeading(fid,'Rigid Body Motions');
    mni.printing.bdf.writeColumnDelimiter('8');
    params = string(fieldnames(obj));
    for i = 1:length(params)
        if isa(obj.(params(i)),'laca.trim.RigidBody')
            obj.(params(i)).writeToFile(fid);
        end    
    end   
    
    % create control links
    if ~isempty(obj.ControlLinks)
        mni.printing.bdf.writeSubHeading(fid,'Control Links');
        arrayfun(@(x)x.writeToFile(fid),obj.ControlLinks)
    end
    
    % create constraint GP
    obj.write_support(fid);
    
    % set trim values (NAN is free and will not be included in trim card)
    labels = [];
    for i = 1:length(params)
        if isa(obj.(params(i)),'laca.trim.BaseDoF')
            if ~isnan(obj.(params(i)).Value)
                labels = [labels,{obj.(params(i)).Name},{obj.(params(i)).Value}];
            end
        end    
    end
    mni.printing.bdf.writeSubHeading(fid,'Trim Card');
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    mni.printing.cards.AEROS(obj.RefChord,obj.RefSpan,obj.RefWingArea).writeToFile(fid);
    mni.printing.cards.GRAV(11,obj.g*obj.LoadFactor,obj.GravVector)...
        .writeToFile(fid);
    % write trim card
    Q = 0.5*obj.rho*obj.V^2;
    t_card= mni.printing.cards.TRIM(obj.TrimCaseID,obj.Mach,Q,...
        labels(:),'AEQR',obj.AEQR);    
    t_card.writeToFile(fid)
    fclose(fid);
end

