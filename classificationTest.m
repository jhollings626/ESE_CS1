% Loading necessary data
load("COVIDbyCounty.mat"); 
load("training.mat"); 
load("testing.mat"); 

run('diffValuesofK.m');

%Create division vector
divisions = ["New England","Middle Atlantic","East North Central","West North Central",...
    "South Atlantic","East South Central","West South Central","Mountain",...
    "Pacific"];  

%Compute the distance to each one of
%the centroids. Take the 5 or 10 nearest neighbors to the centroid and
%assign it meaning based on the closest data points

%after assigning meanings to each centroid, go back through the training
%data and compare each data point to the centroid that it got sorted into,
%then compare whether the acctual division of the data matches taht
%assigned to the centroid that it got sorted into by kmeans... 
testData = training(1,156);
currDivision = table2cell(CNTY_CENSUS(1,3));

%for each entry in training data, need to compare its distance from 


% Gets ten nearest neighbors in CNTY_COVID for each centroid. 10 nearest
% neighbors for the ith centroid are stored in the ith row of tenNeighbors.
distances = zeros(225, 2);
tenNeighbors = zeros(12, 10);
for k = 1:12
    for i = 1:225
        distances(i, 1) = sqrt(norm(centroids(k, :) - CNTY_COVID(i, :)));
        distances(i,2) = i;
    end

    distances = sortrows(distances, 'ascend');
    for j = 1:10
        closestCountyIDX = distances(j,2);
        tenNeighbors(k, j) = CNTY_CENSUS.DIVISION(closestCountyIDX);
    end
end

% Assigning division number classifications to each centroid
classifications = [1; 1; 2; 3; 3; 4; 5; 6; 7; 7; 8; 9];

correct = 0;
incorrect = 0;
%%
% Assigns each data entry in the testing set to a centroid, checks if
% assigned classification is equal to true classification. 
for i = 1:45
    testDistances = zeros(12, 2);
    assignment = zeros(1,2);
    for j = 1:12
        testDistances(j, 1) = sqrt(norm(centroids(j, :)-testing(i, :)));
        testDistances(j,2) = j;
    end
    testDistances = sortrows(testDistances, 'ascend');
    % First column stores the closest neighbor calculation for the county
    assignment(1,1) = testDistances(1,1); 
    % Second column stores the division number of the centroid
    assignment(1,2) = classifications(testDistances(1,2)); 
    testingValue = testing(i,1);
    CNTY_COVID20 = CNTY_COVID(:,1)';
    testValueIDX = find(CNTY_COVID20 == testingValue);
    testValDivision = CNTY_CENSUS.DIVISION(testValueIDX);
    if assignment(1,2) == testValDivision
        correct = correct + 1;
    else
        incorrect = incorrect + 1;
    end
end

percentCorrect = (correct/(incorrect + correct)) * 100;
percentCorrect = round(percentCorrect,2,'decimals');
%disp(percentCorrect);
fprintf('Percent Correct: %.2f%%\n', percentCorrect);



