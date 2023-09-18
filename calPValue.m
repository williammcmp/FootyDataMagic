function [pValue, testValue] = calPValue(xData, yData)
    % calPValue - Calculate Pearson Correlation Coefficient and Hypothesis Test Value
    %
    % Syntax:
    %   [pValue, testValue] = calPValue(xData, yData)
    %
    % Inputs:
    %   xData - First dataset for correlation calculation.
    %   yData - Second dataset for correlation calculation.
    %
    % Outputs:
    %   pValue - Pearson Correlation Coefficient between xData and yData.
    %   testValue - Hypothesis test value for significance testing.
    %
    % Description:
    %   This function calculates the Pearson Correlation Coefficient and the
    %   associated hypothesis test value for testing the significance of the
    %   correlation between two datasets, xData and yData. If testValue is less
    %   than 0.05, it indicates that the correlation is statistically significant.
    %
    % Example:
    %   xData = [1, 2, 3, 4, 5];
    %   yData = [2, 4, 6, 8, 10];
    %   [pValue, testValue] = calPValue(xData, yData);

    % calcuates the Pearson Correlation coefficent and the test values for hyoptesis testing. if testValues < 0.05 -> then correlction is stattically signifficant.
    [pValues, testValues] = corrcoef(xData, yData); 

    pValue = pValues(1,2);
    testValue = testValues(1,2);
end
