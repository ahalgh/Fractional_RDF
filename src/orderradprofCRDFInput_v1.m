%function fmetric = orderradprofCRDFInput_v1(filename,delay)
% orderradprofCRDFInput_v1 graphs the fractional Cumulative RDF 
% takes in a filename of the same format as coutput_2_1.txt, modified from
% rdf_lammps output file.
%
% Inputs:
%
% Filename: Name of file, string
% Delay: value of offset in the fmetric, with a length of 5000, out
% to 50 Angstroms, a delay of 100 will be 1.0 Angstroms 
%
% Example:
% orderradprofCRDFInput_v1('coutput_2_1.txt',150)
%

close all, clear all;
%filename='coutput_HEA_APT.txt';
filename='APT_data_5000.txt';
%filename='Synthetic_1.34_0.txt';
%filename='coutput_1.34_0.4.txt'
%filename='Random_coutput_1.34_0.4.txt'
delay = 100;
%Ninum = 299697, Alnum = 99819;
cumRDFreadin(307434,88820,74681,filename);
%cumRDFreadin(299697,99819,75035,filename);

    
    if(delay == 0)
        delay =3; % first three values almost always decrease from 100% in 
                  % graph with higher levels of noise, throwing off metric
    end
    ntyp=2; % types of atoms
    %ntyp=ntyp-1
     nr = 5000
     %nr = round(5000*3.577/2.8); % number of rows in cumulative rdf
    len = 5000;
    rlo = 0.0;
   %rhi = 63.87;
     rhi = 49.99;
    delr = 0.01;
    rvec = [rlo:delr:rhi]; % A vector of 5000 values out to 50 Angstroms, altered for lattice conversion
     crdfmat = ans; %reads in cumulative rdf from cumRDFreadin program
    %form = ans;
    %
    % scale rdf to correct lattice constant for Ni3Al, since 2.8 was used
    % instead of 3.577
    %
%    crdfmat = zeros(ntyp,ntyp,nr);
%     for ityp = 1:1:ntyp
%         for jtyp = 1:1:ntyp
%             for ir = 1:1:len
%                 conv = form(ityp,jtyp,ir);
%                 idx = round(ir*3.577/2.8);
%                 crdfmat(ityp,jtyp,idx) = conv;                
%             end
%             for ir = 1:1:nr
%                 check = crdfmat(ityp,jtyp,ir);
%                 if(check == 0 && ir > 1)
%                     convminus1 = crdfmat(ityp,jtyp,ir-1);
%                     crdfmat(ityp,jtyp,ir)= convminus1;
% %                 elseif(check == 0 && ir <= 6)
% %                     convplus1 = form(ityp,jtyp,ir);
% %                     crdfmat(ityp,jtyp,ir)= convplus1;
%                 end
%                 convminus1 = conv;
%             end
%         end
%     end
    %save('crdfmat_Perf_syth.mat','crdfmat')
    %namedb = {'Ni';'Al';'X'};
    namedb = {'Ni';'Al'};
    %namedb = {'Al';'Co';'Cr';'Cu';'Fe';'Ni';'X'}
    namedb = string(namedb);
    count = 2;
    %count = count-1;
    %newDefaultColors = winter(count^2); % used to coordinate colors of graphed
    %str1 = '#963D97'; %purple
    str1 = '#F5821F'; %orange
    %str1 = '#E03A3E'; %Red
    str2 = '#009DDC'; %blue
    str3 = '#E03A3E'; %yellow
    str4 = '#963D97'; %purple
    newDefaultColors(1,:) = sscanf(str1(2:end),'%2x%2x%2x',[1 3])/255;
    newDefaultColors(2,:) = sscanf(str1(2:end),'%2x%2x%2x',[1 3])/255;
    newDefaultColors(3,:) = sscanf(str2(2:end),'%2x%2x%2x',[1 3])/255;
    newDefaultColors(4,:) = sscanf(str2(2:end),'%2x%2x%2x',[1 3])/255;
    newDefaultColors(5,:) = sscanf(str1(2:end),'%2x%2x%2x',[1 3])/255;
    newDefaultColors(6,:) = sscanf(str3(2:end),'%2x%2x%2x',[1 3])/255;
    newDefaultColors(7,:) = sscanf(str4(2:end),'%2x%2x%2x',[1 3])/255;
    newDefaultColors(8,:) = sscanf(str2(2:end),'%2x%2x%2x',[1 3])/255;
    %
    %  determine fractional cumulative distribution, reading in the result from
    %  the cumulative rdf.
    %  Triple for loop necessary to loop through each atom type, then go
    %  through all values in the cumulative RDF vector 
    %

    
    %
    %  Plot radial distribution functions
    %
