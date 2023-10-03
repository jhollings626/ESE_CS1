load("COVIDbyCounty.mat"); %load covid data
load("training.mat"); %load training data
load("testing.mat"); %load testing data

run('C:\Users\jackh\washu\ESE105\ESE_CS1\testingFiles\diffValuesofK.m');

%look at the first 5 entries in testing, all in division one, make sure
%they all belong to centroid 1->divisionK
%look at the whole covid county set, compute the distance to each one of
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
