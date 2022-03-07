function write_support(obj,fid)
    % create constraint GP
    mni.printing.bdf.writeSubHeading(fid,'Model Constraint');
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    mni.printing.cards.GRID(obj.ConstraintGP,...
        obj.ConstraintLocation).writeToFile(fid);
    mni.printing.cards.RBE2(obj.ConstraintGP,...
        obj.ConstraintGP,123456,obj.ConstraintAttachmentGP)...
        .writeToFile(fid);

    Locked_DoFs = laca.nastran.inv_dof(obj.DoFs);
    if ~isempty(Locked_DoFs)
        mni.printing.cards.SPC1(100001,Locked_DoFs,obj.ConstraintGP)...
            .writeToFile(fid);
    end
    if ~isempty(obj.DoFs)
        mni.printing.cards.SUPORT(obj.ConstraintGP,obj.DoFs)...
            .writeToFile(fid);    
    end
end

