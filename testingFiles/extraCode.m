% Call kmeans on the first division
[d1IDX, d1Centroids] = kmeans(division1training,6,'replicates',replicates1,'distance','sqeuclidean','start','plus','options',options); 
% Calculate silhouette values for the centroids generated
division1silhouettes = silhouette(division1training,d1IDX); 
% Computer average value of the division 1 silhouettes
avgD1silhouette = mean(division1silhouettes); 
disp(avgD1silhouette);

[d1avgIDX, d1avgCentroid] = kmeans(d1Centroids,1); %generate an average of the six centroids for the first division, to be used as a starting centroid in the final kmeans call
centroidCounts = zeros(1,6); %create column vector for seeing most popular centroids
for i = 1:20
    centroidCounts(d1IDX(i)) = centroidCounts(d1IDX(i)) + 1; %centroidCounts will show outliers
end
[topCentroid, topIDX] = max(centroidCounts);
finalCentroids(1,:) = d1Centroids(centroidCounts(topIDX),:);





%use more than 9 clusters in final k-means! Possibly a different number of
%clusters for each division too!v
%previous k-means yielded pretty inaccurate silhouette values, so we need
%to do so me more work to improve the accuracy fo the algorithm

%best current idea is to run kmeans on each individual region first,
%optimizing it along the way to eventually yield very accurate centroids
%for each division. Then run kmeans again using these centroids as starting
%points for a call to kmeans using the entire training set, to yield final,
%more accurate centroids that consider the entire set of data. 

finalCentroids = zeros(9,156); ws = 'base';



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