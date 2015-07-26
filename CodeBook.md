# Code Book
## About the script
The script does the steps described below:
 1. Install (if needed) and loads the dplyr package.
 2. Loads the raw data into R.
 3. Merges the data to create one dataset.
 4. Extracts only the measurements on the mean and standard deviation for each measurement.
 5. Uses descriptive activity names to name the activities in the data set
 6. Appropriately labels the data set with descriptive variable names.
 7. Creates a tidy data set with the average of each variable for each activity and each subject and writes in a txt file.
 
## About the variables
All the variables comes from the database colected by the UCI researchers and come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
The tidy data extracts the mean and standard deviation estimated for the the following features:

 - tBodyAcc-XYZ
 - tGravityAcc-XYZ
 - tBodyAccJerk-XYZ
 - tBodyGyro-XYZ
 - tBodyGyroJerk-XYZ
 - tBodyAccMag
 - tGravityAccMag
 - tBodyAccJerkMag
 - tBodyGyroMag
 - tBodyGyroJerkMag
 - fBodyAcc-XYZ
 - fBodyAccJerk-XYZ
 - fBodyGyro-XYZ
 - fBodyAccMag
 - fBodyAccJerkMag
 - fBodyGyroMag
 - fBodyGyroJerkMag

Besides those features, additional vectors were obtained by averaging the signals in a signal window sample:

 - gravityMean
 - tBodyAccMean
 - tBodyAccJerkMean
 - tBodyGyroMean
 - tBodyGyroJerkMean