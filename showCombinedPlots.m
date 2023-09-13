function showCombinedPlots(homeTeam, awayTeam)
    % Plot various statistics for home and away teams over the years.
    
    % Get the years from the keys of homeTeam map
    years = keys(homeTeam);
    
    % Create a new figure
    figure;

    % Subplot 1: Margins over each year
    subplot(3, 1, 1);
    hold on;

    % Plot the combined margins over each year
    for i = 1:numel(years)
        year = years{i};
        x = 1:length(homeTeam(year));
        y = calMargins(homeTeam(year), awayTeam(year))';
        
        plot(x, y); 
    end
    
    % Add labels and a title
    xlabel('Game Number');
    ylabel('Points');
    title('Margins over each year');
    xlim([1, 208]);

    % Subplot 2: Winning Scores over each year
    subplot(3, 1, 2);
    hold on;

    % Plot the winning scores over each year
    for i = 1:numel(years)
        year = years{i};
        x = 1:length(homeTeam(year));
        y = calWinningScores(homeTeam(year), awayTeam(year))';
        
        plot(x, y); 
    end
    
    % Add labels and a title
    xlabel('Game Number');
    ylabel('Points');
    title('Winning Scores over each year');
    xlim([1, 208]);
    hold off;

    % Subplot 3: Losing Scores over each year
    subplot(3, 1, 3);
    hold on;

    % Plot the losing scores over each year
    for i = 1:numel(years)
        year = years{i};
        x = 1:length(homeTeam(year));
        y = calLossingScores(homeTeam(year), awayTeam(year))';
        
        plot(x, y);
    end
    
    % Add labels and a title
    xlabel('Game Number');
    ylabel('Points');
    title('Losing Scores over each year');
    xlim([1, 208]);
    hold off;

    % Add a legend to distinguish years
    legend(years);

    
end