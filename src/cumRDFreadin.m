function cumrdfmat = cumRDFreadin(Ninum, Alnum, Xnum,filename)
% function cumRDFreadin changes the format of the coutput file in order to
% create a format that the orderradprofCRDFInput can read and turn into a
% fractional cumulative RDF.
% 
% Purpose is to create the variable cumrdfmat that can be graphed
%
% Inputs:
%
% Ninum = Number of Nickel atoms in the synthetic data set
% Alnum = Number of Aluminum atoms in the synthetic data set
% Xnum = Number of Unrecognizeable atoms in the synthetic data set
% 
% In the case of orderradprofCRDFInput_v1.m, the specific number of atoms
% don't matter so much since the ratio between all three groups will be
% identical for such a large data set. Thus, the same ratio is applied to
% all 24 synthetic data sets
%
% Example: 
%
% cumRDFreadin(307434,88820,74681,'coutput_2_1.txt');
%

    delimiterIn = ' ';
    headerlinesIn = 2;
    tempdata = importdata(filename,delimiterIn,headerlinesIn);
    size = length(tempdata.data);

    %
    %   Convert output to CRDF graphable Function
    %

    cumrdfmat = zeros(3,3,size);
    cumrdfmat(1,1,:)=tempdata.data(:,2);
    cumrdfmat(1,2,:)=tempdata.data(:,3);
    cumrdfmat(1,3,:)=tempdata.data(:,4);
    cumrdfmat(2,1,:)=(Ninum/Alnum)*tempdata.data(:,3);
    cumrdfmat(2,2,:)=tempdata.data(:,5);
    cumrdfmat(2,3,:)=tempdata.data(:,6);
    cumrdfmat(3,1,:)=(Ninum/Xnum)*tempdata.data(:,4);
    cumrdfmat(3,2,:)=(Alnum/Xnum)*tempdata.data(:,6);
    cumrdfmat(3,3,:)=tempdata.data(:,7);

end