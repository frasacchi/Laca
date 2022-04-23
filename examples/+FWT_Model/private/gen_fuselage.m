function obj = gen_fuselage()

    % create vertical surface
    LE = [-0.3,0,-0.3;...
        0,0,0;...
        -0.153,-0.2445,-0.426];
    LE = LE - [-1.460 0 -0.288]';
    chord = [2,3,2];
    TE = LE; TE(1,:) = TE(1,:) - chord;
    
    %create object
    obj(1) = laca.model.Wing.From_LE_TE(LE,TE,[]);
    obj(1).Name = 'fuselage_vert';
    
    % create horizontal surface
    LE = [-0.3,0,-0.3;...
        -0.1367,0,0.1367;...
        -0.2445,-0.2445,-0.2445];
    LE = LE + [1.460 0 0.288]';
    chord = [2,3,2];
    TE = LE; TE(1,:) = TE(1,:) - chord;
    
    %create object
    obj(2) = laca.model.Wing.From_LE_TE(LE,TE,[]);
    obj(2).Name = 'fuselage_hor';
end

