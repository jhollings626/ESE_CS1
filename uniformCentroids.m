load("COVIDbyCounty.mat"); %load covid data
load("training.mat"); %load training data
load("testing.mat"); %load testing data

%previous final calls to k-means only used 9 centroids, 1 for each
%division, so now it's time to attempt to use more than 1 centroid for each
%division...


divisionK = 3; %define number of centroids per division
finalNumCentroids = 9 * divisionK;
ws = 'base'; %define workspace for future calls to assignin
divisionReplicates = 10; %define number of replicates for divisional kmeans calls
rng(1,"v4"); %define rng protocol
options = statset('UseParallel',true,'MaxFunEvals',...
    100,'DerivStep',100); %establish additional parameters for kmeans call


finalCentroids = []; %create finalCentroids,matrix that stores all centroids
divisions = ["New England","Middle Atlantic","East North Central","West North Central",...
    "South Atlantic","East South Central","West South Central","Mountain",...
    "Pacific"];  %create division vector


IDXcount = 0;

for i = 1:numel(divisions)
    lowerBound = 20*IDXcount + 1; upperBound = 20*i;
    [idxTemp,centroidTemp] = kmeans(training(lowerBound:upperBound,:),divisionK,'replicates',divisionReplicates,...
        'distance','sqeuclidean','start','plus','options',options);
    finalCentroids = cat(1,centroidTemp,finalCentroids);
    IDXcount = IDXcount + 1;
end

[refinedIDX, refinedCentroids] = kmeans(training,finalNumCentroids,'distance','sqeuclidean','start',finalCentroids,'options',options);
refinedSilhouettes = silhouette(training,refinedIDX);
bar(refinedSilhouettes)
avgRefinedSilhouette = mean(refinedSilhouettes);
fprintf('average silhouette value: %.5f\n', avgRefinedSilhouette);

    