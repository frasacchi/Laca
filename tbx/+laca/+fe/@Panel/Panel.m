classdef Panel < matlab.mixin.Heterogeneous
properties
    X1;
    X2;
    Chord1;
    Chord2;
    Normalwash1;
    Normalwash2;
    ClFactor1;
    ClFactor2;
    CmFactor1;
    CmFactor2;
    Density;
    SplineSet;
    ID;
    Name;
    IGID;
end

properties(Dependent = true)
    NSpan;
    NChord;
    NPanels;
    MaxID;
    IDs;
    Normalwash;
    Wkk;
end

methods
    function obj = Panel(X1,X2,Chord1,Chord2,varargin)
        %PANEL Construct an instance of this class
        %   Detailed explanation goes here
        p = inputParser;
        p.addParameter('Density',0.02);
        p.addParameter('SplineSet',[]);
        p.addParameter('ID',[]);
        p.addParameter('Name',[]);
        p.addParameter('IGID',999);
        p.addParameter('Normalwash1',0)
        p.addParameter('Normalwash2',0)
        p.addParameter('ClFactor1',1)
        p.addParameter('ClFactor2',1)
        p.addParameter('CmFactor1',1)
        p.addParameter('CmFactor2',1)
        p.parse(varargin{:})

        for name = string(p.Parameters)
        obj.(name) = p.Results.(name);
        end

        obj.X1 = X1;
        obj.X2 = X2;
        obj.Chord1 = Chord1;
        obj.Chord2 = Chord2;
    end
    
    function cards = generate_aero_cards(obj)   
        cards = mni.printing.cards.BaseCard.empty;
        cards(end+1) = mni.printing.cards.PAERO1(obj.ID);
        cards(end+1) = mni.printing.cards.CAERO1(obj.ID,obj.ID,...
            obj.X1,obj.X2,obj.Chord1,obj.Chord2,obj.IGID,...
            'NSPAN',obj.NSpan,'NCHORD',obj.NChord);
    end
    
    function cards = generate_spline_cards(obj)
        cards = mni.printing.cards.BaseCard.empty;
        cards(end+1) = mni.printing.cards.SET1(obj.ID+1e6,obj.SplineSet);
%         cards(end+1) = mni.printing.cards.SPLINE1(obj.ID+1e6,'CAERO',obj.ID,...
%             'BOX1',obj.ID,'BOX2',obj.ID+obj.NPanels-1,'SETG',obj.ID+1e6);

        cards(end+1) = mni.printing.cards.AELIST(obj.ID+1e6+1,obj.IDs);
        cards(end+1) = mni.printing.cards.SPLINE4(obj.ID+1e6,...
            obj.ID,obj.ID+1e6+1,obj.ID+1e6);
    end
    
end

methods
    function out = get.NSpan(obj)
        out = ceil(norm(obj.X2(2:3)-obj.X1(2:3))/obj.Density);
    end
    function out = get.NChord(obj)
        out = ceil(mean([obj.Chord1,obj.Chord2])/obj.Density);
    end
    function out = get.NPanels(obj)
        out = obj.NSpan * obj.NChord;
    end
    function out = get.MaxID(obj)
        out = obj.ID + obj.NPanels - 1;
    end
    function out = get.IDs(obj)
        out = (obj.ID:obj.MaxID)';
    end
    function out = get.Normalwash(obj)
        % calc normalwash with span
        span_wash = linspace(obj.Normalwash1,obj.Normalwash2,obj.NSpan+2);
        span_wash = span_wash(2:end-1);
        
        %repeat for each chordwise position
        out = repmat(span_wash,obj.NChord,1);
        out = out(:);
    end
    function wkk = get.Wkk(obj)
        % calc wkk with span
        cl = linspace(obj.ClFactor1,obj.ClFactor2,obj.NSpan+2);
        cl = cl(2:end-1);
        
        cm = linspace(obj.CmFactor1,obj.CmFactor2,obj.NSpan+2);
        cm = cm(2:end-1);
        
        wkk = {};
        for i = 1:length(cl)
           wkk{i} = [cl(i),cm(i)]; 
        end
        
        %repeat for each chordwise position
        wkk = repmat(wkk',obj.NChord,1);        
    end
end
end

