function obj = gen_VTP()
    % define vtp
    LE = [-1.161,-1.482;...
        0,0;...
        -0.069,-0.448];
    chord = [0.35,0.122];
    TE = LE; TE(1,:) = TE(1,:) - chord;
    % Define Ailerons
    ailerons = laca.model.RefControlSurf(1,[0.32,0.393],'rud');

    %create object
    range = 2:10;
    obj = laca.model.Wing.From_LE_TE(LE,TE,ailerons);
    obj.Name = 'VTP';
    obj.GridIDs = [range+1e6,range+119e5,range+219e5];
end

