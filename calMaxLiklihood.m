% This function calculates and plots the maximum likelihood values for
% mu (mean) and sigma (standard deviation) for a given dataset.

function [bestMu, bestSigma] = calMaxLiklihood(data, dataType)
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
    plot(sigma2Range, lnFwin)
    plot(bestSigma2, lnFMax, 'r*')
    title("Maximum Likelihood Function of " + dataType)
    xlabel("\sigma^2")
    ylabel("ln(F)")
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
    plot(muRange, lnFwin)
    plot(bestMu, lnFMax, 'r*')
    title("Maximum Likelihood Function of " + dataType)
    xlabel("\mu")
    ylabel("ln(F)")
    hold off
end
