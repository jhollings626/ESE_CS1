% Loading necessary data
load("COVIDbyCounty.mat"); 
load("training.mat"); 
load("testing.mat"); 

run('diffValuesofK.m');

%Create division vector
divisions = ["New England","Middle Atlantic","East North Central","West North Central",...
    "South Atlantic","East South Central","West South Central","Mountain",...
    "Pacific"];  


% Gets ten nearest neighbors in CNTY_COVID for each centroid. 10 nearest
% neighbors for the ith centroid are stored in the ith row of tenNeighbors.
distances = zeros(225, 2);
tenNeighbors = zeros(12, 10);
for k = 1:12
    for i = 1:225
        distances(i, 1) = sqrt(norm(centroids(k, :) - CNTY_COVID(i, :)));
        distances(i,2) = i;
    end

    distances = sortrows(distances, 'ascend');
    for j = 1:10
        closestCountyIDX = distances(j,2);
        tenNeighbors(k, j) = CNTY_CENSUS.DIVISION(closestCountyIDX);
    end
end

% Plot for 10 neighest neighbors for each centroid
figure;
 
t = tiledlayout(2, 2);
nexttile();
histogram(tenNeighbors(1, :));
title("Centroid 1 Nearest Neighbors' division");
xlabel("Number of neighbors");
ylabel("Division Number");
f = gca;
f.FontSize = f.FontSize*1.2;

nexttile();
histogram(tenNeighbors(2, :));
title("Centroid 2 Nearest Neighbors' division");
xlabel("Number of neighbors");
ylabel("Division Number");
f = gca;
f.FontSize = f.FontSize*1.2;

nexttile();
histogram(tenNeighbors(3, :));
title("Centroid 3 Nearest Neighbors' division");
xlabel("Number of neighbors");
ylabel("Division Number");
f = gca;
f.FontSize = f.FontSize*1.2;

nexttile();
histogram(tenNeighbors(4, :));
title("Centroid 4 Nearest Neighbors' division");
xlabel("Number of neighbors");
ylabel("Division Number");
f = gca;
f.FontSize = f.FontSize*1.2;



exportgraphics(t, 'Centroids1-4.TIFF');

figure;
t = tiledlayout(2, 2);
nexttile();
histogram(tenNeighbors(5, :));
title("Centroid 5 Nearest Neighbors' division");
xlabel("Number of neighbors");
ylabel("Division Number");
f = gca;
f.FontSize = f.FontSize*1.2;

nexttile();
histogram(tenNeighbors(6, :));
title("Centroid 6 Nearest Neighbors' division");
xlabel("Number of neighbors");
ylabel("Division Number");
f = gca;
f.FontSize = f.FontSize*1.2;

nexttile();
histogram(tenNeighbors(7, :));
title("Centroid 7 Nearest Neighbors' division");
xlabel("Number of neighbors");
ylabel("Division Number");
f = gca;
f.FontSize = f.FontSize*1.2;

nexttile();
histogram(tenNeighbors(8, :));
title("Centroid 8 Nearest Neighbors' division");
xlabel("Number of neighbors");
ylabel("Division Number");
f = gca;
f.FontSize = f.FontSize*1.2;


exportgraphics(t, 'Centroids5-8.TIFF');

figure;
t = tiledlayout(2, 2);
nexttile();
histogram(tenNeighbors(9, :));
title("Centroid 9 Nearest Neighbors' division");
xlabel("Number of neighbors");
ylabel("Division Number");
f = gca;
f.FontSize = f.FontSize*1.2;

nexttile();
histogram(tenNeighbors(10, :));
title("Centroid 10 Nearest Neighbors' division");
xlabel("Number of neighbors");
ylabel("Division Number");
f = gca;
f.FontSize = f.FontSize*1.2;

nexttile();
histogram(tenNeighbors(11, :));
title("Centroid 11 Nearest Neighbors' division");
xlabel("Number of neighbors");
ylabel("Division Number");
f = gca;
f.FontSize = f.FontSize*1.2;

nexttile();
histogram(tenNeighbors(12, :));
title("Centroid 12 Nearest Neighbors' division");
xlabel("Number of neighbors");
ylabel("Division Number");
f = gca;
f.FontSize = f.FontSize*1.2;


exportgraphics(t, 'Centroids9-12.TIFF');


% Assigning division number classifications to each centroid
classifications = [1; 1; 2; 3; 3; 4; 5; 6; 7; 7; 8; 9];

correct = 0;
incorrect = 0;
%%
% Assigns each data entry in the testing set to a centroid, checks if
% assigned classification is equal to true classification. 
for i = 1:45
    testDistances = zeros(12, 2);
    assignment = zeros(1,2);
    for j = 1:12
        testDistances(j, 1) = sqrt(norm(centroids(j, :)-testing(i, :)));
        testDistances(j,2) = j;
    end
    testDistances = sortrows(testDistances, 'ascend');
    % First column stores the closest neighbor calculation for the county
    assignment(1,1) = testDistances(1,1); 
    % Second column stores the division number of the centroid
    assignment(1,2) = classifications(testDistances(1,2)); 
    testingValue = testing(i,1);
    CNTY_COVID20 = CNTY_COVID(:,1)';
    testValueIDX = find(CNTY_COVID20 == testingValue);
    testValDivision = CNTY_CENSUS.DIVISION(testValueIDX);
    if assignment(1,2) == testValDivision
        correct = correct + 1;
    else
        incorrect = incorrect + 1;
    end
end

percentCorrect = (correct/(incorrect + correct)) * 100;
percentCorrect = round(percentCorrect,2,'decimals');
%disp(percentCorrect);
fprintf('Percent Correct: %.2f%%\n', percentCorrect);

centroid_labels = classifications;
save competition.mat centroids centroid_labels;

