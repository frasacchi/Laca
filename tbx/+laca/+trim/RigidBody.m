classdef RigidBody < laca.trim.BaseDoF
    properties
       ID 
    end
    
    methods
        function obj = RigidBody(name,value,ID)
            obj = obj@laca.trim.BaseDoF(name,value);
            obj.ID = ID;
        end
        function writeToFile(obj,fid)
            mni.printing.cards.AESTAT(obj.ID,obj.Name).writeToFile(fid);
        end
    end
    
end

