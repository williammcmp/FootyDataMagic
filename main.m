clear;
close all; 
% Define the folder path to your .dat files
folderPath = '/Users/william/Library/CloudStorage/OneDrive-SwinburneUniversity/Classes/2023 S2/MTH20016/Assigment shit/First Assigment - AFL/AFL';


% Call the importTeamData function to import team data
[homeTeam, awayTeam] = importTeamData(folderPath);


% Get a list of years (seasons) from the imported data
years = keys(homeTeam);

% Uncomment the following sections as needed:

% Plot combined data for all seasons - may not be the most useful
% showCombinedPlots(homeTeam, awayTeam);

% Show data for a specific season (2016)
% showSeason(homeTeam, awayTeam, '2011');

% Show data for each season (distributions, outliers)
showAllSeasons(homeTeam, awayTeam);

% show side-by-side boxplots
% showBoxPlots(homeTeam, awayTeam);

% mean and CI data for all seasons
% [winningData, losingData, marginData] = calSeasonsMeanCIData(homeTeam, awayTeam, years);
% showCITables(winningData, losingData, marginData);

% Means and P-values per season/year
% Plot season means for various statistics per season - will print the p-values for each stat (tables are fucked cause of matlab...)
% showSeasonMeans(homeTeam, awayTeam);

% Means change over time - First vs last season
% showFirstLastSeason(homeTeam, awayTeam, "2011", "2020");

% Max liklihood of a season
% showSeasonMaxLiklihood(homeTeam, awayTeam, "2019")
