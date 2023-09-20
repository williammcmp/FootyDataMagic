function showSeasonMeans(homeTeam, awayTeam, removeOutliers)
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

    % Loop through each season
    for i = 1:numel(years)
        % Calculate and store average winning score for the season
        win = calWinningScores(homeTeam(years{i}), awayTeam(years{i}));
        lose = calLossingScores(homeTeam(years{i}), awayTeam(years{i}));
        margin = calMargins(homeTeam(years{i}), awayTeam(years{i}));
        
        if (removeOutliers)
            [win, winOutliers] = calRemoveOutliers(win)
            [lose, winOutliers] = calRemoveOutliers(lose)
            [margin, winOutliers] = calRemoveOutliers(margin)
        end
        winAvg = [winAvg; mean(win)];

        % Calculate and store average losing score for the season
        loseAvg = [loseAvg; mean(lose)];

        % Calculate and store average margin for the season
        marginAvg = [marginAvg; mean(margin)];

    end

    % Create a figure with a name and specified position
    fig = figure;
    set(fig, 'Name', 'Averages per season', 'Position', [10, 10, 1100, 900]);

    % Create subplots for different statistics
    [winPValue, winTestValue] = calPValue(winAvg, (2011:2020));
    subplot(3, 1, 1)
    hold on
    plot((2011:2020), winAvg, 'DisplayName', "P-value : " + num2str(winPValue) + " Test Value : " + num2str(winTestValue));
    [x_fit, y_fit] = calLineBestFit((2011:2020),winAvg);
    plot(x_fit, y_fit, 'r', 'LineWidth', 1, 'DisplayName', "Line of best fit");
    hold off
    title("Average Winning Score per Season")
    xlabel('Season (year)');
    ylabel('Points');
    legend('Location', 'SouthWest')

    [losePValue, loseTestValue] = calPValue(loseAvg, (2011:2020));
    subplot(3, 1, 2)
    hold on
    plot((2011:2020), loseAvg, 'DisplayName', "P-value : " + num2str(losePValue) + " Test Value : " + num2str(loseTestValue));
    [x_fit, y_fit] = calLineBestFit((2011:2020),loseAvg);
    plot(x_fit, y_fit, 'r', 'LineWidth', 1, 'DisplayName', "Line of best fit");
    hold off
    title("Average Losing Score per Season")
    xlabel('Season (year)');
    ylabel('Points');
    legend('Location', 'SouthWest')

    [marginPValue, marginTestValue] = calPValue(marginAvg, (2011:2020));
    subplot(3, 1, 3)
    hold on
    plot((2011:2020), marginAvg, 'DisplayName', "P-value : " + num2str(marginPValue)  + " Test Value : " + num2str(marginTestValue));
    [x_fit, y_fit] = calLineBestFit((2011:2020),marginAvg);
    plot(x_fit, y_fit, 'r', 'LineWidth', 1, 'DisplayName', "Line of best fit");
    hold off
    title("Average Score Margin (Home - Away) per Season")
    xlabel('Season (year)');
    ylabel('Points');
    legend('Location', 'SouthWest')



    % print the pearson correlation coefficents
    data = {"", "P-values", "Test Value (if < 0.05 then significant)";
            "Average Winning Scores", num2str(winPValue), num2str(winTestValue);
            "Average Losing Scores", num2str(losePValue), num2str(loseTestValue);
            "Average Score Margin", num2str(marginPValue), num2str(marginTestValue);};
    
    % Display the data
    disp("Person correlation coeffiecent values:")
    disp(data)

end


function [x_fit, y_fit] = calLineBestFit(x,y) 

    % Fit a first-degree (linear) polynomial
    coefficients = polyfit(x, y, 1);
    
    % Create a range of x values for the line
    x_fit = min(x):0.1:max(x);
    
    % Use the coefficients to calculate the corresponding y values for the line
    y_fit = polyval(coefficients, x_fit);

end 
