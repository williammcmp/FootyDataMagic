function [cleanedData, outliers] = calRemoveOutliers(data)

    % Calculate the interquartile range (IQR)
    Q1 = quantile(data, 0.25);
    Q3 = quantile(data, 0.75);
    IQR = Q3 - Q1;
    
    % Define lower and upper bounds for outliers
    lowerBound = Q1 - 1.5 * IQR;
    upperBound = Q3 + 1.5 * IQR;
    
    % Identify outliers
    outliers = data(data < lowerBound | data > upperBound);
    
    % Remove outliers
    cleanedData = data(data >= lowerBound & data <= upperBound);
end