# Getting and cleaning data: Course project
## Introduction
This repository contains my work for the course project for the Coursera/Johns Hopkins course "Getting and Cleaning data", part of the Data Science specialization.
## About the raw data
The data was collected from the accelerometers from the Samsung Galaxy S smartphone for an experiment conducted by UCI in human activity. The data is separeted in two sets, test and train, with 561 unlabeled features plus the activities and the subjects informations.
## About the script
The script loads the raw data into R and merges all together. Then it labels properly and selects only the variables related to mean and standard deviation.
To work properly, the raw data should be extracted and unziped in a file called "UCI HAR Dataset" at the working directory.
The output is the tidy.data, the means for each activity and each subject, saved in a txt file called tidy_data.txt.
## About the Code Book.
The Code Book (codebook.md) explains the variables of the resulting data.