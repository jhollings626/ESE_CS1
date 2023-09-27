load("COVIDbyCounty.mat");



[idx, C] = kmeans(CNTY_COVID, 9);

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






logicalIndexDivision2 = (CNTY_CENSUS.DIVISION == 2);
division2 = CNTY_COVID(logicalIndexDivision2, :);
division2magnitudes = zeros(25,1); division2testing = zeros(5,156);
division2training= division2;
for i =1:25
    division2magnitudes(i) = dot(ones(1,156),division2(i,:));
end
[division2magnitudesSORTED, division2magnitudesIDX] = sortrows(division2magnitudes, 'descend');
count = 1;
for i = 4:5:24
    division2testing(count,:) = division2(division2magnitudesIDX(i),1:156);
    division2training(division2magnitudesIDX(i), :) = [];
    count = count + 1;
end


logicalIndexDivision3 = (CNTY_CENSUS.DIVISION == 3);
division3 = CNTY_COVID(logicalIndexDivision3, :);
division3magnitudes = zeros(25,1); division3testing = zeros(5,156);
division3training= division3;
for i =1:25
    division3magnitudes(i) = dot(ones(1,156),division3(i,:));
end
[division3magnitudesSORTED, division3magnitudesIDX] = sortrows(division3magnitudes, 'descend');
count = 1;
for i = 4:5:24
    division3testing(count,:) = division3(division3magnitudesIDX(i),1:156);
    division3training(division3magnitudesIDX(i), :) = [];
    count = count + 1;
end

logicalIndexDivision4 = (CNTY_CENSUS.DIVISION == 4);
division4 = CNTY_COVID(logicalIndexDivision4, :);
division4magnitudes = zeros(25,1); division4testing = zeros(5,156);
division4training= division4;
for i =1:25
    division4magnitudes(i) = dot(ones(1,156),division4(i,:));
end
[division4magnitudesSORTED, division4magnitudesIDX] = sortrows(division4magnitudes, 'descend');
count = 1;
for i = 4:5:24
    division4testing(count,:) = division4(division4magnitudesIDX(i),1:156);
    division4training(division4magnitudesIDX(i), :) = [];
    count = count + 1;
end

logicalIndexDivision5 = (CNTY_CENSUS.DIVISION == 5);
division5 = CNTY_COVID(logicalIndexDivision5, :);
division5magnitudes = zeros(25,1); division5testing = zeros(5,156);
division5training= division5;
for i =1:25
    division5magnitudes(i) = dot(ones(1,156),division5(i,:));
end
[division5magnitudesSORTED, division5magnitudesIDX] = sortrows(division5magnitudes, 'descend');
count = 1;
for i = 4:5:24
    division5testing(count,:) = division5(division5magnitudesIDX(i),1:156);
    division5training(division5magnitudesIDX(i), :) = [];
    count = count + 1;
end

logicalIndexDivision6 = (CNTY_CENSUS.DIVISION == 6);
division6 = CNTY_COVID(logicalIndexDivision6, :);

logicalIndexDivision7 = (CNTY_CENSUS.DIVISION == 7);
division7 = CNTY_COVID(logicalIndexDivision7, :);

logicalIndexDivision8 = (CNTY_CENSUS.DIVISION == 8);
division8 = CNTY_COVID(logicalIndexDivision8, :);

logicalIndexDivision9 = (CNTY_CENSUS.DIVISION == 9);
division9 = CNTY_COVID(logicalIndexDivision9, :);



    


