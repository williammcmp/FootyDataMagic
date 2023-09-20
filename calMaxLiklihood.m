function [bestMu, bestSigma] = calMaxLiklihood(data, dataType)
    % calMaxLiklihood - Calculate and Plot Maximum Likelihood Estimates
    %
    % Syntax:
    %   [bestMu, bestSigma] = calMaxLiklihood(data, dataType)
    %
    % Inputs:
    %   data - Input dataset for maximum likelihood estimation.
    %   dataType - A string specifying the type or name of the dataset.
    %
    % Outputs:
    %   bestMu - Maximum likelihood estimate for the mean (mu) of the dataset.
    %   bestSigma - Maximum likelihood estimate for the standard deviation (sigma) of the dataset.
    %
    % Description:
    %   This function calculates and plots the maximum likelihood estimates for
    %   the mean (mu) and standard deviation (sigma) of a given dataset. It
    %   consists of two sub-functions, calSigma and calMu, that compute the
    %   maximum likelihood estimates for sigma^2 and mu, respectively.
    %
    %   The function also generates plots showing the likelihood functions for
    %   both parameters.
    %
    % Example:
    %   data = randn(100, 1);  % Sample data assumed to be normally distributed
    %   dataType = 'Sample Data';
    %   [bestMu, bestSigma] = calMaxLiklihood(data, dataType);

    % Calling the functions to calculate and plot the maximum likelihood values
    figure
    
    bestSigma = calSigma(data, dataType);
    bestMu = calMu(data, dataType);
end

% Function to calculate the best sigma (standard deviation) value
function bestSigma2 = calSigma(data, dataType)
    % Setting up initial variables and best guesses
    sigma2Guess = std(data)^2;
    muGuess = mean(data);
    sigma2Range = sigma2Guess - 100:0.5:sigma2Guess + 100;
    lnFwin = zeros(size(sigma2Range));
    
    % Calculating the best sigma value
    for j = 1:length(sigma2Range)
        s = sigma2Range(j);
        lnFwin(j) = -length(data)/2 * log(2*pi*s);
        for i = 1:length(data)
            lnFwin(j) = lnFwin(j) - 1/(2*s) * (data(i) - muGuess)^2;
        end
    end
    
    % Getting the maximum likelihood from data
    [lnFMax, index] = max(lnFwin);
    bestSigma2 = sigma2Range(index);
    
    % Plotting the plot of the best sigma with fixed mu values
    subplot(1,2,1)
    hold on
    plot(sigma2Range, lnFwin,  'DisplayName', "Fixed \mu = " + muGuess)
    plot(bestSigma2, lnFMax, 'r*','DisplayName', "Best \sigma^2 = " + bestSigma2)
    title("Maximum Likelihood Function of " + dataType)
    xlabel("\sigma^2")
    ylabel("ln(F)")
    legend('Location', 'SouthWest')
    hold off
end

% Function to calculate the best mu (mean) value
function bestMu = calMu(data, dataType)
    % Setting up initial variables and best guesses
    muGuess = mean(data);
    muRange = muGuess - 50:0.5:muGuess + 50;
    sigma2Guess = std(data)^2;
    lnFwin = zeros(size(muRange));
    
    % Calculating the best mu value
    for j = 1:length(muRange)
        mu = muRange(j);
        lnFwin(j) = -length(data)/2 * log(2*pi*sigma2Guess);
        for i = 1:length(data)
            lnFwin(j) = lnFwin(j) - 1/(2*sigma2Guess) * (data(i) - mu)^2;
        end
    end
    
    % Getting the maximum likelihood from data
    [lnFMax, index] = max(lnFwin);
    bestMu = muRange(index);
    
    % Plotting the plot of the best mu with fixed sigma values
    subplot(1,2,2)
    hold on
    plot(muRange, lnFwin, 'DisplayName', "Fixed \sigma^2 = " + sigma2Guess)
    plot(bestMu, lnFMax, 'r*', 'DisplayName', "Best \mu = " + bestMu)
    title("Maximum Likelihood Function of " + dataType)
    xlabel("\mu")
    ylabel("ln(F)")
    legend('Location', 'SouthWest')
    
    hold off
end
