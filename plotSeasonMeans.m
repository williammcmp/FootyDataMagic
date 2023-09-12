function plotSeasonMeans(homeTeam, awayTeam)
    % PLOTSEASONMEANS - Plot various statistics per season using homeTeam and awayTeam data.
    %
    % Input:
    %   homeTeam - A containers.Map containing home team data for multiple seasons.
    %   awayTeam - A containers.Map containing away team data for the same seasons.
    
    % Get the list of years (seasons)
    years = keys(homeTeam);

    % Initialize arrays to store statistics
    winAvg = [];
    loseAvg = [];
    marginAvg = [];
    homeVsAway = [];

    % Loop through each season
    for i = 1:numel(years)
        % Calculate and store average winning score for the season
        winAvg = [winAvg; mean(calWinningScores(homeTeam(years{i}), awayTeam(years{i})))];

        % Calculate and store average losing score for the season
        loseAvg = [loseAvg; mean(calLossingScores(homeTeam(years{i}), awayTeam(years{i})))];

        % Calculate and store average margin for the season
        marginAvg = [marginAvg; mean(calMargins(homeTeam(years{i}), awayTeam(years{i})))];

        % Calculate and store the number of home team wins for the season
        homeVsAway = [homeVsAway; sum(homeTeam(years{i}) > awayTeam(years{i}))]; % How often home team wins vs. away team
    end

    % Create a figure with a name
    fig = figure;
    set(fig, 'Name', 'Averages per season');

    % Create subplots for different statistics
    subplot(4, 1, 1)
    plot((2011:2020), winAvg);
    title("Average Winning Score")
    xlabel('Season (year)');
    ylabel('Points');

    subplot(4, 1, 2)
    plot((2011:2020), loseAvg);
    title("Average Losing Score")
    xlabel('Season (year)');
    ylabel('Points');

    subplot(4, 1, 3)
    plot((2011:2020), marginAvg);
    title("Average Margin")
    xlabel('Season (year)');
    ylabel('Points');

    subplot(4, 1, 4)
    plot((2011:2020), homeVsAway)
    title("Home Wins")
    xlabel('Season (year)');
end
