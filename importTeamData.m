% Define a function to import team data from .dat files
function [homeTeam, awayTeam] = importTeamData(folderPath)
    % IMPORTTEAMDATA - Import team data from .dat files in a folder.
    %   [team1, team2] = IMPORTTEAMDATA(folderPath) reads data from .dat files
    %   in the specified folderPath and returns it as containers.Map objects.
    %
    %   Input:
    %   folderPath - The path to the folder containing .dat files.
    %
    %   Output:
    %   team1 - A containers.Map containing Team 1 data with years as keys.
    %   team2 - A containers.Map containing Team 2 data with years as keys.

    % List all files in the folder
    files = dir(fullfile(folderPath, '*.dat'));
    
    % Extract file names from the 'files' structure
    fileNames = {files.name};
    
    % Determine the number of files in the array
    numFiles = numel(fileNames);
    
    % Creating the Team variables - each column will be a different year
    homeTeam = containers.Map;
    awayTeam = containers.Map;
    
    % Use a for loop to iterate through the file names
    for i = 1:numFiles
        % Get the current file name
        fileName = fullfile(folderPath, fileNames{i});
        
        % Read data from the file using importdata
        currentFile = importDataFromDatFile(fileName);
    
        keyName = mapKey(i);
        
        % Add the data to the team's variables
        awayTeam(keyName) = currentFile(:, 1);
        homeTeam(keyName) = currentFile(:, 2);
    end
end

% Define the import data function (if not already defined)
function data = importDataFromDatFile(filename)
    % IMPORTDATAFROMDATFILE - Import data from a .dat file
    %   data = IMPORTDATAFROMDATFILE(filename) reads data from the specified
    %   .dat file and returns it as a numeric array.
    %
    %   Input:
    %   filename - The name of the .dat file to be imported.
    %
    %   Output:
    %   data - The imported data as a numeric array.

    % Use importdata to read the data from the file
    data = importdata(filename);
end

function val = mapKey(input)
    % MAPKEY - Generate a key for the containers.Map based on the input year.
    %   val = MAPKEY(input) generates a key based on the input year.
    %   For example, if input is 1, the output will be '2011'.

    val = num2str(input + 2010);
end
