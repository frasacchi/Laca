classdef BaseTrimParameters < handle & matlab.mixin.Copyable
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        ANGLEA = laca.nastran.TrimParameter('ANGLEA',0,'Rigid Body');
        SIDES = laca.nastran.TrimParameter('SIDES',0,'Rigid Body');
        PITCH = laca.nastran.TrimParameter('PITCH',0,'Rigid Body');
        ROLL = laca.nastran.TrimParameter('ROLL',0,'Rigid Body');
        YAW = laca.nastran.TrimParameter('YAW',0,'Rigid Body');
        URDD1 = laca.nastran.TrimParameter('URDD1',0,'Rigid Body');
        URDD2 = laca.nastran.TrimParameter('URDD2',0,'Rigid Body');
        URDD3 = laca.nastran.TrimParameter('URDD3',0,'Rigid Body');
        URDD4 = laca.nastran.TrimParameter('URDD4',0,'Rigid Body');
        URDD5 = laca.nastran.TrimParameter('URDD5',0,'Rigid Body');
        URDD6 = laca.nastran.TrimParameter('URDD6',0,'Rigid Body');
        
        LoadFactor = 1;
        DoFs = [];
        V = 0;
        rho = 0;
        Mach = 0;
        AEQR = 1;
        ACSID = [];
        
        RefChord = 1;
        RefSpan = 1;
        RefArea = 1;
        RefDensity = 1.225;
        LModes = 0;
        TrimID = 1;

        FreqRange = [0.01,50];
        NFreq = 500;
        ModalDampingPercentage = 0;

        FlutterMethod = 'PK';
        FlutterID = 4;
        Flfact_mach_id = 2;
        Flfact_v_id = 3;
        Flfact_rho_id = 1;

        GustFreq = [];
        GustLength = [];
        GustType = 'Freq';
        GustAmplitude = [];
        GustDuration = 8;
        GustTstep = 0.01;
        GustTdelay = 0.2;
        CoM_gp = 1;
        CoM_GID = 99999999;
        CoM_Cp = [];
        CoM = [0;0;0];
        Grav_Vector = [0;0;-1];
        g = 9.80665;
    end
    
    methods
        function set_trim_steadyLevel(obj,V,rho,Mach)
            obj.V = V;
            obj.rho = rho;
            obj.Mach = Mach;
            obj.ANGLEA.Value = NaN;
            obj.URDD3.Value = 0;
            obj.DoFs = 35;
        end
        function set_trim_locked(obj,V,rho,Mach)
            obj.V = V;
            obj.rho = rho;
            obj.Mach = Mach;
            obj.ANGLEA.Value = 0;
            obj.DoFs = [];
        end
    end
end

