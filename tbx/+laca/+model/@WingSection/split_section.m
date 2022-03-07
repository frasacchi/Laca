function [wingSections] = split_section(obj,varargin)
%SPLIT_SECTION Summary of this function goes here
%   Detailed explanation goes here
p = inputParser;
p.addParameter('MaxWidth',0.2);
p.addParameter('pos',[]);
p.parse(varargin{:});

span = norm(obj.LE(:,2)-obj.LE(:,1));
if span < p.Results.MaxWidth
    wingSections = obj;
else
    if isempty(p.Results.pos)
        panels = ceil(span/p.Results.MaxWidth);
        pos = linspace(0,1,panels+1);
    else
        pos = p.Results.pos;
    end
    LEDir = obj.LE(:,2)-obj.LE(:,1);
    TEDir = obj.TE(:,2)-obj.TE(:,1);
    
    [LE,TE] = deal(zeros(3,panels+1));
    [Normalwash,ClCorrection,CmCorrection] = deal(zeros(1,panels+1));
    for i = 1:length(pos)
       LE(:,i) =  obj.LE(:,1)+LEDir*pos(i);
       TE(:,i) =  obj.TE(:,1)+TEDir*pos(i);
       Normalwash(i) = obj.Normalwash(:,1) + (obj.Normalwash(:,2)-obj.Normalwash(:,1))*pos(i);
       ClCorrection(i) = obj.ClCorrection(:,1) + (obj.ClCorrection(:,2)-obj.ClCorrection(:,1))*pos(i);
       CmCorrection(i) = obj.CmCorrection(:,1) + (obj.CmCorrection(:,2)-obj.CmCorrection(:,1))*pos(i);
    end
    
    clear wingSections
    for i = 1:panels
        wingSections(i) = laca.model.WingSection(LE(:,i:i+1),TE(:,i:i+1),...
            'Normalwash',Normalwash(i:i+1),...
            'ClCorrection',ClCorrection(i:i+1),...
            'CmCorrection',CmCorrection(i:i+1));
    end
end

end

