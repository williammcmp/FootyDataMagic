% Create a figure
fig = figure;

% Create some data for the table (for demonstration)
data = {'Alice', 25; 'Bob', 30; 'Charlie', 28; 'David', 22};
columnNames = {'Name', 'Age'};

% Create a uitable to display the data
uitable(fig, 'Data', data, 'ColumnName', columnNames, 'Position', [100, 100, 200, 100]);

% Optionally, you can customize the table's properties
tableHandle = findobj(fig, 'Type', 'uitable');
set(tableHandle, 'FontSize', 12, 'FontWeight', 'bold');

% Create a subplot or other axes for the main plot
subplot(1, 2, 1); % This is just for demonstration, adjust as needed

% Plot your main data in this subplot
% ...

% Add labels, titles, etc.
xlabel('X-axis');
ylabel('Y-axis');
title('Main Plot');

% Create another subplot for additional data or plots
subplot(1, 2, 2); % This is just for demonstration, adjust as needed

% Plot more data or create additional subplots
% ...

% Add labels, titles, etc.
xlabel('X-axis');
ylabel('Y-axis');
title('Additional Plot');
