function showSeasonMaxLiklihood(homeTeam, awayTeam, year, removeOutliers)
    % showSeasonMaxLiklihood - Calculate and Plot Maximum Likelihood Estimates for a Season
    %
    % Syntax:
    %   showSeasonMaxLiklihood(homeTeam, awayTeam, year)
    %
    % Inputs:
    %   homeTeam - A containers.Map containing home team data for multiple years.
    %   awayTeam - A containers.Map containing away team data for multiple years.
    %   year - The specific year for which maximum likelihood estimates are calculated.
    %
    % Description:
    %   This function calculates and plots maximum likelihood estimates for
    %   various statistics related to a specific season, such as winning scores,
    %   losing scores, and score margins. It calls other functions to calculate
    %   these estimates and generates plots to visualize the likelihood functions.
    %
    % Example:
    %   homeTeamData = containers.Map;
    %   awayTeamData = containers.Map;
    %   year = '2023';
    %   showSeasonMaxLiklihood(homeTeamData, awayTeamData, year);

    % Calculate winning scores, losing scores, and score margins for the specified year
    winningData = calWinningScores(homeTeam(year), awayTeam(year));
    losingData = calLossingScores(homeTeam(year), awayTeam(year));
    marginData = calMargins(homeTeam(year), awayTeam(year));

    if (removeOutliers)
        [winningData, winRemove] = calRemoveOutliers(winningData);
        [losingData, loswRemove] = calRemoveOutliers(losingData);
        [marginData, marginRemove] = calRemoveOutliers(marginData);
    end

    % Calculate and plot maximum likelihood estimates for winning scores
    calMaxLiklihood(winningData, "Winning Scores for " + year)
    
    % Calculate and plot maximum likelihood estimates for losing scores
    calMaxLiklihood(losingData, "Losing Scores for " + year)
    
    % Calculate and plot maximum likelihood estimates for score margins
    calMaxLiklihood(marginData, "Score Margins for " + year)
end
