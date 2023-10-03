load("COVIDbyCounty.mat");
load("ogData.mat");

%use more than 9 clusters in final k-means! Possibly a different number of
%clusters for each division too!
%previous k-means yielded pretty inaccurate silhouette values, so we need
%to do so me more work to improve the accuracy fo the algorithm

%best current idea is to run kmeans on each individual region first,
%optimizing it along the way to eventually yield very accurate centroids
%for each division. Then run kmeans again using these centroids as starting
%points for a call to kmeans using the entire training set, to yield final,
%more accurate centroids that consider the entire set of data. 
finalCentroids = zeros(9,156);
ws = 'base';
k1 = 6; 
replicates1 = 20; 
replicates2 = 20; 
rng(1,"v4"); %define rng protocol 
options = statset('UseParallel',true,'MaxFunEvals',100,'DerivStep',100); %establish additional parameters for kmeans call

[d1IDX, d1Centroids] = kmeans(division1training,k1,'replicates',replicates1,'distance','sqeuclidean','start','plus','options',options);
division1silhouettes = silhouette(division1training,d1IDX);
avgD1silhouette = mean(division1silhouettes);
disp(avgD1silhouette);

[d1avgIDX, d1avgCentroid] = kmeans(d1Centroids,1);
finalCentroids(1,:) = d1avgCentroid;

for i = 2:9
    centroidCounts = zeros(1,k1);
    [idxTemp,centroidTemp] = kmeans(training(20*(i-1) + 1:20*i,:),k1,'replicates',replicates1,'distance','sqeuclidean','start','plus','options',options);
    assignin(ws,['d' num2str(i) 'IDX'],idxTemp);
    assignin(ws,['d' num2str(i) 'Centroids'],centroidTemp);
    
    for j = 1:20
        centroidCounts(idxTemp(j)) = centroidCounts(idxTemp(j)) + 1; 
    end
    
    [topCentroid,topIDX] = max(centroidCounts); 
    finalCentroids(i,:) = centroidTemp(topIDX,:);
end

[refinedIDX, refinedCentroids] = kmeans(training,9,'distance','sqeuclidean','start',finalCentroids,'options',options);
refinedSilhouettes = silhouette(training,refinedIDX);
avgRefinedSilhouette = mean(refinedSilhouettes);
disp(avgRefinedSilhouette);
