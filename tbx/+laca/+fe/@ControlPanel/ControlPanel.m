classdef ControlPanel < laca.fe.Panel
    %CONTROLSURF Summary of this class goes here
    %   Detailed explanation goes here    
    methods
        function cards = generate_aero_cards(obj) 
            cards = generate_aero_cards@laca.fe.Panel(obj);
            cards(end+1) = mni.printing.cards.AELIST(obj.ID,...
                (obj.ID:obj.ID+obj.NPanels-1));
            cards(end+1) = mni.printing.cards.AESURF(obj.ID,obj.Name,...
                                obj.ID,obj.ID);
            % create coordinate system for control surface
            y_vec = obj.X2-obj.X1;
            z_vec = cross([1 0 0]',y_vec);
            x_vec = cross(y_vec,z_vec);
            cards(end+1) = mni.printing.cards.CORD2R(obj.ID,obj.X1,...
                obj.X1 + z_vec,obj.X1+x_vec);
        end
    end
end

