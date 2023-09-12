function [winningData, losingData, marginData] = generateSeasonsMeanCIData(homeTeam, awayTeam, years)
    % GENERATESEASONSMEANCIDATA - Generate data for multiple seasons with 95% CIs.
    %
    % Input:
    %   homeTeam - A containers.Map containing home team data for multiple seasons.
    %   awayTeam - A containers.Map containing away team data for the same seasons.
    %   years - A cell array of season (year) values.

    % Initialize cell arrays to store data
    winningData = cell(numel(years), 2);
    losingData = cell(numel(years), 2);
    marginData = cell(numel(years), 2);

    % Loop through each season
    for i = 1:numel(years)
        % Generate mean and confidence interval data for the season
        [yearWin, yearLose, yearMargin] = generateSeasonMeanCIData(homeTeam, awayTeam, years{i});

        % Store data in respective cell arrays
        winningData{i, 1} = yearWin{1};
        winningData{i, 2} = yearWin{2};
        losingData{i, 1} = yearLose{1};
        losingData{i, 2} = yearLose{2};
        marginData{i, 1} = yearMargin{1};
        marginData{i, 2} = yearMargin{2};
    end
end
