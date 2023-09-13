# AFL Data Analysis Project

## Overview

This MATLAB project is designed to analyze and visualize Australian Football League (AFL) data. It includes various functions and scripts for data import, statistical analysis, and visualization of different aspects of AFL games.

## Prerequisites

- MATLAB installed on your computer.
- AFL data in .dat format organized by season (e.g., "2011", "2012", etc.).

## Getting Started

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/williammcmp/afl-data-analysis.git
    ```

2. Open MATLAB and navigate to the project folder.

## Usage

1. Open the `main.m` script in MATLAB.

2. Edit the `folderPath` variable to specify the directory where your AFL data is stored.

3. Uncomment the sections in `main.m` that correspond to your analysis objectives.

4. Run the script in MATLAB to execute the desired analysis and generate visualizations.

## Project Structure

- `main.m`: The main script for executing data analysis and visualization.

- `calMargins.m`: Calculates the margin between home and away team scores.

- `calWinningScores.m`: Computes the winning scores from each game.

- `calLosingScores.m`: Computes the losing scores from each game.

- `calMeanCI.m`: Calculates the mean and confidence interval of data.

- `calVarianceCI.m`: Calculates the variance and confidence interval of data.

- `AFL/`: Sample AFL data in .dat format provided for testing purposes.

## Analysis Options

- `showSeason.m`: Plots figures for a specific season, including data distributions and outliers.

- `combinedPlots.m`: Overlays plots for all seasons onto a single graph for easy comparison.

- `showAllSeasons.m`: Generates figures for each season, including data distributions and outliers.

- `generateSeasonsMeanCIData.m`: Computes and stores data for 95% confidence intervals of season means.

- `dispTables.m`: Displays tables of data, including winning scores, losing scores, and score margins with confidence intervals.

- `plotSeasonMeans.m`: Produces plots of season means for various statistics.

## Contributing

Contributions to this project are welcome. Feel free to open issues, suggest improvements, or submit pull requests to enhance the functionality or documentation.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
