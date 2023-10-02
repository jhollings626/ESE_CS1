load("COVIDbyCounty.mat");
load("ogData.mat"); %load the data yielded by casestudy1test.m - to declutter iterative files

%previous k-means yielded pretty inaccurate silhouette values, so we need
%to do some more work to improve the accuracy fo the algorithm

%best current idea is to run kmeans on each individual region first,
%optimizing it along the way to eventually yield very accurate centroids
%for each division. Then run kmeans again using these centroids as starting
%points for a call to kmeans using the entire training set, to yield final,
%more accurate centroids that consider the entire set of data. 

rng(2,"v4"); %set rng to v4 protocol with a seed of 2 - this yielded the highest average silhouette during testing
options = statset('UseParallel',true,'MaxFunEvals',100,'DerivStep',100); %configure furhter options for kmeans call
[testIDX, testCentroids] = kmeans(division1training,6,'replicates',20,'distance','sqeuclidean','start','plus','options',options); %call kmeans on the first division
division1silhouettes = silhouette(division1training,testIDX); %calculate silhouette values for the centroids generated
avgD1silhouette = mean(division1silhouettes); %computer average value of the division 1 silhouettes
disp(avgD1silhouette);

[d1avgIDX, d1avgCentroid] = kmeans(testCentroids,1); %generate an average of the six centroids for the first division, to be used as a starting centroid in the final kmeans call
