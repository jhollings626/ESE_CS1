load("COVIDbyCounty.mat");
load("ogData.mat"); %load the data yielded by casestudy1test.m - to declutter iterative files

%previous k-means yielded pretty inaccurate silhouette values, so we need
%to do some more work to improve the accuracy fo the algorithm

%best current idea is to run kmeans on each individual region first,
%optimizing it along the way to eventually yield very accurate centroids
%for each division. Then run kmeans again using these centroids as starting
%points for a call to kmeans using the entire training set, to yield final,
%more accurate centroids that consider the entire set of data. 
rng(2,"v4");
options = statset('UseParallel',true,'MaxFunEvals',100,'DerivStep',100);
[testIDX, testCentroids] = kmeans(division1training,6,'replicates',20,'distance','sqeuclidean','start','plus','options',options);
division1silhouettes = silhouette(division1training,testIDX);
avgD1silhouette = mean(division1silhouettes);
disp(avgD1silhouette);
