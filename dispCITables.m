function dispCITables(winningData, losingData, marginData)
    % DISPTABLES - Display tables of data using MATLAB's uitable function.
    %
    % Input:
    %   winningData - Data for winning scores and 95% confidence intervals.
    %   losingData - Data for losing scores and 95% confidence intervals.
    %   marginData - Data for score margins and 95% confidence intervals.

    % Define column names for the tables
    columnNames = {'Year', '95% CI Mean'};

    % Create a figure for winning data
    fig1 = figure;
    set(fig1, 'Name', 'Winning Scores 95% CI');
    uitable(fig1, 'Data', winningData, 'ColumnName', columnNames);

    % Create a figure for losing data
    fig2 = figure;
    set(fig2, 'Name', 'Losing Scores 95% CI');
    uitable(fig2, 'Data', losingData, 'ColumnName', columnNames);

    % Create a figure for margin data
    fig3 = figure;
    set(fig3, 'Name', 'Score Margins 95% CI');
    uitable(fig3, 'Data', marginData, 'ColumnName', columnNames);
end
