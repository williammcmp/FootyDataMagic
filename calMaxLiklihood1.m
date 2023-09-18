function [best_mu, best_sigma] = calMaxLiklihood1(data)
    % Generate some example normally distributed data
    
    % Initialize variables for MLE estimation
    mu_hat = min(data); % Initial guess for mean
    sigma2_hat = 1; % Initial guess for variance
    
    figure

    % plotting the var of sigma^2 - mu is fixed
    logLiklihoodVals = [];
    for j=linspace(0.01, 40, 100) % iterate through sigma2 vals
        logLiklihoodVals = [logLiklihoodVals; calLogLiklilyhood(data, 110, j)];
        
    end
    hold on
    plot(linspace(0.01, 40, 100), logLiklihoodVals)
    plot(27, max(logLiklihoodVals), 'r*')
    title("Maximum Likelihood Vs \sigma^2 (Fixed \mu)")
    xlabel("\sigma^2")
    ylabel("ln(F)")
    hold off

    figure
    logLiklihoodVals = [];
    for j=linspace(0, max(data), 100) % iterate through sigma2 vals
        logLiklihoodVals = [logLiklihoodVals; calLogLiklilyhood(data, j, 0.03)];
        
    end
    hold on
    plot(linspace(0, max(data), 100), logLiklihoodVals)
    plot(110, max(logLiklihoodVals), 'r*')
    xlabel("\mu^2")
    ylabel("ln(F)")
    hold off
    


end

function val = calLogLiklilyhood(data, mu, sigma2)
    mu_sum = 0;
    for i=1:numel(data)
        mu_sum = mu_sum + (data(i) - mu)^2;
    end
    
    val = -((numel(data)/2) * log(2*pi*sigma2)) - (1/(2 * sigma2) * mu_sum);
    
end