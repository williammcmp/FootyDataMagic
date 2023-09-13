clear;
close all; 
% Define the folder path to your .dat files
folderPath = '/Users/william/Library/CloudStorage/OneDrive-SwinburneUniversity/Classes/2023 S2/MTH20016/Assigment shit/First Assigment - AFL/AFL';


% Call the importTeamData function to import team data
[homeTeam, awayTeam] = importTeamData(folderPath);

% Get a list of years (seasons) from the imported data
years = keys(homeTeam);

% Uncomment the following sections as needed:

% Show data for a specific season (2016)
% showSeason(homeTeam, awayTeam, '2016');

% Plot combined data for all seasons
% showCombinedPlots(homeTeam, awayTeam);

% Show data for each season (distributions, outliers)
% showAllSeasons(homeTeam, awayTeam);

% Generate and display tables of mean and CI data for all seasons
% [winningData, losingData, marginData] = calSeasonsMeanCIData(homeTeam, awayTeam, years);
% showCITables(winningData, losingData, marginData);

% Plot season means for various statistics per season - will print the p-values for each stat
showSeasonMeans(homeTeam, awayTeam);

