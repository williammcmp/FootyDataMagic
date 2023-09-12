function [left, avg, right] = calMeanCI(data, C)
    % Calculate the mean and confidence interval of data.

    % Calculate the sample size (number of data points)
    n = length(data);

    % Calculate the sample standard deviation
    s = sqrt(var(data));

    % Calculate the t-score for the given confidence level C
    t = icdf('T', (1 + C) / 2, n - 1);

    % Calculate the sample mean
    avg = mean(data);

    % Calculate the lower bound of the confidence interval
    left = avg - s * t / sqrt(n);

    % Calculate the upper bound of the confidence interval
    right = avg + s * t / sqrt(n);
end
