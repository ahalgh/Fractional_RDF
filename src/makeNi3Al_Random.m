function  makeNi3Al_Random(sigma, abundance, filename);
% function makeNi3Al_Random creates a synthetic data set of Random FCC Ni3Al when 
% provided with a noise, abundance, and a filename
%
% Inputs:
%
% sigma = Noise Value
% abundance = abundance value, 1 = 100%, .4 = 40 % etc
% filename = Name of file, string
% 
%
% Example: 
%
% makeNi3Al_Random(0.7, 1, 'test.txt');
%

    %sigma = 0; % Angstroms
    %abundance = 1; % fraction of atoms to keep
3.577/2.8
    lat = 2.8;
    latx = lat;
    laty = lat;
    latz = 2.0*lat;
    %name = ["Al"; "Ni"; "Ni"; "Ni"; "Al"; "Ni"; "Ni"; "Ni"];
    names = {'Al', 'Ni','Ni','Ni','Al', 'Ni','Ni','Ni','X'};


    nuc1d = 39;
    if(abundance ~= 1)
        comp = ((nuc1d^3)*2);
        syms x positive
        eqn = comp/(2*abundance) == x^3;
        newnuc = solve(eqn);
        nuc1d = double(newnuc);
    end
    nuc = nuc1d*nuc1d*nuc1d;
    napuc = 8;
    na = round(double(nuc*napuc));
    nucdim = ceil(nuc1d);
    r = zeros(na,3);
    ia = 0;
    namevec = zeros(na,1);
    %
    % place aluminum 1 at (0,0,0)
    % place nickel 1 at (1/2,1/2,0)
    % place nickel 2 at (1/2,0,1/2)
    % place nickel 3 at (0,1/2,1/2)
    % place aluminum 2 at (1/2,1/2,1)
    % place nickel 4 at (0,0,1)
    % place nickel 5 at (1/2,0,3/2)
    % place nickel 6 at (0,1/2,3/2)
    %
    for ix = 1:1:nucdim
        for iy = 1:1:nucdim
            for iz = 1:1:nucdim
                ia = ia + 1;
                namevec(ia) = 1;
                r(ia,1) = latx*(ix-1);
                r(ia,2) = laty*(iy-1);
                r(ia,3) = latz*(iz-1);
                %add noise
                r(ia,1) = random('normal',r(ia,1),sigma);
                r(ia,2) = random('normal',r(ia,2),sigma);
                r(ia,3) = random('normal',r(ia,3),sigma);
                ia = ia + 1;
                namevec(ia) = 2;
                r(ia,1) = latx*(ix-1)+0.5*lat;
                r(ia,2) = laty*(iy-1)+0.5*lat;
                r(ia,3) = latz*(iz-1)+0.0*lat;
                r(ia,1) = random('normal',r(ia,1),sigma);
                r(ia,2) = random('normal',r(ia,2),sigma);
                r(ia,3) = random('normal',r(ia,3),sigma);
                ia = ia + 1;
                namevec(ia) = 3;
                r(ia,1) = latx*(ix-1)+0.5*lat;
                r(ia,2) = laty*(iy-1)+0.0*lat;
                r(ia,3) = latz*(iz-1)+0.5*lat;
                r(ia,1) = random('normal',r(ia,1),sigma);
                r(ia,2) = random('normal',r(ia,2),sigma);
                r(ia,3) = random('normal',r(ia,3),sigma);
                ia = ia + 1;
                namevec(ia) = 4;
                r(ia,1) = latx*(ix-1)+0.0*lat;
                r(ia,2) = laty*(iy-1)+0.5*lat;
                r(ia,3) = latz*(iz-1)+0.5*lat;
                r(ia,1) = random('normal',r(ia,1),sigma);
                r(ia,2) = random('normal',r(ia,2),sigma);
                r(ia,3) = random('normal',r(ia,3),sigma);
                ia = ia + 1;
                namevec(ia) = 5;
                r(ia,1) = latx*(ix-1)+0.5*lat;
                r(ia,2) = laty*(iy-1)+0.5*lat;
                r(ia,3) = latz*(iz-1)+1.0*lat;
                r(ia,1) = random('normal',r(ia,1),sigma);
                r(ia,2) = random('normal',r(ia,2),sigma);
                r(ia,3) = random('normal',r(ia,3),sigma);
                ia = ia + 1;
                namevec(ia) = 6;
                r(ia,1) = latx*(ix-1);
                r(ia,2) = laty*(iy-1);
                r(ia,3) = latz*(iz-1)+1.0*lat;
                r(ia,1) = random('normal',r(ia,1),sigma);
                r(ia,2) = random('normal',r(ia,2),sigma);
                r(ia,3) = random('normal',r(ia,3),sigma);
                ia = ia + 1;
                namevec(ia) = 7;
                r(ia,1) = latx*(ix-1)+0.5*lat;
                r(ia,2) = laty*(iy-1)+0.0*lat;
                r(ia,3) = latz*(iz-1)+1.5*lat;
                r(ia,1) = random('normal',r(ia,1),sigma);
                r(ia,2) = random('normal',r(ia,2),sigma);
                r(ia,3) = random('normal',r(ia,3),sigma);
                ia = ia + 1;
                namevec(ia) = 8;
                r(ia,1) = latx*(ix-1)+0.0*lat;
                r(ia,2) = laty*(iy-1)+0.5*lat;
                r(ia,3) = latz*(iz-1)+1.5*lat;
                r(ia,1) = random('normal',r(ia,1),sigma);
                r(ia,2) = random('normal',r(ia,2),sigma);
                r(ia,3) = random('normal',r(ia,3),sigma);
            end
        end
    end

    %
    %  remove some of the atoms
    %

    abundance*na;
    nkeep = floor(abundance*na);
    nremove = na - nkeep;
    ncurrent = na;
    for i = 1:nremove
        % pick one to remove
        ipick = floor(random('unif',1,ncurrent+1));
        r(ipick,:,:)= [];
        namevec(ipick) = [];
        % change current
        ncurrent = ncurrent - 1;
    end

    %
    %  write result to filename
    %
    fid = fopen(filename,'w');
    fprintf(fid, '%i \n', ncurrent);
    fprintf(fid, ' \n');
    for ia = 1:1:ncurrent
       b = randi([1,na], 1);
       if(b < na*.8414)
        a = randi([1,8], 1);
        name = char(names(a));
       else
        name = char(names(9));
       end
       fprintf(fid, '%s %23.15e  %23.15e  %23.15e  \n', name, r(ia,1:3));
    end
    fclose(fid);
end
