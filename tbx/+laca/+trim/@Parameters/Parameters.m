classdef Parameters
    %PARAMETERS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        ANGLEA = laca.trim.RigidBody('ANGLEA',0,1);
        SIDES = laca.trim.RigidBody('SIDES',0,2);
        PITCH = laca.trim.RigidBody('PITCH',0,3);
        ROLL = laca.trim.RigidBody('ROLL',0,4);
        YAW = laca.trim.RigidBody('YAW',0,5);
        URDD1 = laca.trim.RigidBody('URDD1',0,6);
        URDD2 = laca.trim.RigidBody('URDD2',0,7);
        URDD3 = laca.trim.RigidBody('URDD3',0,8);
        URDD4 = laca.trim.RigidBody('URDD4',0,9);
        URDD5 = laca.trim.RigidBody('URDD5',0,10);
        URDD6 = laca.trim.RigidBody('URDD6',0,11);
        
        ControlLinks = laca.trim.ControlLink.empty
        
        
        LoadFactor = 1;
        g = 9.81;
        GravVector = [0 0 -1];
        DoFs = [];
        V = 0;
        rho = 0;
        Mach = 0;
        AEQR = 1;
        FreqRange = [0.01,25];
        FlutterMethod = 'PK';
        
        ConstraintLocation = [0 0 0];
        ConstraintAttachmentGP = 1;
        ConstraintGP = 99999999;
        
        RefChord = 1;
        RefDensity = 1.225;
        RefSpan = 4;
        RefWingArea = 1;
        
        TrimCaseID = 100001;
        FMETHOD = 4;
    end
    
    methods
        function obj = Parameters(V,rho,Mach)
            obj.V = V;
            obj.rho = rho;
            obj.Mach = Mach;
        end
    end
    methods(Static)
        function obj = SteadyLevel(V,rho,Mach)
            obj = gen.TrimParameters(V,rho,Mach);
            obj.ANGLEA.Value = NaN;
            obj.DoFs = 35;
        end
        function obj = Locked(V,rho,Mach)
            obj = gen.TrimParameters(V,rho,Mach);
            obj.DoFs = [];
        end
    end
end

