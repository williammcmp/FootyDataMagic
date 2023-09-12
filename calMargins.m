% calMargins - Calculate the margin between the home and away teams.
%
%   margin = calMargins(homeTeamData, awayTeamData) calculates the margin by
%   subtracting the away team's data from the home team's data.
%
%   Input:
%     homeTeamData - Numeric array representing home team data.
%     awayTeamData - Numeric array representing away team data.
%
%   Output:
%     margin - Numeric array representing the margin between home and away teams.

function margin = calMargins(homeTeamData, awayTeamData)
    % Calculate the margin
    margin = homeTeamData - awayTeamData;
end
