% calLossingScores - Calculate the losing scores from each game.
%
%   lossingScores = calLossingScores(homeTeamData, awayTeamData) calculates
%   the losing scores by taking the minimum value between the home team's data
%   and the away team's data for each game.
%
%   Input:
%     homeTeamData - Numeric array representing home team data.
%     awayTeamData - Numeric array representing away team data.
%
%   Output:
%     lossingScores - Numeric array representing the losing scores for each game.

function lossingScores = calLossingScores(homeTeamData, awayTeamData)
    % Calculate the losing scores
    lossingScores = min(homeTeamData, awayTeamData);
end
