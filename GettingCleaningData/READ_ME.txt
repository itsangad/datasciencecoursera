==================================================================
title: "READ_ME"
author: "Angad Ahuja"
date: "9/28/2020"
This contains files information and code explanation for
Getting and Cleaning Data Course Project
==================================================================
* File Information

 - CodeBook.md. describes the input data sets, variables, and observation counts

 - run_analysis.R contains all the coding for doing the course project, that includes downloading and unzipping the dataset that is used for this project.

 - tidy_data_set.txt is a written out text file from run_analysis.R, which is the average (mean) features of per Subject and Activity.

* Code Explanation

Step 1: Merges the training and the test sets to create one data set.
	a) Download the file using download.file()
	b) This is a zip file then we
	c) Extract the zip file in "UCI HAR Dataset" folder
	d) Load the individual files into R using read.table()
	e) All 6 files are loaded (X_train.txt, y_train.txt, X_test.txt, y_test.txt, subject_test.txt and subject_train.txt)
 	f) Features, Activities and Subject data are combined row-wise using rbind()
  
Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
 	a) Load the features.text file using rea.table()
	b) Filter the features to limit to mean and std using grep()
	c) Merge all data column-vise using cbind
	d) Filter the resp. features from the data_merge (merged data set)
  
Step 3: Uses descriptive activity names to name the activities in the data set
	a) Load all the activities using read.table
	b) Set column names of merged data based of activity names

Step 4: Appropriately labels the data set with descriptive variable names.
	a) Cleanup the names for the Mean and std columns
	b) Using gsub() replace variable name with descriptive variable names
	c) Example: tBodyAcc-mean()-Y to TimeBodyAccelerationMean-Y
Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  	a) Keep Subject_ID and Activity and melt rest of the data using reshape2 library
	b) Cast it back to find mean of each variables for unique combination of Subject and Activity

Step 6: Tidy data set
	a) Create the data set to be submitted using write.table()
