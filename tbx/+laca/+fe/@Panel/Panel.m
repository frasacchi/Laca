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
    cDensity;
    sDensity;
    SplineSet;
    ID;
    Name;
    IGID;
    SETG = 0;
    PAero = 999;
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
    function obj = Panel(X1,X2,Chord1,Chord2,opts)
        arguments
            X1 double
            X2 double
            Chord1 double
            Chord2 double
            opts.cDensity double = 0.02
            opts.sDensity double = 0.02
            opts.SplineSet double = []
            opts.ID double = []
            opts.Name char = ''
            opts.IGID double = 999
            opts.Normalwash1 double = 0
            opts.Normalwash2 double = 0
            opts.ClFactor1 double = 1
            opts.ClFactor2 double = 1
            opts.CmFactor1 double = 1
            opts.CmFactor2 double = 1
            opts.NSpan = 0
            opts.NChord = 0
        end
        obj.X1 = X1;
        obj.X2 = X2;
        obj.Chord1 = Chord1;
        obj.Chord2 = Chord2;
        obj.cDensity = opts.cDensity;
        obj.sDensity = opts.sDensity;
        obj.SplineSet = opts.SplineSet;
        obj.ID = opts.ID;
        obj.Name = opts.Name;
        obj.IGID = opts.IGID;
        obj.Normalwash1 = opts.Normalwash1;
        obj.Normalwash2 = opts.Normalwash2;
        obj.ClFactor1 = opts.ClFactor1;
        obj.ClFactor2 = opts.ClFactor2;
        obj.CmFactor1 = opts.CmFactor1;
        obj.CmFactor2 = opts.CmFactor2;
        if opts.NSpan > 0
            obj.sDensity = norm(obj.X2(2:3)-obj.X1(2:3))/opts.NSpan;
        end
        if opts.NChord > 0
            obj.cDensity = mean([obj.Chord1,obj.Chord2])/opts.NChord;
        end
    end
    
    function cards = generate_aero_cards(obj)   
        cards = mni.printing.cards.BaseCard.empty;
        if obj.PAero == 0
            cards(end+1) = mni.printing.cards.PAERO1(obj.ID);
        end
        paero = obj.PAero
        cards(end+1) = mni.printing.cards.CAERO1(obj.ID,paero,...
            obj.X1,obj.X2,obj.Chord1,obj.Chord2,obj.IGID,...
            'NSPAN',obj.NSpan,'NCHORD',obj.NChord);
    end
    function cards = generate_spline1_cards(obj,varargin)
        cards = mni.printing.cards.SPLINE1(obj.ID,'CAERO',obj.ID,...
            'BOX1',obj.ID,'BOX2',obj.ID+obj.NPanels-1,'SETG',obj.SETG,varargin{;});
    end
    function cards = generate_spline4_cards(obj,varargin)
        cards(1) = mni.printing.cards.AELIST(obj.ID,obj.IDs);
        cards(2) = mni.printing.cards.SPLINE4(obj.ID,...
            obj.ID,obj.ID,obj.SETG,varargin{:});
    end
    function cards = generate_spline6_cards(obj,varargin)
        cards(1) = mni.printing.cards.AELIST(obj.ID,obj.IDs);
        cards(2) = mni.printing.cards.SPLINE6(obj.ID,...
            obj.ID,obj.ID,obj.SETG,varargin{:});
    end   
end
methods
    function obj = UpdateDensity(obj,opts)
        arguments
            obj
            opts.Independent = 'Chord'
            opts.N = 10;
            opts.Density = 0;
            opts.AspectRatio = 1;
        end
        switch opts.Independent
            case 'Chord'
                if opts.Density > 0
                    obj.cDensity = opts.Density;
                else
                    obj.cDensity = mean([obj.Chord1,obj.Chord2])/opts.N;
                end
                obj.sDensity = mean([obj.Chord1,obj.Chord2]) / obj.NChord * opts.AspectRatio;
            case 'Span'
                if opts.Density > 0
                    obj.sDensity = opts.Density;
                else
                    obj.sDensity = norm(obj.X2(2:3)-obj.X1(2:3))/opts.N;
                end
                obj.cDensity = norm(obj.X2(2:3)-obj.X1(2:3)) / obj.NSpan / opts.AspectRatio;
        end
    end
end

methods
    function out = get.NSpan(obj)
        out = ceil(norm(obj.X2(2:3)-obj.X1(2:3))/obj.sDensity);
    end
    function out = get.NChord(obj)
        out = ceil(mean([obj.Chord1,obj.Chord2])/obj.cDensity);
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