% load('rdf_num_Ni3Al.mat')
% rdfmat1(1,1,1:5000) = rdfmat(2,2,1:5000)
% rdfmat1(1,2,1:5000) = rdfmat(2,1,1:5000)
% rdfmat1(2,1,1:5000) = rdfmat(1,2,1:5000)
% rdfmat1(2,2,1:5000) = rdfmat(1,1,1:5000)
     iplot = 1;
%      rlo = 0.0;
%     %rhi = 250;
%     rhi = 49.99;
%     delr = 0.01;
%     rvec = [rlo:delr:rhi];
% icol = 4;
% ileg = 0;
% for ityp = 1:1:ntyp
%     for jtyp = 1:1: ntyp
%         ileg = ileg + 1;
%         legendstring(ileg) = strcat(namedb(ityp),'-',namedb(jtyp));
%         rdfplot(:) = rdfmat1(ityp,jtyp,:);
%         icol = icol + 1; 
% %         if(icol == count^2+1)
% %             icol = 1;
% %         end
%         %plot(rvec,rdfplot(:),'linewidth',1.5);
%         plot(rvec,rdfplot(:),'color',newDefaultColors(icol,:),'linewidth',1.5);
%         hold on;
%         alpha(.5)
%         grid on
%         ax = gca;
%         ax.GridColor = [.5 .5 .5];
%         ax.GridLineStyle = ':';
%         ax.GridAlpha = 1;
%         ax.Layer = 'top';
%         axis([rlo 25.0 0.0 10.5*10^5]);
%         %yticks([0 0.2 0.4 0.6 0.8 1])
%         ax.FontName = 'Times New Roman'; 
%     end
% end
% hold off;
% %title('Component Radial Distribution');
% Ang = char(197);
% xlabelarg = strcat('Distance from Central Atom (',Ang,')');
% xlabel(xlabelarg);
% ylabel('Radial Distribution Function (atom counts)');
% legend(legendstring(:));
% 
% for ityp = 1:1:ntyp
%     for jtyp = 1:1: ntyp
%         for ir = 1:1:nr
%             if ir == 1
%                crdfmat(ityp,jtyp,ir) = rdfmat1(ityp,jtyp,ir);
%             else
%                 crdfmat(ityp,jtyp,ir) = rdfmat1(ityp,jtyp,ir) + crdfmat(ityp,jtyp,ir-1);
%             end
%         end
%     end
% end

%
% work back to RDF
% 307434,88820
Ninum = 307434;
Alnum = 88820;
rdfmat = zeros(count,count,nr)
checkmin1 = 0;
for ityp = 1:1:ntyp
    for jtyp = 1:1: ntyp
        for ir = 1:1:nr
            if ir == 1
               rdfmat(ityp,jtyp,ir) = crdfmat(ityp,jtyp,ir);
            elseif(ir > 1)
                if(crdfmat(ityp,jtyp,ir) ~= crdfmat(ityp,jtyp,ir-1))
                    rdfmat(ityp,jtyp,ir) = crdfmat(ityp,jtyp,ir) - crdfmat(ityp,jtyp,ir-1);
                end
%                  if(check == 0)
%                       if(checkmin1 ~= 0 && checkmax1 ~= 0)
%                         rdfmat(ityp,jtyp,ir) = checkmin1;
%                       end
%                  end
            end

        end
    end
end
%
% fix holes from scaling 
%
for ityp = 1:1:ntyp
    for jtyp = 1:1: ntyp
        for ir = 1:1:nr
            check = rdfmat(ityp,jtyp,ir);
            if(ir > 1)
                checkmin1 = rdfmat(ityp,jtyp,ir-1);
            end
            if(ir < nr-1)
                checkmax1 = rdfmat(ityp,jtyp,ir+1);
            end
            if(check == 0)
                if(checkmin1 ~= 0 && checkmax1 ~= 0)
                    rdfmat(ityp,jtyp,ir) = checkmin1;
                end
            end
        end
    end
end




