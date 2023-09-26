load("COVIDbyCounty.mat");



[idx, C] = kmeans(CNTY_COVID, 9);

logicalIndexDivision1 = (CNTY_CENSUS.DIVISION == 1);
division1 = CNTY_COVID(logicalIndexDivision1, :);

division1Testing = zeros(5, 156);
for i=1:5:21
    division1Testing() = division1Testing + division



logicalIndexDivision2 = (CNTY_CENSUS.DIVISION == 2);
division2 = CNTY_COVID(logicalIndexDivision2, :);

logicalIndexDivision3 = (CNTY_CENSUS.DIVISION == 3);
division3 = CNTY_COVID(logicalIndexDivision3, :);

logicalIndexDivision4 = (CNTY_CENSUS.DIVISION == 4);
division4 = CNTY_COVID(logicalIndexDivision4, :);

logicalIndexDivision5 = (CNTY_CENSUS.DIVISION == 5);
division5 = CNTY_COVID(logicalIndexDivision5, :);

logicalIndexDivision6 = (CNTY_CENSUS.DIVISION == 6);
division6 = CNTY_COVID(logicalIndexDivision6, :);

logicalIndexDivision7 = (CNTY_CENSUS.DIVISION == 7);
division7 = CNTY_COVID(logicalIndexDivision7, :);

logicalIndexDivision8 = (CNTY_CENSUS.DIVISION == 8);
division8 = CNTY_COVID(logicalIndexDivision8, :);

logicalIndexDivision9 = (CNTY_CENSUS.DIVISION == 9);
division9 = CNTY_COVID(logicalIndexDivision9, :);



    


