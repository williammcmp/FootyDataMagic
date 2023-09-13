function showSeasonMeans(homeTeam, awayTeam)
    % SHOWSEASONMEANS - Plot various statistics per season using homeTeam and awayTeam data.
    %
    % Input:
    %   homeTeam - A containers.Map containing home team data for multiple seasons.
    %   awayTeam - A containers.Map containing away team data for the same seasons.

    % Get the list of years (seasons)
    years = keys(homeTeam);

    % Initialize cell arrays to store p-values and test values
    pValues = cell(3, 2);
    testValues = cell(3, 2);

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

    % Create a figure with a name and specified position
    fig = figure;
    set(fig, 'Name', 'Averages per season', 'Position', [10, 10, 1100, 900]);

    % Create subplots for different statistics
    [winPValue, winTestValue] = calPValue(winAvg, (2011:2020));
    subplot(4, 1, 1)
    plot((2011:2020), winAvg, 'DisplayName', "P-value : " + num2str(winPValue));
    title("Average Winning Score per Season")
    xlabel('Season (year)');
    ylabel('Points');
    legend('Location', 'SouthWest')

    [losePValue, loseTestValue] = calPValue(loseAvg, (2011:2020));
    subplot(4, 1, 2)
    plot((2011:2020), loseAvg, 'DisplayName', "P-value : " + num2str(losePValue));
    title("Average Losing Score per Season")
    xlabel('Season (year)');
    ylabel('Points');
    legend('Location', 'SouthWest')

    [marginPValue, marginTestValue] = calPValue(marginAvg, (2011:2020));
    subplot(4, 1, 3)
    plot((2011:2020), marginAvg, 'DisplayName', "P-value : " + num2str(marginPValue));
    title("Average  (Home - Away) per Season")
    xlabel('Season (year)');
    ylabel('Points');
    legend('Location', 'SouthWest')

    [homeVsAwayPValue, homeVsAwayTestValue] = calPValue(homeVsAway, (2011:2020));
    subplot(4, 1, 4)
    plot((2011:2020), homeVsAway, 'DisplayName', "P-value : " + num2str(homeVsAwayPValue))
    title("Home Wins per Season")
    xlabel('Season (year)');
    ylabel('Home Wins')
    legend('Location', 'SouthWest')

    % Create a cell array for winning data
    data = {"", "P-values", "Test Value (< 0.05 == significant)";
            "Average Winning Scores", num2str(winPValue), num2str(winTestValue);
            "Average Losing Scores", num2str(losePValue), num2str(loseTestValue);
            "Average Score Margin", num2str(marginPValue), num2str(marginTestValue);
            "Home wins", num2str(homeVsAwayPValue), num2str(homeVsAwayTestValue)};
    
    % Display the data
    disp(data)

end
