function obj = From_laca_section(wingSection,minSpan,NChord,ignoreControlSurf,targetAR)

    spanLE = norm(wingSection.LE(:,2)-wingSection.LE(:,1));
    spanTE = norm(wingSection.TE(:,2)-wingSection.TE(:,1));
    span = max(spanLE,spanTE);

    % Calculate average chord to determine nominal dx
    chord_root = norm(wingSection.TE(:,1)-wingSection.LE(:,1));
    chord_tip  = norm(wingSection.TE(:,2)-wingSection.LE(:,2));
    avg_chord  = (chord_root + chord_tip) / 2;
    avg_dx     = avg_chord / NChord;

    if ~isempty(targetAR)
        required_dy = targetAR * avg_dx;
        if required_dy < minSpan
            error('VLMMesh:MinSpanViolated', ...
                ['Target AR (%.2f) requires a panel width of %.3f, which is '...
                 'less than the allowed minSpan (%.3f), lower targetAR.'], ...
                targetAR, required_dy, minSpan);
        end
        NSpan = max(1, round(span / required_dy));
        if (span / NSpan) < minSpan
            NSpan = NSpan - 1; 
            if NSpan < 1
                 error('DLMMesh:ImpossibleConstraint', 'Cannot satisfy minSpan constraint for this section.');
            end
        end
    else
        NSpan = ceil(span/minSpan);
    end

    span_eta = linspace(0,1,NSpan+1);

    % chord_eta_LHS = unique([linspace(0,1,NChord+1),wingSection.Bpos]);
    % chord_eta_RHS = unique([linspace(0,1,NChord+1),wingSection.Bpos]);

    chord_eta_LHS = unique([linspace(0,1,NChord+1)]);
    chord_eta_RHS = unique([linspace(0,1,NChord+1)]);

    %update size of NChord
    NChord = length(chord_eta_RHS)-1;

    if wingSection.hasControlSurf && ~ignoreControlSurf
        NControl = 2;
        controlSurface = laca.vlm.ControlSurface(wingSection.ControlName,NControl);
        left_eta = 1-wingSection.ControlRefChord(1);
        right_eta = 1-wingSection.ControlRefChord(2);
        controlSurface.Deflection = wingSection.ControlDeflection;
        for i = 1:NChord+1
            if left_eta<chord_eta_LHS(i) || right_eta<chord_eta_RHS(i)
                chord_eta_LHS = linspace(0,left_eta,i-1);
                chord_eta_LHS = [chord_eta_LHS(1:end-1),linspace(left_eta,1,NControl+1)];
                chord_eta_RHS = linspace(0,right_eta,i-1);
                chord_eta_RHS = [chord_eta_RHS(1:end-1),linspace(right_eta,1,NControl+1)];
                NChord = NChord + NControl;
                break;
            end
        end
    else
        controlSurface = laca.vlm.ControlSurface.None;
    end

    LE = wingSection.LE_hid;
    LE_dir = LE(:,2)-LE(:,1);
    LEs = repmat(LE(:,1),1,NSpan + 1) + repmat(span_eta,3,1).*repmat(LE_dir,1,NSpan+1);

    TE = wingSection.TE_hid;
    TE_dir = TE(:,2)-TE(:,1);
    TEs = repmat(TE(:,1),1,NSpan + 1) + repmat(span_eta,3,1).*repmat(TE_dir,1,NSpan+1);

    normalwash_grad = wingSection.Normalwash(2)-wingSection.Normalwash(1);

    obj = laca.vlm.Section.From_LE_TE(LEs,TEs,chord_eta_LHS,chord_eta_RHS,...
        span_eta.*normalwash_grad + wingSection.Normalwash(1),controlSurface);
    obj.Name = wingSection.Name; 
    obj.R = wingSection.R;
    obj.Rot = wingSection.Rot;
end