fraccrdf = zeros(ntyp,ntyp,nr);
    for ityp = 1:1:ntyp
        for jtyp = 1:1:ntyp
            for ir = 1:1:nr
               num = crdfmat(ityp,jtyp,ir);
               %den = sum(crdfmat(ityp,:,ir));
               den = sum(crdfmat(ityp,1:end-1,ir));
               if (den > 0) 
                  fraccrdf(ityp,jtyp,ir) = num/den;
               else
                  fraccrdf(ityp,jtyp,ir) = 0.0;
               end
            end
        end
    end
    %
    % plot rdf
    %
    
    iplot = iplot + 1;
    figure(iplot)
    icol = 4;
    ileg = 0;
    for ityp = 1:1:ntyp
        for jtyp = 1:1: ntyp
            ileg = ileg + 1;
            legendstring(ileg) = strcat(namedb(ityp),'-',namedb(jtyp));
            rdfplot(:) = rdfmat(ityp,jtyp,:);
            icol = icol + 1; 
%             if(icol == count^2+1)
%                 icol = 1;
%             end
            %if(sum(rdfplot(:)) ~= 0)
            plot(rvec,rdfplot(:),'color',newDefaultColors(icol,:),'linewidth',1.5);
            %end
            hold on;
            grid on
            ax = gca;
            ax.GridColor = [.5 .5 .5];
            ax.GridLineStyle = ':';
            ax.GridAlpha = 1;
            ax.Layer = 'top';
            axis([0 5 0.0 .22]);
        end
    end
    hold off;
    title('Component Radial Distribution');
    Ang = char(197);
    xlabelarg = strcat('Distance from Central Atom (',Ang,')');
    xlabel(xlabelarg);
    ylabel('# of Atoms in Radial Distribution');
    legend(legendstring(:));
    
    
    %
    %  plot cumulative radial distribution functions
    %

    iplot = iplot + 1;
    figure(iplot)
    icol = 0;
    ileg = 0;
    for ityp = 1:1:ntyp
        for jtyp = 1:1: ntyp
            ileg = ileg + 1;
            legendstring(ileg) = strcat(namedb(ityp),'-',namedb(jtyp));
            crdfplot(:) = crdfmat(ityp,jtyp,:);
            icol = icol + 1; 
            if(icol == count^2+1)
                icol = 1;
            end
            if(sum(crdfplot(:)) ~= 0)
                plot(rvec,crdfplot(:),'color',newDefaultColors(icol,:),'linewidth',1.5);
            end
            hold on;
            grid on
            ax = gca;
            ax.GridColor = [.5 .5 .5];
            ax.GridLineStyle = ':';
            ax.GridAlpha = 1;
            ax.Layer = 'top';
        end
    end
    hold off;
    title('Total Cumulative Radial Distribution');
    Ang = char(197);
    xlabelarg = strcat('Distance from Central Atom (',Ang,')');
    xlabel(xlabelarg);
    ylabel('Cumulative # of Atoms in Radial Distribution');
    legend(legendstring(:));

    %
    %  plot fractional radial distribution functions
    %

    iplot = iplot + 1;
    figure(iplot)
    icol = 0;
    ileg = 0;
    for ityp = 1:1:ntyp
        for jtyp = 1:1: ntyp
            ileg = ileg + 1;
            legendstring(ileg) = strcat(namedb(ityp),'-',namedb(jtyp));
            rdfplot(:) = fraccrdf(ityp,jtyp,:);
            icol = icol + 1;
            if(icol == count^2+1)
                icol = 1;
            end
            if(sum(rdfplot(:)) ~= 0)
                plot(rvec,rdfplot(:),'color',newDefaultColors(icol,:),'linewidth',1.5);
            end
            hold on;
            grid on
            ax = gca;
            ax.GridColor = [.5 .5 .5];
            ax.GridLineStyle = ':';
            ax.GridAlpha = 1;
            ax.Layer = 'top';
            axis([0 25 0.0 1.0]);
            yticks([0 0.2 0.4 0.6 0.8 1])
            ax.FontName = 'Times New Roman'; 
        end
    end
    hold off;
    %title('Total Fractional Cumulative Radial Distribution');
    Ang = char(197);
    xlabelarg = strcat('Distance from Central Atom (',Ang,')');
    xlabel(xlabelarg);
    ylabel('Component FCRDF');
    legend(legendstring(:));

    %
    %  create additive fractional radial distributio function, graphing each
    %  value on top of each other 
    %

    afraccrdf = zeros(ntyp,ntyp,nr);
    afraccrdf(:,1,:) = fraccrdf(:,1,:);
    for ityp = 1:1:ntyp
        for jtyp = 2:1:ntyp
            for k = 1:1:nr
               afraccrdf(ityp,jtyp,k)  = afraccrdf(ityp,jtyp-1,k) + fraccrdf(ityp,jtyp,k);
            end
        end
    end

    %
    % Plot Fractional Cumulative Radial Distribution for all unique atoms in
    % set
    %
    fmetricvec = zeros(nr,count^2);
    rdfdif = zeros(nr);
    cou = 0;
    for ityp = 1:1:ntyp
        clear legendstring
        iplot = iplot + 1;
        figure(iplot)
        icol = 0;
        ileg = 0;
        rdfplot = zeros(nr,1);
        rdfplottxt = zeros(nr,1);
        for jtyp = ntyp:-1:1
            ileg = ileg + 1;
            legendstring(ileg) = strcat(namedb(ityp),'-',namedb(jtyp));
            for k =1:1:nr
               rdfplot(k) = afraccrdf(ityp,jtyp,k);
            end
            if(ityp == 2)
             for k =8:-1:2
                 
                  rdfplot(k-1) = rdfplot(k);
                 
             end
            end
            if(ityp == 1)
             for k =6:-1:2
                 
                  rdfplot(k-1) = rdfplot(k);
                 
             end
            end
            if(jtyp > 1)
                for k = 1:1:nr
                    rdfplottxt(k) = afraccrdf(ityp,jtyp-1,k);
                end 
                    rdfdif = rdfplot(:)-rdfplottxt(:);
            end
            icol = icol + 1;
            if(icol == count^2+1)
                icol = 1;
            end
            plot(rvec,rdfplot(:),'color',newDefaultColors(icol,:),'linewidth',1.5);
            save('APT_order_1.mat','rvec','rdfplot')
            a = area(rvec, rdfplot(:),0);
            a(1).FaceColor = newDefaultColors(jtyp*count,:);
            hold on;
