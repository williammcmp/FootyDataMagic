function [left, variance, right] = calVarianceCI(data, C)
    % calVarianceCI - Calculate Variance and Confidence Interval of Data
    %
    % Syntax:
    %   [left, variance, right] = calVarianceCI(data, C)
    %
    % Inputs:
    %   data - The dataset for which variance and confidence interval are calculated.
    %   C - The desired confidence level (e.g., 0.95 for a 95% confidence interval).
    %
    % Outputs:
    %   left - The lower bound of the confidence interval for variance.
    %   variance - The sample variance of the data.
    %   right - The upper bound of the confidence interval for variance.
    %
    % Description:
    %   This function calculates the sample variance of a given dataset 'data'
    %   and then computes the confidence interval for the population variance
    %   based on the specified confidence level 'C'. The confidence interval
    %   is returned as [left, right], where 'left' is the lower bound and
    %   'right' is the upper bound of the confidence interval.
    %
    % Example:
    %   data = [10, 12, 15, 18, 20];
    %   C = 0.95; % 95% confidence interval
    %   [left, variance, right] = calVarianceCI(data, C);

    % Calculate the sample size (number of data points)
    n = length(data);

    % Calculate the sample standard deviation
    s = sqrt(var(data));

    % Calculate the chi-square values for the given confidence level C
    chi1 = icdf('chi2', (1 + C) / 2, n - 1);
    chi2 = icdf('chi2', (1 - C) / 2, n - 1);

    % Calculate the sample variance
    variance = s^2;

    % Calculate the lower bound of the confidence interval
    left = (n - 1) * s^2 / chi1;

    % Calculate the upper bound of the confidence interval
    right = (n - 1) * s^2 / chi2;
end
