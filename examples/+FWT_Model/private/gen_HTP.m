function obj = gen_HTP()
    LE = [-1.311,-1.544;...
        0.085,0.467;...
        0.006,-0.034];
    chord = [0.25,0.091];
    TE = LE; TE(1,:) = TE(1,:) - chord;
    % Define Ailerons
    ailerons = laca.model.RefControlSurf(1,[0.344,0.385],'elev');

    range = 1:11;
    %create object
    obj = laca.model.Wing.From_RHS_LE_TE(LE,TE,ailerons);
    obj.Name = 'HTP';
    obj.GridIDs = [range+9e6,range+905e4,range+19e6,range+29e6,range+1905e4,range+2905e4];
end

