function [mu, sigma] = calMaxLiklihood2(data)
    
    % Set up the initial estimates for mu and sigma
    mu = 1/numel(data);  % Initialize mu
    sigma = 1/numel(data);  % Initialize sigma

    x = 0;  % Initialize a variable to accumulate the sum of data points
    
    % Calculate the sum of all data points
    for i = 1:numel(data)
        x = x + data(i);
    end
    
    % Update the estimate for mu using the sum of data
    mu = mu * x;
    
    x = 0;  % Reset the accumulator variable
    
    % Calculate the sum of squared differences from the updated mu
    for i = 1:numel(data)
        x = x + (data(i) - mu)^2;
    end
    
    % Update the estimate for sigma using the sum of squared differences
    sigma = sigma * x;
end
