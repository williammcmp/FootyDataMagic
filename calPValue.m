function [pValue, testValue] = calPValue(xData, yData)

    % calcuates the Pearson Correlation coefficent and the test values for hyoptesis testing. if testValues < 0.05 -> then correlction is stattically signifficant.
    [pValues, testValues] = corrcoef(xData, yData); 

    pValue = pValues(1,2);
    testValue = testValues(1,2);
end
