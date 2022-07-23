close all, close all;

%
%  Driver_Ni3Al.m
%
%  Author:  Alex Greenhalgh
%  Date begun:  March 2019
%  Date last updated:  October 20th, 2020
%
%
% This program runs through all of the Fortran RDF_lammps results for Ni3Al
% and converts the Cumulative RDF from the output files into a Fractional
% Cumulative RDF 
% It tracks the recorded fmetric of each Fractional Cumulative RDF inside
% the matrices Ni3Al and Random_Ni3Al, program generates a fractional
% cumulative RDF for each coutput file and saves as a png file 
% It could be utilized to make synthetic data sets of varying noise and 
% sparsity, but because of the inefficiency of MATLAB that takes ~3 Days, 
% parts involving that are commented out 
%
%
%

% sigmalo = 0;
% sigmahi = 2.0;
% delsigma = 2/3;
% sigmavec = [sigmalo:delsigma:sigmahi];
sigmavec = [0,.67,1.34,2]; % Noise values for the output files
nsigma = length(sigmavec);
delay = 100; % Measurement delay in the fmetric, necessary because all 
             % random sets contain large jumps in the short range atomic
             % ordering that throw off the metric if this adjustment isn't
             % present

% sparsitylo = 0.4;
% sparsityhi = 1;
% delsparsity = -0.3;
% sparsitylo = 1;
% sparsityhi = 1;
% delsparsity = 0;

% abundvec = [sparsityhi:delsparsity:sparsitylo];
abundvec = [1,.7,.4]; %Abundance values for the output files
nsparsity = length(abundvec);
count = 0;

%
% Nested For loop that calculates the fmetric of all possible combinations 
% of the noise and abundance vectors 
%

for isigma = 1:1:nsigma
   for isparsity = 1:1:nsparsity
         sigma = sigmavec(isigma);
         sparsity = abundvec(isparsity);
         % 
         % This is the section to create the synthetic data sets, commented out
         % because it takes a very long time, 40% abundance sets take 25 hours
         % makeNi3Al_Random and makeNi3Al_v4 will also be included in this file but
         % are not utilized
         %
         %         filename = strcat('Ni3Al_synthetic_',num2str(sigma),'_',num2str(sparsity),'.xyz');
         %         makeNi3Al_v4(sigma, sparsity, filename);
         %           
         %         sigma = sigmavec(isigma);
         %         sparsity = abundvec(isparsity);
         %         filename = strcat('Random_Ni3Al_synthetic_',num2str(sigma),'_',num2str(sparsity),'.xyz');
         %         makeNi3Al_Random(sigma, sparsity, filename);
         %
         %
         % Graph the Fractional Cumulative RDF through orderradprofCRDFInput_v1,
         % which is the original function. All graphs are saved as a .jpg
         %
         %
         %
         % Ni3Al and Random_Ni3Al are what is graphed in the final figure, x and y
         % axis are noise and abundance, z axis is the resulting fmetric value
         %
         count = count+1;
         filename = strcat('coutput_',num2str(sigma),'_',num2str(sparsity),'.txt')
         orderradprofCRDFInput_v1(filename,delay);
         fmetric = ans;
         Ni3Al(count,3)= fmetric;
         Ni3Al(count,1) = sigma;
         Ni3Al(count,2)=sparsity;
         close all
         filename = strcat('Random_coutput_',num2str(sigma),'_',num2str(sparsity),'.txt')
         orderradprofCRDFInput_v1(filename,delay);
         fmetric = ans;
         Random_Ni3Al(count,3)= fmetric;
         Random_Ni3Al(count,1) = sigma;
         Random_Ni3Al(count,2)=sparsity;
         close all;
   end
end

%
% Plot the matrices of Ni3Al and Random_Ni3Al using the plotfmetric
% function, right now it is set to graph on top of each other using hold on
% command
%

figure
plotfmetric(Ni3Al, 'Ni_{3}Al',0 );
hold on
alpha(.75); % make transparent to see below to the random 
figname = strcat('Ni3Al',num2str(delay),'fmetricplot.jpg');
print(figname, '-dpng','-r600'); 
for i=1:3
savefig('./test/',parameter,'/','run_',num2str(i),'.fig'); %uncomment if
end

test_1_
test_2_.fig
etc
% want to save

plotfmetric(Random_Ni3Al, 'Random Ni3Al',2 );
figname = strcat('Random_Ni3Al_',num2str(delay),'fmetricplot.jpg');
print(figname, '-dpng','-r600'); 
savefig('Random_Ni3Al_fmetricplot_',num2str(delay),'offset.fig');
hold off

