function [panels] = split_chordwise(obj,varargin)
    p = inputParser;
    p.addParameter('NChord',5);
    p.parse(varargin{:})
    
    NChord = p.Results.NChord;
    c_spacing = linspace(0,1,NChord+1);    
    panels = laca.model.WingSection.empty;
    for i = 1:NChord
        DA = obj.RefNodes(c_spacing(i));
        CB = obj.RefNodes(c_spacing(i+1));
        panels(i) = laca.model.WingSection(DA,CB,'Name',obj.Name,...
            'Normalwash',obj.Normalwash,...
            'ClCorrection',obj.ClCorrection,...
            'CmCorrection',obj.CmCorrection);
    end
    
end

