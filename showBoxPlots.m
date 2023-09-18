function showBoxPlots(homeTeam, awayTeam)
    % showBoxPlots - Plot Boxplots of Winning, Losing, and Margin Scores for Each Season
    %
    % Syntax:
    %   showBoxPlots(homeTeam, awayTeam)
    %
    % Inputs:
    %   homeTeam - A containers.Map containing home team data for multiple years.
    %   awayTeam - A containers.Map containing away team data for multiple years.
    %
    % Description:
    %   This function generates boxplots for winning scores, losing scores, and
    %   score margins for each season, providing insights into the distribution
    %   and outliers of the data for each season.
    %
    % Example:
    %   homeTeamData = containers.Map;
    %   awayTeamData = containers.Map;
    %   showBoxPlots(homeTeamData, awayTeamData);

    years = keys(homeTeam);
     % Winning scores in boxplots - more outliers in eariler seaons
     fig = figure;
     set(fig, 'Name', 'Boxplot of Winnings scores from each season');
     data = [];
     index = [];
     for i=1:numel(years)
         winning = calWinningScores(homeTeam(years{i}), awayTeam(years{i}));
         data = [data;winning];
         index = [index;repmat(years(i), length(winning),1)];
     end 
     
     boxplot(data, index)
     xlabel('Season (year)');
     ylabel('Points');
     
     % Loosing scores in boxplots - more outliers than in winning data
     fig = figure
     set(fig, 'Name', 'Boxplot of Losing scores from each season');
     data = [];
     index = [];
     for i=1:numel(years)
         lossing = calLossingScores(homeTeam(years{i}), awayTeam(years{i}));
         data = [data;lossing];
         index = [index;repmat(years(i), length(lossing),1)];
     end 
     
     boxplot(data, index)
     xlabel('Season (year)');
     ylabel('Points');
 
     % Margin scores in boxplots - more outliers than in winning data
     fig = figure
     set(fig, 'Name', 'Boxplot of score Margins from each season');
     data = [];
     index = [];
     for i=1:numel(years)
         margin = calMargins(homeTeam(years{i}), awayTeam(years{i}));
         data = [data;margin];
         index = [index;repmat(years(i), length(margin),1)];
     end 
     
     boxplot(data, index)
     xlabel('Season (year)');
     ylabel('Points');
end