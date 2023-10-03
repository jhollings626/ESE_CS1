load("COVIDbyCounty.mat"); %load covid data
load("training.mat"); %load training data
load("testing.mat"); %load testing data

run('diffValuesofK.m');

divisions = ["New England","Middle Atlantic","East North Central","West North Central",...
    "South Atlantic","East South Central","West South Central","Mountain",...
    "Pacific"];  %create division vector

%compute the distance to each one of
%the centroids. Tkae the 5 or 10 nearest neighbors to the centroid and
%assign it meaning based on the closest data points

%after assigning meanings to each centroid, go back through the training
%data and compare each data point to the centroid that it got sorted into,
%then compare whether the acctual division of the data matches taht
%assigned to the centroid that it got sorted into by kmeans... 
testData = training(1,156);
currDivision = table2cell(CNTY_CENSUS(1,3));

%for each entry in training data, need to compare its distance from 

%for i = 1:length(training)

distances = zeros(225, 2);
fiveNeighbors = zeros(12, 10);

for k = 1:12
    for i = 1:225
        distances(i, 1) = sqrt(norm(centroids(k, :) - CNTY_COVID(i, :)));
        distances(i,2) = i;
    end

    distances = sortrows(distances, 'ascend');
    %county1 = CNTY_CENSUS(CNTY_COVID(), "CTYNAME");


    for j = 1:10
        closestCountyIDX = distances(j,2);
        fiveNeighbors(k, j) = CNTY_CENSUS.DIVISION(closestCountyIDX);
    end
end

classifications = [1; 1; 2; 3; 3; 4; 5; 6; 7; 7; 8; 9];

correct = 0;
incorrect = 0;

for i = 1:45
    testDistances = zeros(12, 1);
    for j = 1:12
        testDistances(j, 1) = sqrt(norm(centroids(j, :)-testing(i, :)));
    end
    testDistances = sortrows(testDistances, 'ascend');
    assignment = testDistances(1, 1);

    %index = CNTY_COVID(find(testing(i,:)));
    index = find(CNTY_COVID(i, :)==testing(i, :));
end





