load("COVIDbyCounty.mat");


%%
%Preparing to generate centroids

% Creating division1Training and division1Testing
indicesToRemove = zeros(1,5);
logicalIndexDivision1 = (CNTY_CENSUS.DIVISION == 1);
division1 = CNTY_COVID(logicalIndexDivision1, :);
division1magnitudes = zeros(25,1); division1testing = zeros(5,156);
division1training= division1;
for i =1:25
    division1magnitudes(i) = dot(ones(1,156),division1(i,:));
end
[division1magnitudesSORTED, division1magnitudesIDX] = sortrows(division1magnitudes, 'descend');
count = 1;
for i = 4:5:24
    division1testing(count,:) = division1(division1magnitudesIDX(i),1:156);
    division1training(division1magnitudesIDX(i), :) = [];
    count = count + 1;
end

% Creating division2Training and division2Testing
logicalIndexDivision2 = (CNTY_CENSUS.DIVISION == 2);
division2 = CNTY_COVID(logicalIndexDivision2, :);
division2magnitudes = zeros(25,1); division2testing = zeros(5,156);
division2training= division2;
for i =1:25
    division2magnitudes(i) = dot(ones(1,156),division2(i,:));
end
[division2magnitudesSORTED, division2magnitudesIDX] = sortrows(division2magnitudes, 'descend');
count = 1;
for i = 4:5:25
    indicesToRemove(1,count) = division2magnitudesIDX(i);
    count = count +  1;
