load("COVIDbyCounty.mat");
load("ogData.mat"); %load the data yielded by casestudy1test.m - to declutter iterative files
%this file will be used to build average centroids and complete a call to
%kmeans using these 9 average centroids as starting points for kmeans
%using cs1test2.m as a template for the code here...

rng(2,"v4"); %set rng to v4 protocol with a seed of 2 - this yielded the highest average silhouette during testing
options = statset('UseParallel',true,'MaxFunEvals',100,'DerivStep',100); %configure furhter options for kmeans call

