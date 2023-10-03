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
