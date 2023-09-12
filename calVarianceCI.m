function [left, variance, right] = calVarianceCI(data, C)
    % Calculate the variance and confidence interval of data.

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
