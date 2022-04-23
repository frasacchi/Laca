function obj = gen_FWT52(flare,fold,isRight)
    LE = [-0.303,-0.603;...
        1.297,1.9;...
        0,-0.053];
    chord = [0.127,0.0196];
    twist = [-1.38,-6.20];
    twist = twist + 3.66; % root setting angle
    twist = twist + 2.59; % CL_0 angle
    
    [LE,TE] = gen_FWT(LE,chord,twist,flare,fold);
    
    if isRight
       Name = 'Right FWT';
       range = 823:827;
    else
        LE(2,:) = -1 * LE(2,:); 
        TE(2,:) = -1 * TE(2,:);
        LE = fliplr(LE);
        TE = fliplr(TE);
        Name = 'Left FWT';
        range = 1823:1827;
    end
    GridIDS = [range,range+100e3,range+200e3];
    %create object   
    obj = laca.model.Wing.From_LE_TE(LE,TE,laca.model.RefControlSurf.empty);
    obj.Name = Name;
    obj.GridIDs = GridIDS;
end

