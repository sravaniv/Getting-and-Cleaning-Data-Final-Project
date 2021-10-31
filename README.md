Getting and Cleaning Data Course Final Project 

This repo includes all the files for analyzing the Human Activity Recognition Dataset. run

Description of the Dataset

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
 
Files
 
run_analysis.R includes the script to download the data, perform the data processing and analysis to accomplish the following goals of the project:
 * Merge the training and the test sets to create one data set.
 * Extract only the measurements on the mean and standard deviation for each     measurement. 
 * Use descriptive activity names to name the activities in the data set
 * Appropriately label the data set with descriptive variable names. 
 * From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
 
FinalData.txt is the independent tidy data set obtained after going through all the goals defined above. 

CodeBook.pdf includes a code book to describe the data processing steps. 
 