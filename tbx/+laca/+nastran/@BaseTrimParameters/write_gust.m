function write_gust(obj,filename)
    fid = fopen(filename,'w+');
    mni.printing.bdf.writeFileStamp(fid);
    mni.printing.bdf.writeComment(fid,'This file contain the gust cards for a 146 solution')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    
    %% create boundary conditions
    write_boundary_conditions(obj,fid);
    
    %% create eigen solver and frequency bounds
    mni.printing.bdf.writeComment(fid,'Eigen Decomposition Method')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    mni.printing.cards.EIGR(910,'MGIV','F1',0,...
         'F2',obj.FreqRange(2),'NORM','MAX')...
         .writeToFile(fid);
%     mni.printing.cards.EIGR(10,'MGIV','ND',42,'NORM','MAX')...
%         .writeToFile(fid);

    % define frequency / modes of interest
    mni.printing.bdf.writeComment(fid,'Frequencies and Modes of Interest')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    mni.printing.cards.PARAM('LMODES','i',obj.LModes).writeToFile(fid);
    mni.printing.cards.PARAM('LMODESFL','i',obj.LModes).writeToFile(fid);
    mni.printing.cards.PARAM('LFREQ','r',obj.FreqRange(1)).writeToFile(fid);
    mni.printing.cards.PARAM('HFREQ','r',obj.FreqRange(2)).writeToFile(fid);
    mni.printing.cards.PARAM('LFREQFL','r',obj.FreqRange(1)).writeToFile(fid);
    mni.printing.cards.PARAM('HFREQFL','r',obj.FreqRange(2)).writeToFile(fid);

    %% define Modal damping
    mni.printing.bdf.writeComment(fid,'Modal Damping')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    mni.printing.cards.TABDMP1(920,'CRIT',obj.FreqRange,ones(1,2)*obj.ModalDampingPercentage).writeToFile(fid);
    
    
    %% Aero Properties Section
    mni.printing.bdf.writeComment(fid,'Aerodynamic Properties')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    %create AERO card
    mni.printing.cards.PARAM('Q','r',0.5*obj.rho*obj.V.^2).writeToFile(fid);
    mni.printing.cards.PARAM('MACH','r',obj.Mach).writeToFile(fid);
    mni.printing.cards.AERO(obj.RefChord,obj.rho,'VELOCITY',obj.V).writeToFile(fid);
    mni.printing.cards.MKAERO1(obj.Mach,[1e-3,1e-2,2.5e-2,5e-2,7.5e-2,0.1,0.25,0.5]).writeToFile(fid);
    mni.printing.cards.MKAERO1(obj.Mach,[0.75,1,1.5,2,2.5,3,4]).writeToFile(fid);

    %% Gust Properties Section
    mni.printing.bdf.writeComment(fid,'Global Gust Properties')
    mni.printing.bdf.writeColumnDelimiter(fid,'8');
    
    delta_f = obj.FreqRange(2) - obj.FreqRange(1);
    mni.printing.cards.FREQ1(930,obj.FreqRange(1),delta_f/obj.NFreq,obj.NFreq).writeToFile(fid);
    mni.printing.cards.TSTEP(940,ceil(obj.GustDuration/obj.GustTstep),obj.GustTstep).writeToFile(fid);
    mni.printing.cards.DAREA(99999999,99999999,3,1).writeToFile(fid);
    %% Gust Case Properties Section
    for i = 1:length(obj.GustAmplitude)
        mni.printing.bdf.writeComment(fid,sprintf('Gust Subcase %.0f Properties',i))
        mni.printing.bdf.writeColumnDelimiter(fid,'8');
        % Gust Signal
        switch obj.GustType
            case 'Length'
                obj.GustFreq(i) = obj.V/obj.GustLength(i);
            case 'Length_atmos'
                obj.GustFreq(i) = obj.V/obj.GustLength(i);
                obj.GustAmplitude(i) = obj.GustAmplitude(i)*(0.5*obj.GustLength(i)/106.17).^(1/6);
            case 'Freq'
                obj.GustLength(i) = obj.V/obj.GustFreq(i);
            otherwise
                error('Incorrect Gust Type')
        end
        mni.printing.cards.TLOAD2(i*100,99999999,'F',0,'T1',obj.GustTdelay,'T2',obj.GustTdelay+(1/obj.GustFreq(i))).writeToFile(fid);
        mni.printing.cards.TLOAD2(i*100+1,99999999,'F',obj.GustFreq(i),'T1',obj.GustTdelay,'T2',obj.GustTdelay+(1/obj.GustFreq(i))).writeToFile(fid);
        mni.printing.cards.DLOAD(i,1,[1,-1],[i*100,i*100+1]).writeToFile(fid);
        mni.printing.cards.GUST(i*10,i,obj.GustAmplitude(i)/obj.V/2,0,obj.V).writeToFile(fid);
    end
    % %% Gust Case Properties Section
    % for i = 1:length(obj.GustAmplitude)
    %     mni.printing.bdf.writeComment(fid,sprintf('Gust Subcase %.0f Properties',i))
    %     mni.printing.bdf.writeColumnDelimiter(fid,'8');
    %     mni.printing.cards.TLOAD1(i*100,99999999,'TID',i).writeToFile(fid);
    %     mni.printing.cards.DLOAD(i,1,1,i*100).writeToFile(fid);
    %     % Gust Signal
    %     switch obj.GustType
    %         case 'Length'
    %             obj.GustFreq(i) = obj.V/obj.GustLength(i);
    %         case 'Length_atmos'
    %             obj.GustFreq(i) = obj.V/obj.GustLength(i);
    %             obj.GustAmplitude(i) = obj.GustAmplitude(i)*(0.5*obj.GustLength(i)/106.17).^(1/6);
    %         case 'Freq'
    %             obj.GustLength(i) = obj.V/obj.GustFreq(i);
    %         otherwise
    %             error('Incorrect Gust Type')
    %     end
    %     mni.printing.cards.GUST(i*10,i,obj.GustAmplitude(i)/obj.V,0,obj.V).writeToFile(fid);
    %     t = linspace(0,1/obj.GustFreq(i),81);
    %     gust = gen_1MC(obj.GustFreq(i),1,0,t);
    %     t = t + obj.GustTdelay;
    %     mni.printing.cards.TABLED1(i,t,gust).writeToFile(fid);
    % end
    fclose(fid);
end

