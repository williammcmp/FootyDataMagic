function showBoxPlots(homeTeam, awayTeam)
    years = keys(homeTeam);
     % Winning scores in boxplots - more outliers in eariler seaons
     fig = figure
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