%             if(count> 2)
%                 alpha(.5);
%             else
%                 alpha(.75);
%             end
            txt = [namedb(jtyp)];
            str = string(txt);
            if(jtyp > 1)
                txt = text(1.7,.9 ,str,'FontSize',25,'Color',[1, 1 ,1],'fontweight','bold','FontName', 'Times New Roman')
            else
                txt = text(1.7, .7 ,str,'FontSize',25,'Color',[1, 1 ,1],'fontweight','bold','FontName', 'Times New Roman')
            end
            
            %(rdfdif(170))*.5+rdfplottxt(170)
            %rdfplot(170)*.9
            title1 = append('Fractional Cumulative Radial Distribution Surrounding ',namedb(ityp),''); 
            %title(title1,'FontName', 'Times New Roman');
            Ang = char(197);
            xlabelarg = strcat('Distance from Central Atom (',Ang,')');
            xlabel(xlabelarg,'FontName', 'Times New Roman');
            ylabel('FCRDF','FontName', 'Times New Roman');
            grid on
            ax = gca;
            ax.GridColor = [.5 .5 .5];
            ax.GridLineStyle = ':';
            ax.GridAlpha = 1;
            ax.Layer = 'top';
            txt.Layer = 'front';
            fmetricvec(:,cou+jtyp)= rdfplot(:);
            axis([0 2.5 0.6 1.0]);
            yticks([0 0.2 0.4 0.6 0.7 0.8 0.9 1])
                        ax.FontName = 'Times New Roman'; 
            
        end
        figname = strcat('_',namedb(ityp),'_',filename,'_.jpg');
        print(figname, '-dpng','-r600'); 
        figname1 = strcat('_',namedb(ityp),'_',filename,'_.fig');
        savefig(figname1);
        cou = cou+count;
    end
    hold off;

    %
    % Calculate the fmetric for the Fractional Cumulative RDF
    %
    fmetricsum = zeros(1,count^2);
    istart = zeros(count^2,1);
    istart(:) = nr;
    for i= 1:count^2
        for ir = nr:-1:1
            if fmetricvec(ir,i) > 0.0
                istart(i) = ir;
            end
        end
    end
    iend = zeros(count^2,1);
    iend(:) = nr;
    final = length(fmetricvec);
    localfmetric = zeros(final,count^2);
    for i= 1:count^2
        for j=istart+delay:1:final-2
            V = [j-2,j-1,j,j+1,j+1];
            localfmetric(j,i) = std(fmetricvec(V,i));            
        end
        if(mod(i,count) ~= 0)        
             fmetricsum(1,i) = sum(localfmetric(istart(i):iend(i),i));
             fprintf(1,' i = %i istart = %i iend %i fmetric = %e here \n', i,istart(i),iend(i),fmetricsum(1,i));
        end
    end
    fmetric = sum(fmetricsum)/(count^2-count) % divided to avoid including any lines with no contribution to the metric
    fmetric = fmetric/1.699874124388035 %1.699874124388035 is the largest fmetric value from all of the data sets, so this normalizes it
%end