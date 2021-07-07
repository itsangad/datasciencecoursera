## Merges the training and the test sets to create one data set.
  # Download the resp. data sets
  # Merge the two data sets

  # link to the data set URL
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  # Download the file using download.file()
  # This will get downloaded into the working directory by the name Coursera_DS3_Project.zip
  zippedfile <- "UCI HAR Dataset.zip"
  downloadfile <- download.file(fileURL, destfile = zippedfile, method = "curl")
  
  # Extract the zip file
  extractFolder <- "UCI HAR Dataset"
  if (!file.exists(extractFolder)) {
    unzip(zipfile = zippedfile)
  }
  
  # Set working directory as extracted folder
  setwd(paste(sep = "", "./",extractFolder))
  
  # load the extracted data sets
  # Train data sets
  X_train <- read.table("train/X_train.txt",header = FALSE)
  Y_train <- read.table("train/y_train.txt",header = FALSE)
  
  # Test data sets
  X_test <- read.table("test/X_test.txt",header = FALSE)
  Y_test <- read.table("test/y_test.txt",header = FALSE)
  
  # Subject data sets
  test_subject <- read.table("test/subject_test.txt",header = FALSE)
  train_subject <- read.table("train/subject_train.txt",header = FALSE)
  
  # Merge Train and Test data sets resp. for X, Y and Subject using rbind (rows UNION ALL)
  
  data_Features <- rbind(X_train, X_test)
  data_Activity <- rbind(Y_train,Y_test)
  data_Subject <-  rbind(train_subject, test_subject)
  
  #Initial rename V1 columnname
  names(data_Activity) <- "Activity_ID"
  names(data_Subject) <- "Subject_ID"
  
  
## Extracts only the measurements on the mean and standard deviation for each measurement.
  
  # Load all the features
  # First columns is ID and Second column has the string like xxxx-mean()-X/Y
  features_data <- read.table("features.txt",header = FALSE)
  
  # Rename the data_Features columns with the Second column (labels) of features_data
  names(data_Features) <- features_data$V2
  
  # Filter the features to limit to mean and std
  # This means to filter column 2 for mean( and std( using escape character "(" in grep
  filterindex <- grep("mean\\(|std\\(",features_data[,2])
  features_filter <- features_data[filterindex,2]
 
  # Merge all data column-vise using cbind (columns  JOINS)
  data_merge <- cbind(data_Subject, data_Activity, data_Features)
  
  # Filter the resp. features from the data_merge (merged data set)
  data_merge <- data_merge[, c("Subject_ID","Activity_ID",features_filter)]

  
## Uses descriptive activity names to name the activities in the data set
  
  # Load all the activities
  activities_data <- read.table("activity_labels.txt",header = FALSE)
  # Set Column Names
  names(activities_data) <- c("Activity_ID","Activity")

  # Rename the data_merge column 2 (Activity_ID) by mapping it with activities_data
  data_merge[,2] <- activities_data[data_merge[,2],2]
  names(data_merge)[2] <- "Activity"

## Appropriately labels the data set with descriptive variable names.
  
  # Cleanup the names for the Mean and std columns
  # Example: tBodyAcc-mean()-Y to TimeBodyAccelerationMean-Y
  names(data_merge) <- gsub("^t", "Time", names(data_merge))
  names(data_merge) <- gsub("^f", "Frequency", names(data_merge))
  names(data_merge) <- gsub("Acc", "Acceleration", names(data_merge))
  names(data_merge) <- gsub("Mag", "Magnitude", names(data_merge))
  names(data_merge) <- gsub("Gyro", "Gyroscope", names(data_merge))
  names(data_merge) <- gsub("BodyBody", "Body", names(data_merge))
  names(data_merge) <- gsub("\\()", "", names(data_merge))
  names(data_merge) <- gsub("-mean", "Mean", names(data_merge))
  names(data_merge) <- gsub("-std", "StdDev", names(data_merge))
  

## From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
  
  # Keep Subject_ID and Activity and melt rest of the data
  # load the library
  library(reshape2)
  
  # Melt the data
  data_melted <- melt(data_merge, id.vars = c("Subject_ID","Activity"))
  
  # Cast it back to find mean of each variables for unique combination of Subject and Activity
  data_final <- dcast(data_melted, Subject_ID + Activity ~ variable, mean)
  
  # Data set to be submitted created in the working directory
  write.table(data_final, file = "tidy_data_set.txt",row.names = FALSE, quote = FALSE)
