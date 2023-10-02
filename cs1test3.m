load("COVIDbyCounty.mat");
load("ogData.mat"); %load the data yielded by casestudy1test.m - to declutter iterative files

%use more than 9 clusters in final k-means! Possibly a different number of
%clusters for each division too!
%previous k-means yielded pretty inaccurate silhouette values, so we need
%to do so me more work to improve the accuracy fo the algorithm

%best current idea is to run kmeans on each individual region first,
%optimizing it along the way to eventually yield very accurate centroids
%for each division. Then run kmeans again using these centroids as starting
%points for a call to kmeans using the entire training set, to yield final,
%more accurate centroids that consider the entire set of data. 
finalCentroids = zeros(9,156); ws = 'base';
replicates1 = 20; %number of replicates for first calls to kmeans
replicates2 = 20; %number of replicates for second call to kmeans
rng(1,"v4"); %set rng to v4 protocol with a seed of 2 - this yielded the highest average silhouette during testing
options = statset('UseParallel',true,'MaxFunEvals',100,'DerivStep',100); %configure furhter options for kmeans call
[d1IDX, d1Centroids] = kmeans(division1training,6,'replicates',replicates1,'distance','sqeuclidean','start','plus','options',options); %call kmeans on the first division
division1silhouettes = silhouette(division1training,d1IDX); %calculate silhouette values for the centroids generated
avgD1silhouette = mean(division1silhouettes); %computer average value of the division 1 silhouettes
disp(avgD1silhouette);

[d1avgIDX, d1avgCentroid] = kmeans(d1Centroids,1); %generate an average of the six centroids for the first division, to be used as a starting centroid in the final kmeans call
centroidCounts = zeros(1,6); %create column vector for seeing most popular centroids
for i = 1:20
    centroidCounts(d1IDX(i)) = centroidCounts(d1IDX(i)) + 1; %centroidCounts will show outliers
end
[topCentroid, topIDX] = max(centroidCounts);
finalCentroids(1,:) = d1Centroids(centroidCounts(topIDX),:);


% selecting values of k for kmeans run on division1
d1SilhouetteValues = zeros(9, 1);
for k = 2:10
    [d1IDXTemp, d1CentroidsTemp] = kmeans(division1training, k, 'replicates',replicates1,'distance','sqeuclidean','start','plus','options',options);
    d1SilhouetteValues(k-1, 1) = mean(silhouette(division1training, d1IDXTemp));
end
d1K = find(d1SilhouetteValues==max(d1SilhouetteValues))+1;

% selecting value of k for means run on divisions 2-9
for i = 2:9
    silhouetteValuesName = ['d' num2str(i) 'SilhouetteValues'];
    divisionKName = ['d' num2str(i) 'K'];
    assignin(ws, silhouetteValuesName, zeros(9, 1));

    for k = 2:10
        [idxTemp, centroidsTemp] = kmeans(training(20*(i-1) + 1:20*i,:), k, 'replicates',replicates1,'distance','sqeuclidean','start','plus','options',options);
        assignin(ws, silhouetteValuesName(k-1, 1), mean(silhouette(training(20*(k-1) + 1:20*k,:), idxTemp)));
    end
    assignin(ws, divisionKName, find(silhouetteValuesName==max(silhouetteValuesName))+1);

end


for i = 2:9
   silhouetteName = ['division' num2str(i) 'silhouettes'];
   avgSilhouetteName = ['avgD' num2str(i) 'silhouette'];
   idxName = ['d' num2str(i) 'IDX']; %iterative name for each division's IDX in kmeans
   centroidName = ['d' num2str(i) 'Centroids']; %iterative name for each divisions centroids in kmeans
   [idxTemp,centroidTemp] = kmeans(training(20*(i-1) + 1:20*i,:),6,'replicates',replicates1,'distance','sqeuclidean','start','plus','options',options);
   assignin(ws,idxName,idxTemp);
   assignin(ws,centroidName,centroidTemp);
   for j = 1:20
    centroidCounts(idxTemp(j)) = centroidCounts(idxTemp(j)) + 1; %centroidCounts will show outliers
   end
   [topCentroid,topIDX] = max(centroidCounts); %filtering method goes here, using centroid counts
   finalCentroids(i,:) = centroidTemp(topIDX,:);
   %assignin(ws,silhouetteName,silhouette(trainingName,idxName));
end

[refinedIDX, refinedCentroids] = kmeans(training,9,'distance','sqeuclidean','start',finalCentroids,'options',options);
refinedSilhouettes = silhouette(training,refinedIDX);
avgRefinedSilhouette = mean(refinedSilhouettes);
disp(avgRefinedSilhouette);
