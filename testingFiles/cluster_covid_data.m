load("COVIDbyCounty.mat");
load("divisionalTrainingData.mat");

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
%% Creating final testing and training sets through concatention
% Concatenating the testing sets of each division to get the final testing
% set. 
testing = cat(1, division1testing, division2testing,division3testing,division4testing,division5testing,division6testing,division7testing,division8testing,division9testing);
% Concatenating the training sets of each division to get the final
% training set. 
training = cat(1,division1training,division2training,division3training,division4training,division5training,division6training,division7training,division8training,division9training);

%% Run kmeans on training set to compute starting centroids
rng(10,'v4');

% Number of replicates for call to kmeans
replicates = 20; 

% Set rng to v4 protocol with a seed of 2 - this yielded the highest average silhouette during testing
rng(1,"v4"); 

% Configure further options for kmeans call
options = statset('UseParallel',true,'MaxFunEvals',100,'DerivStep',100); 



% Selecting value of k for kmeans run on divisions 1-9

silhouetteValues = cat(3, zeros(9, 1), zeros(9, 1), zeros(9, 1), zeros(9, 1), zeros(9, 1), zeros(9, 1), zeros(9, 1), zeros(9, 1), zeros(9, 1));
k1Through9 = zeros(9, 1);
for i = 1:9
    for k = 2:10
        [idxTemp, centroidsTemp] = kmeans(training(20*(i-1) + 1:20*i,:), k, 'replicates',replicates,'distance','sqeuclidean','start','plus','options',options);
        silhouetteValues(k-1, 1, i) = mean(silhouette(training(20*(i-1) + 1:20*i,:), idxTemp)); 
    end
    k1Through9(i, 1) = find(silhouetteValues(:, :, i)==max(silhouetteValues(:, :, i)))+1;

end
valuesOfK = [2, 1, 2, 1, 1, 1, 2, 1, 1];


% Run kmeans on training data for each division, with k specified by the
% corresponding value in valuesOfK, to generate 12 starting centroids
centroids = zeros(12, 156);
numC = 1;
for i = 1:9
    [~, c] = kmeans(training(20*(i-1) + 1:20*i,:), valuesOfK(1, i),'replicates',replicates,'distance','sqeuclidean','start','plus','options',options);
    centroids(numC:numC+valuesOfK(1, i)-1, :) = c;
    numC = numC + valuesOfK(1, i);
end

% Run kmeans on training data with the set of centroids
[refinedIDX, ~] = kmeans(training,12,'distance','sqeuclidean','start',centroids,'options',options);
refinedSilhouettes = silhouette(training,refinedIDX);
bar(refinedSilhouettes)
avgRefinedSilhouette = mean(refinedSilhouettes);
fprintf('!average silhouette value: %.5f\n', avgRefinedSilhouette);


figure;

t = tiledlayout(3, 1);
nexttile();
bar(silhouetteValues(:, :, 1));
title("Average Silhouette Values for values of k, for division 1");
xlabel("k-1");
ylabel("Average Silhouette Value");

nexttile();
bar(silhouetteValues(:, :, 2));
title("Average Silhouette Values for values of k, for division 2");
xlabel("k-1");
ylabel("Average Silhouette Value");

nexttile();
bar(silhouetteValues(:, :, 3));
title("Average Silhouette Values for values of k, for division 3");
xlabel("k-1");
ylabel("Average Silhouette Value");

exportgraphics(t, 'AvgSilhouetteValues for Divisions1-3.TIFF');

figure;

t = tiledlayout(3, 1);
nexttile();
bar(silhouetteValues(:, :, 4));
title("Average Silhouette Values for values of k, for division 4");
xlabel("k-1");
ylabel("Average Silhouette Value");

nexttile();
bar(silhouetteValues(:, :, 5));
title("Average Silhouette Values for values of k, for division 5");
xlabel("k-1");
ylabel("Average Silhouette Value");

nexttile();
bar(silhouetteValues(:, :, 6));
title("Average Silhouette Values for values of k, for division 6");
xlabel("k-1");
ylabel("Average Silhouette Value");

exportgraphics(t, 'AvgSilhouetteValues for Divisions4-6.TIFF');

figure;
t = tiledlayout(3, 1);
nexttile();
bar(silhouetteValues(:, :, 7));
title("Average Silhouette Values for values of k, for division 7");
xlabel("k-1");
ylabel("Average Silhouette Value");

nexttile();
bar(silhouetteValues(:, :, 8));
title("Average Silhouette Values for values of k, for division 8");
xlabel("k-1");
ylabel("Average Silhouette Value");

nexttile();
bar(silhouetteValues(:, :, 9));
title("Average Silhouette Values for values of k, for division 9");
xlabel("k-1");
ylabel("Average Silhouette Value");

exportgraphics(t, 'AvgSilhouetteValues for Divisions7-9.TIFF');


