% calWinningScores - Calculate the winning scores from each game.
%
%   winningScores = calWinningScores(homeTeamData, awayTeamData) calculates
%   the winning scores by taking the maximum value between the home team's data
%   and the away team's data for each game.
%
%   Input:
%     homeTeamData - Numeric array representing home team data.
%     awayTeamData - Numeric array representing away team data.
%
%   Output:
%     winningScores - Numeric array representing the winning scores for each game.

function winningScores = calWinningScores(homeTeamData, awayTeamData)
    % Calculate the winning scores
    winningScores = max(homeTeamData, awayTeamData);
end
