function obj = gen_FWT45(flare,fold,wingtipTwist,isRight)
    LE = [0,0,0,0,0;...
        365,400,425,450,500;...
        0,0,0,0,0] * 1e-3;
    chord = [80,80,80,80,80] * 1e-3;
    twist = [0 0 0 wingtipTwist wingtipTwist];
    
    % create mass objects
    
    
    [LE,TE] = FWT_Model.gen_FWT(LE,chord,twist,flare,fold);
    
    if isRight
       Name = 'Right FWT';
%        range = 823:827;
    else
        LE(2,:) = -1 * LE(2,:); 
        TE(2,:) = -1 * TE(2,:);
        LE = fliplr(LE);
        TE = fliplr(TE);
        Name = 'Left FWT';
%         range = 1823:1827;
    end
%     GridIDS = [range,range+100e3,range+200e3];
    %create object   
    obj = laca.model.Wing.From_LE_TE(LE,TE,laca.model.RefControlSurf.empty);
    obj.Name = Name;
%     obj.GridIDs = GridIDS;
end

