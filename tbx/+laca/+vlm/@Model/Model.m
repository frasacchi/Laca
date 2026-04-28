classdef Model < laca.vlm.Base
    %MODEL Summary of this class goes here
    %   Detailed explanation goes here

    properties
        useMEX = false;
        TENodes;
        TERings;
        TEidx;
        MAC;
        U = []; % state vector

        Filiment_Force;
        Filiment_Position;
        Panel_Filiments;

        AIC;
        AIC3D;
        updateAIC = false;

        Gamma;
        V;
        V_i;
        V_col;

        isStitch = true;

        HasKatzResult = false;
        HasFilResult = false;
        Name = '';
        Wings;
        XZ_sym = false;
        Nchords;
    end

    properties
        Filiment_tol = 0.2;
    end

    properties(Access = private)
        Panels_cache;
    end

    properties(Dependent)
        N;
        L;
        D;
        S;
        F;
        Lprime;
        P;
        Cp;
        Cl;
        Cd;
    end

    properties(Dependent)
        dC_l_dalpha
        NPanels
        Centroid
        Panels
        Nodes
        SuperNodes
        PanelNormal
        StripIDs
        isTE
        isLE
        Normalwash
        Area
        PanelChord;
        PanelSpan;
        Connectivity;
        RingNodes;
        Normal;
        Collocation;
    end
    methods 
        function cp = copy(obj)
            % Shallow copy object
            cp = laca.vlm.Model(cellfun(@(x)x.copy,obj.Wings,'UniformOutput',false));
            cp.useMEX = obj.useMEX;
            cp.TENodes = obj.TENodes;
            cp.TERings = obj.TERings;
            cp.TEidx = obj.TEidx;
            cp.Filiment_Force= obj.Filiment_Force;
            cp.Filiment_Position = obj.Filiment_Position;
            cp.Panel_Filiments = obj.Panel_Filiments;
            cp.AIC = obj.AIC;
            cp.AIC3D = obj.AIC3D;
            cp.Gamma = obj.Gamma;
            cp.V = obj.V;
            cp.V_i = obj.V_i;
            cp.V_col = obj.V_col;
            cp.HasKatzResult = obj.HasKatzResult;
            cp.HasFilResult = obj.HasFilResult;
            cp.Name = obj.Name;
            cp.Filiment_tol = obj.Filiment_tol;
        end
    end

    %dependent properties
    methods
        function set.useMEX(obj,val)
            obj.useMEX = val;
            for i = 1:length(obj.Wings)
                obj.Wings{i}.useMEX = val;
            end
        end
        function set.U(obj,val)
            obj.U = val;
            for i = 1:length(obj.Wings)
                obj.Wings{i}.U = val;
            end
        end
        function val = get.NPanels(obj)
            val = sum(cellfun(@(x)x.NPanels,obj.Wings));
        end
        function val = get.Connectivity(obj)
            res = cellfun(@(x)x.Connectivity,obj.Wings,'UniformOutput',false);
            val = cat(2,res{:});
            np = cellfun(@(x)x.NPanels,obj.Wings);
            idx = cumsum([0,np]);
            for i = 1:length(np)
                val(:,idx(i)+1:idx(i+1)) = val(:,idx(i)+1:idx(i+1)) + ...
                    repmat(idx(i),4,np(i));
            end
        end
        function val = get.PanelChord(obj)
            res = cellfun(@(x)x.PanelChord,obj.Wings,'UniformOutput',false);
            val = cat(1,res{:});
        end
        function val = get.PanelSpan(obj)
            res = cellfun(@(x)x.PanelSpan,obj.Wings,'UniformOutput',false);
            val = cat(1,res{:});
        end
        function val = get.Centroid(obj)
            res = cellfun(@(x)x.Centroid,obj.Wings,'UniformOutput',false);
            val = cat(2,res{:});
        end
        function val = get.Panels(obj)
            if ~isempty(obj.Panels_cache)
                val = obj.Panels_cache;
            else
            res = cellfun(@(x)x.Panels,obj.Wings,'UniformOutput',false);
            val = cat(2,res{:});
            np = cellfun(@(x)x.NPanels,obj.Wings);
            node_idx = cumsum([0,cellfun(@(x)x.NNodes,obj.Wings)]);
            idx = cumsum([0,np]);
            for i = 1:length(np)
                val(:,idx(i)+1:idx(i+1)) = val(:,idx(i)+1:idx(i+1)) + ...
                    repmat(node_idx(i),4,np(i));
            end
            obj.Panels_cache = val;
            end
        end
        function val = get.F(obj)
            res = cellfun(@(x)x.F,obj.Wings,'UniformOutput',false);
            val = cat(2,res{:});
        end
        function val = get.N(obj)
            res = cellfun(@(x)x.N,obj.Wings,'UniformOutput',false);
            val = cat(1,res{:});
        end
        function val = get.L(obj)
            res = cellfun(@(x)x.L,obj.Wings,'UniformOutput',false);
            val = cat(1,res{:});
        end
        function val = get.D(obj)
            res = cellfun(@(x)x.D,obj.Wings,'UniformOutput',false);
            val = cat(1,res{:});
        end
        function val = get.S(obj)
            res = cellfun(@(x)x.S,obj.Wings,'UniformOutput',false);
            val = cat(1,res{:});
        end
        function val = get.Lprime(obj)
            res = cellfun(@(x)x.Lprime,obj.Wings,'UniformOutput',false);
            val = cat(1,res{:});
        end
        function val = get.P(obj)
            res = cellfun(@(x)x.P,obj.Wings,'UniformOutput',false);
            val = cat(1,res{:});
        end
        function val = get.Cp(obj)
            res = cellfun(@(x)x.Cp,obj.Wings,'UniformOutput',false);
            val = cat(1,res{:});
        end
        function val = get.Cl(obj)
            res = cellfun(@(x)x.Cl,obj.Wings,'UniformOutput',false);
            val = cat(1,res{:});
        end
        function val = get.Cd(obj)
            res = cellfun(@(x)x.Cd,obj.Wings,'UniformOutput',false);
            val = cat(1,res{:});
        end
        function val = get.Nodes(obj)
            res = cellfun(@(x)x.Nodes,obj.Wings,'UniformOutput',false);
            val = cat(2,res{:});
        end
        function val = get.SuperNodes(obj)
            res = cellfun(@(x)x.SuperNodes,obj.Wings,'UniformOutput',false);
            val = cat(2,res{:});
        end
        function val = get.RingNodes(obj)
            res = cellfun(@(x)x.RingNodes,obj.Wings,'UniformOutput',false);
            val = cat(2,res{:});
        end
        function val = get.Collocation(obj)
            res = cellfun(@(x)x.Collocation,obj.Wings,'UniformOutput',false);
            val = cat(2,res{:});
        end
        function val = get.Normal(obj)
            res = cellfun(@(x)x.Normal,obj.Wings,'UniformOutput',false);
            val = cat(2,res{:});
        end
        function val = get.isTE(obj)
            res = cellfun(@(x)x.isTE,obj.Wings,'UniformOutput',false);
            val = cat(1,res{:});
        end
        function val = get.isLE(obj)
            res = cellfun(@(x)x.isLE,obj.Wings,'UniformOutput',false);
            val = cat(1,res{:});
        end
        function val = get.Normalwash(obj)
            res = cellfun(@(x)x.Normalwash,obj.Wings,'UniformOutput',false);
            val = cat(1,res{:});
        end
        function val = get.Area(obj)
            res = cellfun(@(x)x.Area,obj.Wings,'UniformOutput',false);
            val = cat(1,res{:});
        end
        function val = get.dC_l_dalpha(obj)
            val = cat(1,obj.Wings.dC_l_dalpha);
        end
        function val = get.MAC(obj)
            % Calculates the global Mean Aerodynamic Chord (MAC) by taking the
            % area-weighted average of every DLM panel's chord.
            res1 = cellfun(@(x)x.MAC,obj.Wings,'UniformOutput',false);
            MAC = cat(1,res1{:});
            res2 = cellfun(@(x)sum(x.Area),obj.Wings,'UniformOutput',false);
            Area = cat(1,res2{:});
            val = sum(MAC .* Area) / sum(Area);
        end
        function val = get.StripIDs(obj)
            Con = obj.Connectivity;
            idx = 1;
            val = {};
            for i = 1:size(Con,2)
                if isnan(Con(1,i))
                    strip = [i];
                    while ~isnan(Con(3,strip(end)))
                        strip = [strip,Con(3,strip(end))];
                    end
                    val{idx} = strip;
                    idx = idx + 1;
                end
            end
        end
    end

    methods
        function ClearCache(obj)
            obj.Panels_cache = [];
        end
        function val = Get_Prop(obj,propName)
            val = zeros(obj.NPanels,1);
            idx = 1;
            for i = 1:length(obj.Wings)
                N = obj.Wings{i}.NPanels;
                val(idx:idx+N-1) = obj.Wings{i}.(propName);
                idx = idx + N;
            end
        end
        function val = Vbody(obj,U)
            val = [];
            for i = 1:length(obj.Wings)
                val = [val,obj.Wings{i}.Vbody(U)];
            end
        end
        function res = get_forces_and_moments(obj,p)
            %get_forces_and_moments get forces and moments about point p
            if obj.HasKatzResult
                L_wings = obj.Normal .* repmat(obj.Get_Prop('L')',3,1);
                pos = obj.Collocation;
            elseif obj.HasFilResult
                L_wings = obj.Filiment_Force;
                pos = laca.vlm.panel_compass(obj.Panels,obj.RingNodes);
            else
                error('No result')
            end
            F_wings = sum(L_wings,2);
            M = sum(cross(pos-p,L_wings),2);
            res = [F_wings;M];
        end

        function obj = set_panel_filiments(obj)
            if obj.useMEX
                [obj.Filiment_Position,obj.Panel_Filiments] = ...
                    laca.vlm.vlm_C_code('laca.vlm.get_perimeter_filiments',...
                    obj.Panels,obj.RingNodes,obj.Filiment_tol,obj.isTE);
            else
                [obj.Filiment_Position,obj.Panel_Filiments] = ...
                    laca.vlm.get_perimeter_filiments(...
                    obj.Panels,obj.RingNodes,obj.Filiment_tol,obj.isTE);
            end
        end

        function obj = apply_result_katz(obj,rho)
            if isempty(obj.Gamma)
                error('VLM model must first be solved to apply result')
            end
            idx = 1;
            for i = 1:length(obj.Wings)
                N = obj.Wings{i}.NPanels;
                obj.Wings{i}.apply_result_katz(obj.Gamma(idx:idx+N-1),obj.V,rho);
                idx = idx + N;
            end
            obj.HasKatzResult = true;
            obj.HasFilResult = false;
        end

        function obj = solve(obj,V,U)
            if isa(V,'function_handle')
                obj.V = V;
            elseif length(V) == 1
                obj.V = @(X)[ones(1,size(X,2))*-V;zeros(2,size(X,2))];
            elseif length(V) == 3
                obj.V = @(X)repmat(V(:),1,size(X,2));
            else
                error('Unsupported V')
            end

            if exist('U','var')
                obj.V_col = obj.V(obj.Collocation) - obj.Vbody(U);
            else
                obj.V_col = obj.V(obj.Collocation);
            end

            if obj.updateAIC || isempty(obj.AIC)
                obj.set_panel_filiments();
                obj.generate_te_horseshoe(100*obj.MAC*obj.V([0,0,0]')/norm(obj.V([0,0,0]')));
                obj.generate_AIC3D();
            end

            if obj.useMEX
                obj.Gamma = laca.vlm.vlm_C_code('laca.vlm.get_gamma',obj.V_col,obj.Normal,obj.Normalwash,obj.AIC);
            else
                obj.Gamma = laca.vlm.get_gamma(obj.V_col,obj.Normal,obj.Normalwash,obj.AIC);
            end
        end

        function obj = Stitch(obj)
            obj.Wings = cellfun(@(x)x.Stitch,obj.Wings,'UniformOutput',false);
        end

        function obj = CombineWings(obj,idx)
            idx_to_keep = setdiff(1:length(obj.Wings),idx);
            new_wing = laca.vlm.Wing([obj.Wings{idx}.Sections]);
            obj.Wings = {new_wing,obj.Wings{idx_to_keep}};
        end

        function obj = Model(Wings,varargin)
            if ~iscell(Wings)
                error('Input must be a cell array of WingSections')
            end
            for i = 1:length(Wings)
                if ~isa(Wings{i},'laca.vlm.Wing')
                    error('Input must be a cell array of WingSections')
                end
            end
            obj.Wings = Wings;
        end

        % function plt_obj = draw(obj,varargin)
        %     p = inputParser;
        %     p.addParameter('param','')
        %     p.addParameter('PatchArgs',{})
        %     p.addParameter('Rotate',eye(3))
        %     p.parse(varargin{:})
        %     clear plt_obj
        %     nodes = p.Results.Rotate*obj.Nodes;
        %     func = @(n)reshape(nodes(n,obj.Panels),4,[]);
        %     plt_obj(1) = patch(func(1),func(2),func(3),'b',p.Results.PatchArgs{:});
        %     %             plt_obj(1).FaceAlpha = 0.6;
        %     if (obj.HasKatzResult || obj.HasFilResult) && ~isempty(p.Results.param)
        %         plt_obj.FaceVertexCData = obj.Get_Prop(p.Results.param);
        %         plt_obj.FaceColor = 'flat';
        %         colormap('parula');
        %         max_val = max(abs(plt_obj.FaceVertexCData));
        %         if max_val==0 max_val = 1; end
        %         caxis([-max_val, max_val]);
        %         cb = colorbar;
        %         cb.Label.String = p.Results.param;
        %     end
        % end

        function plt_obj = draw(obj,varargin)
            p = inputParser;
            p.addParameter('param','')
            p.addParameter('PatchArgs',{})
            p.addParameter('Rotate',eye(3))
            p.parse(varargin{:})
            clear plt_obj
            
            nodes = p.Results.Rotate * obj.Nodes;
            func = @(n)reshape(nodes(n,obj.Panels),4,[]);

            plt_obj(1) = patch(func(1), func(2), func(3), 'w', p.Results.PatchArgs{:});
            % plt_obj(1).FaceAlpha = 0.6;
            N_panels = size(obj.Panels, 2);
            
            % Define your RGB colors [R, G, B]
            color_default = [0.2, 0.2, 0.8]; % Blue
            color_LE      = [0.8, 0.2, 0.2]; % Red
            color_TE      = [0.2, 0.8, 0.2]; % Green
            panel_colors = repmat(color_default, N_panels, 1);
            le_idx = obj.isLE(:);
            te_idx = obj.isTE(:);
            
            % Apply LE and TE colors based on your logical arrays
            panel_colors(le_idx, :) = repmat(color_LE, sum(le_idx), 1);
            panel_colors(te_idx, :) = repmat(color_TE, sum(te_idx), 1);
            
            plt_obj(1).FaceVertexCData = panel_colors;
            plt_obj(1).FaceColor = 'flat';

            if (obj.HasKatzResult || obj.HasFilResult) && ~isempty(p.Results.param)
                plt_obj(1).FaceVertexCData = obj.Get_Prop(p.Results.param);
                plt_obj(1).FaceColor = 'flat';
                colormap('parula');
                max_val = max(abs(plt_obj(1).FaceVertexCData));
                if max_val == 0
                    max_val = 1; 
                end
                caxis([-max_val, max_val]);
                cb = colorbar;
                cb.Label.String = p.Results.param;
            else
                h_le  = patch(NaN, NaN, 'w', 'FaceColor', color_LE, 'EdgeColor', 'k');
                h_te  = patch(NaN, NaN, 'w', 'FaceColor', color_TE, 'EdgeColor', 'k');
                
                legend([h_le, h_te], {'LE', 'TE'}, ...
                    'Location', 'best', 'AutoUpdate', 'off');
            end
        end

        % function plt_obj = draw_streamline(obj, point, varargin)
        %     p = inputParser;
        %     p.addParameter('iter', 500);
        %     p.addParameter('timeStep', 1e-3);
        %     p.addParameter('Rotate', eye(3));
        %     p.addParameter('Method', 'RK4'); % Defaulted to RK4 for better stability
        %     p.parse(varargin{:});

        %     % Enforce column vector
        %     point = point(:); 

        %     if isempty(obj.Gamma)
        %         error('Model must be solved (obj.Gamma is empty) before drawing streamlines.');
        %     end

        %     iter = p.Results.iter;
        %     dt = p.Results.timeStep;
        %     rot = p.Results.Rotate;
            
        %     res = zeros(3, iter + 1);
        %     res(:, 1) = point;
            
        %     for i = 1:iter
        %         X_current = res(:, i);
                
        %         if strcmpi(p.Results.Method, 'RK4')
        %             % Runge-Kutta 4th Order
        %             k1 = get_total_velocity(X_current);
        %             k2 = get_total_velocity(X_current + 0.5 * dt * k1);
        %             k3 = get_total_velocity(X_current + 0.5 * dt * k2);
        %             k4 = get_total_velocity(X_current + dt * k3);
                    
        %             res(:, i+1) = X_current + (dt / 6) * (k1 + 2*k2 + 2*k3 + k4);
        %         else
        %             % Forward Euler
        %             res(:, i+1) = X_current + get_total_velocity(X_current) * dt;
        %         end
        %     end

        %     res = rot * res;
            
        %     was_held = ishold;
        %     hold on;
        %     plt_obj = plot3(res(1,:)', res(2,:)', res(3,:)', 'r-', 'LineWidth', 1.5);
        %     if ~was_held
        %         hold off;
        %     end

        %     % helpers
        %     function v_tot = get_total_velocity(X)
        %         % Freestream (reversed sign as per original logic) + induced velocity
        %         v_tot = -obj.V(X) + get_induced_velocity(X);
        %     end

        %     function v_ind = get_induced_velocity(X)
        %         v_ind = zeros(3,1);
                
        %         % 1. Influence of bound vortex rings
        %         for j = 1:size(obj.Panels, 2)
        %             coords = obj.RingNodes(:, obj.Panels(:,j));
        %             v = laca.vlm.vortex_ring(coords, X, 1);
        %             if obj.XZ_sym
        %                 col_sym = [X(1); -X(2); X(3)];
        %                 v_tmp = laca.vlm.vortex_ring(coords, col_sym, 1);
        %                 v = v + [v_tmp(1); -v_tmp(2); v_tmp(3)];
        %             end
        %             v_ind = v_ind + v * obj.Gamma(j);
        %         end
                
        %         % 2. Influence of wake horseshoe panels
        %         for j = 1:size(obj.TEidx, 1)
        %             idx = obj.TEidx(j, 2);
        %             coords = obj.TENodes(:, obj.TERings(:,j));
        %             v = laca.vlm.horseshoe(coords, X, 1);
        %             if obj.XZ_sym
        %                 col_sym = [X(1); -X(2); X(3)];
        %                 v_tmp = laca.vlm.horseshoe(coords, col_sym, 1);
        %                 v = v + [v_tmp(1); -v_tmp(2); v_tmp(3)];
        %             end
        %             v_ind = v_ind + v * obj.Gamma(idx);
        %         end
        %     end
            
        % end

        function plt_obj = draw_rings(obj,opts)
            arguments
                obj
                opts.Rotate = eye(3);
                opts.DrawTE = true;
                opts.LineWidth = 2; 
            end

            ringNodes = opts.Rotate*obj.RingNodes;
            teNodes = opts.Rotate*obj.TENodes;

            collocation = opts.Rotate*obj.Collocation;

            if ~isempty(ringNodes)
                func = @(n)reshape(ringNodes(n,obj.Panels),4,[]);
                plt_obj(2) = patch(func(1),func(2),func(3),'b');
                plt_obj(2).FaceAlpha = 0;
                plt_obj(2).EdgeColor = [0 0 0];
                plt_obj(2).LineWidth = opts.LineWidth;

                if opts.DrawTE
                    func = @(n)reshape(teNodes(n,obj.TERings),4,[]);
                    plt_obj(3) = patch(func(1),func(2),func(3),'-b');
                    plt_obj(3).FaceAlpha = 0;
                    plt_obj(3).EdgeColor = [0 0 0];
                    plt_obj(3).LineWidth = opts.LineWidth*0.5;
                end
                hold on
                plt_obj(3) = plot3(collocation(1,:)',...
                    collocation(2,:)',collocation(3,:)','xr');
            end
        end

    end
    methods(Static)
        function obj = From_laca_model(lacaModel,minSpan,NChord,ignoreControlSurf,targetAR)
            if nargin < 5
                targetAR = [];
            end

            if isscalar(NChord)
                NChords = ones(1,length(lacaModel.Wings))*NChord;
            else
                NChords = NChord;
            end

            if isscalar(minSpan) || length(minSpan) ~= length(lacaModel.Wings)
                minSpan = ones(1,length(lacaModel.Wings))*minSpan(1);
            end
            wings = {};
            for i = 1:length(lacaModel.Wings)
                wings{i} = laca.vlm.Wing.From_laca_wing(lacaModel.Wings{i},minSpan(i),NChords(i),ignoreControlSurf,targetAR);
            end
            obj = laca.vlm.Model(wings);
            obj.Name = lacaModel.Name;
        end
    end
end