end
indicesToRemove = sort(indicesToRemove',1,'descend')';
count = 1;
for i = 4:5:25
    division2testing(count,:) = division2(division2magnitudesIDX(i),1:156);
    count = count + 1;
end
for i = 1:5
    division2training(indicesToRemove(i), :) = [];
end
%% 
% Creating division3Training and division3Testing
logicalIndexDivision3 = (CNTY_CENSUS.DIVISION == 3);
division3 = CNTY_COVID(logicalIndexDivision3, :);
division3magnitudes = zeros(25,1); division3testing = zeros(5,156);
division3training= division3;
for i =1:25
    division3magnitudes(i) = dot(ones(1,156),division3(i,:));
end
[division3magnitudesSORTED, division3magnitudesIDX] = sortrows(division3magnitudes, 'descend');
count = 1;
for i = 4:5:25
    indicesToRemove(1,count) = division3magnitudesIDX(i);
    count = count +  1;
end
indicesToRemove = sort(indicesToRemove',1,'descend')';
count = 1;
for i = 4:5:25
    division3testing(count,:) = division3(division3magnitudesIDX(i),1:156);
    count = count + 1;
end
for i = 1:5
    division3training(indicesToRemove(i), :) = [];
end
%%
%% Division 4
logicalIndexDivision4 = (CNTY_CENSUS.DIVISION == 4);
division4 = CNTY_COVID(logicalIndexDivision4, :);
division4magnitudes = zeros(25,1); division4testing = zeros(5,156);
division4training= division4;
for i =1:25
    division4magnitudes(i) = dot(ones(1,156),division4(i,:));
end
[division4magnitudesSORTED, division4magnitudesIDX] = sortrows(division4magnitudes, 'descend');
count = 1;
for i = 4:5:25
    indicesToRemove(1,count) = division4magnitudesIDX(i);
    count = count +  1;
end
indicesToRemove = sort(indicesToRemove',1,'descend')';
count = 1;
for i = 4:5:25
    division4testing(count,:) = division4(division4magnitudesIDX(i),1:156);
    count = count + 1;
end
for i = 1:5
    division4training(indicesToRemove(i), :) = [];
end

%% Division 5
logicalIndexDivision5 = (CNTY_CENSUS.DIVISION == 5);
division5 = CNTY_COVID(logicalIndexDivision5, :);
division5magnitudes = zeros(25,1); division5testing = zeros(5,156);
division5training= division5;
for i =1:25
    division5magnitudes(i) = dot(ones(1,156),division5(i,:));
end
[division5magnitudesSORTED, division5magnitudesIDX] = sortrows(division5magnitudes, 'descend');
count = 1;
for i = 4:5:25
    indicesToRemove(1,count) = division5magnitudesIDX(i);
    count = count +  1;
end
indicesToRemove = sort(indicesToRemove',1,'descend')';
count = 1;
for i = 4:5:25
    division5testing(count,:) = division5(division5magnitudesIDX(i),1:156);
    count = count + 1;
end
for i = 1:5
    division5training(indicesToRemove(i), :) = [];
end

%% Division 6
logicalIndexDivision6 = (CNTY_CENSUS.DIVISION == 6);
division6 = CNTY_COVID(logicalIndexDivision6, :);
division6magnitudes = zeros(25,1); division6testing = zeros(5,156);
division6training= division6;
for i =1:25
    division6magnitudes(i) = dot(ones(1,156),division6(i,:));
end
[division6magnitudesSORTED, division6magnitudesIDX] = sortrows(division6magnitudes, 'descend');
count = 1;
for i = 4:5:25
    indicesToRemove(1,count) = division6magnitudesIDX(i);
    count = count +  1;
end
indicesToRemove = sort(indicesToRemove',1,'descend')';
count = 1;
for i = 4:5:25
    division6testing(count,:) = division6(division6magnitudesIDX(i),1:156);
    count = count + 1;
end
for i = 1:5
    division6training(indicesToRemove(i), :) = [];
end

%% Division 7
logicalIndexDivision7 = (CNTY_CENSUS.DIVISION == 7);
division7 = CNTY_COVID(logicalIndexDivision7, :);
division7magnitudes = zeros(25,1); division7testing = zeros(5,156);
division7training= division7;
for i =1:25
    division7magnitudes(i) = dot(ones(1,156),division7(i,:));
end
[division7magnitudesSORTED, division7magnitudesIDX] = sortrows(division7magnitudes, 'descend');
count = 1;
for i = 4:5:25
    indicesToRemove(1,count) = division7magnitudesIDX(i);
    count = count +  1;
end
indicesToRemove = sort(indicesToRemove',1,'descend')';
count = 1;
for i = 4:5:25
    division7testing(count,:) = division7(division7magnitudesIDX(i),1:156);
    count = count + 1;
end
for i = 1:5
    division7training(indicesToRemove(i), :) = [];
end

%% Division 8
logicalIndexDivision8 = (CNTY_CENSUS.DIVISION == 8);
division8 = CNTY_COVID(logicalIndexDivision8, :);
division8magnitudes = zeros(25,1); division8testing = zeros(5,156);
division8training= division8;
for i =1:25
    division8magnitudes(i) = dot(ones(1,156),division8(i,:));
end
[division8magnitudesSORTED, division8magnitudesIDX] = sortrows(division8magnitudes, 'descend');
count = 1;
for i = 4:5:25
    indicesToRemove(1,count) = division8magnitudesIDX(i);
    count = count +  1;
end
indicesToRemove = sort(indicesToRemove',1,'descend')';
count = 1;
for i = 4:5:25
    division8testing(count,:) = division8(division8magnitudesIDX(i),1:156);
    count = count + 1;
end
for i = 1:5
    division8training(indicesToRemove(i), :) = [];
end

%% Division 9
logicalIndexDivision9 = (CNTY_CENSUS.DIVISION == 9);
division9 = CNTY_COVID(logicalIndexDivision9, :);
division9magnitudes = zeros(25,1); division9testing = zeros(5,156);
division9training= division9;
for i =1:25
    division9magnitudes(i) = dot(ones(1,156),division9(i,:));
end
[division9magnitudesSORTED, division9magnitudesIDX] = sortrows(division9magnitudes, 'descend');
count = 1;
for i = 4:5:25
    indicesToRemove(1,count) = division9magnitudesIDX(i);
    count = count +  1;
end
indicesToRemove = sort(indicesToRemove',1,'descend')';
count = 1;
for i = 4:5:25
    division9testing(count,:) = division9(division9magnitudesIDX(i),1:156);
    count = count + 1;
end
for i = 1:5
    division9training(indicesToRemove(i), :) = [];
end

%% Run kmeans on training set to compute starting centroids
rng(10,'v4');
% Concatenating the testing sets of each division to get the final testing
% set. 
testing = cat(1, division1testing, division2testing,division3testing,division4testing,division5testing,division6testing,division7testing,division8testing,division9testing);
% Concatenating the training sets of each division to get the final
% training set. 
training = cat(1,division1training,division2training,division3training,division4training,division5training,division6training,division7training,division8training,division9training);

[trainingIDX, centroids] = kmeans(training,9,'replicates',50,'distance','sqeuclidean','start','plus');
figure; hold on;
for i = 1:9
   plot(centroids(i, :));   
end
title("9 Centroids - Generated from Training Set");
hold off;

divisionsxcentroids = zeros(9,9);
count = 0;
for i = 1:9
    for j = 1:20
        index = trainingIDX(20*count + j,1);
        divisionsxcentroids(i,index) = divisionsxcentroids(i,index) + 1;
    end
    count = count + 1;
end

%%Region Assignment
%At this point, starting centroids have been generated, so now we can test
%assigning them to a region
regions = ['New England','Middle Atlantic','East North Central','West North Central'...
    'South Atlantic','East South Central','West South Central','Mountain','Pacific']; %create vector storing the names of the different regions

figure
[silhouettes,h] = silhouette(training,trainingIDX,"sqEuclidean",'start','plus');
xlabel("Silhouette Value");
ylabel("Cluster");
title("Kmeans Silhouette Plot");
silhouetteAVG = mean(silhouettes);
fprintf('average silhouette value: %.5f\n', silhouetteAVG); %formatted print of average silhouette value, rounded to 4 decimal places
%this is our first run of kmeans, so expecting a great silhouette value is
%not totally reasonable here in this early iteration. There's obviously
%lots of room for improvement with an average value around 0.253, so we
%will need to refine our kmeans centroid generation a lot to get quality
%centroids in the coming couple of days...