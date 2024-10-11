function write_trim(obj,filename)
    fid = fopen(filename,'w+');
    mni.printing.bdf.writeFileStamp(fid);
    mni.printing.bdf.writeComment(fid,'This file contains the trim card for a 144 solution')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    
    % create aestat cards
    param_names = fieldnames(obj);
    
    for i = 1:length(param_names)
        trim_obj = obj.(param_names{i});
        if isa(trim_obj,'laca.nastran.TrimParameter')
            if strcmp(trim_obj.Type,'Rigid Body')
                mni.printing.cards.AESTAT(i,trim_obj.Name).writeToFile(fid);
            end
        end    
    end    

    % create boundary conditions
    write_boundary_conditions(obj,fid)

    %write gravity card
    mni.printing.cards.GRAV(11,obj.g*obj.LoadFactor,obj.Grav_Vector)...
        .writeToFile(fid);

    % write aero constants
    mni.printing.cards.AEROS(obj.RefChord,obj.RefSpan,obj.RefArea,ACSID=obj.ACSID).writeToFile(fid);

    % set trim values (NAN is free and will not be included in trim card)
    labels = [];
    for i = 1:length(param_names)
        trim_obj = obj.(param_names{i});
        if isa(trim_obj,'laca.nastran.TrimParameter')
            if ~isempty(trim_obj.Link)
                mni.printing.cards.AELINK(trim_obj.Name,{trim_obj.Link}).writeToFile(fid);
            elseif ~isnan(trim_obj.Value)
                labels = [labels,{trim_obj.Name},{trim_obj.Value}];
            end
        end    
    end
    
    % write trim card
    Q = 0.5*obj.rho*obj.V^2;
    t_card= mni.printing.cards.TRIM(obj.TrimID,obj.Mach,Q,...
        labels(:),'AEQR',obj.AEQR);    
    t_card.writeToFile(fid)
    fclose(fid);
end

