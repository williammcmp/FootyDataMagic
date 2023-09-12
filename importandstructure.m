%clears variables and workspace and command window
clear;
clc;



% Changing current folder in mathlab console
AFLFolder = '/Users/william/Library/CloudStorage/OneDrive-SwinburneUniversity/Classes/2023 S2/MTH20016/Assigment shit/First Assigment - AFL/AFL';
cd(AFLFolder);



% Use importdata to load the data from the folder
data11 = importdata('afl2011.dat');
data12 = importdata('afl2012.dat');
data13 = importdata('afl2013.dat');
data14 = importdata('afl2014.dat');
data15 = importdata('afl2015.dat');
data16 = importdata('afl2016.dat');
data17 = importdata('afl2017.dat');
data18 = importdata('afl2018.dat');
data19 = importdata('afl2019.dat');
data20 = importdata('afl2020.dat');

% make each season matrix a part of an array so we can cylce thru them later
datay = {data11,data12,data13,data14,data15,data16,data17,data18,data19,data20};



% define varibles as a matrix before using them
% (I don't really understand why I have to do this)
home = [];
away = [];
margin = [];
year = [];
win = [];
loss = [];

% start commically large loop
for i=1:10

%makes home and away and margin labels for every year that can be called
%upon like so marginy{4}=all margins from 2014

homey{i} = datay{i}(:,2);
awayy{i} = datay{i}(:,1);
marginy{i} = homey{i}-awayy{i};
winy{i} = max([homey{i} awayy{i}],[],2);
lossy{i} = min([homey{i} awayy{i}],[],2);



% combines homey awayy marginy winy lossy into 5 big files that ccan be
% called upon like so marginy=all margins

home = [home;homey{i}];
away = [away;awayy{i}];
margin = [margin;marginy{i}];
win = [win;winy{i}];
loss = [loss;lossy{i}];



%creates year column matrix (says 2011 for each games in 2011 and so on)
year = [year;zeros(height(datay{i}),1)+2010+i];


% rearrange datay columns and add marginy winy lossy. can be called upon
% with datay{6}=all data from 2016
datay{i} = [homey{i} awayy{i} marginy{i} winy{i} lossy{i}];
end

% combines year home away margin into one big matrix

data = [year home away margin win loss]