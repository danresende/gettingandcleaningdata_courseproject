# install (if needed) and load dplyr package.
if(!("dplyr" %in% installed.packages())){
  install.packages("dplyr")
}
library(dplyr)

# load the data.
xtest.path <- "./UCI HAR Dataset/test/X_test.txt"
ytest.path <- "./UCI HAR Dataset/test/y_test.txt"
subj.test.path <- "./UCI HAR Dataset/test/subject_test.txt"
xtrain.path <- "./UCI HAR Dataset/train/X_train.txt"
ytrain.path <- "./UCI HAR Dataset/train/y_train.txt"
subj.train.path <- "./UCI HAR Dataset/train/subject_train.txt"
features.path <- "./UCI HAR Dataset/features.txt"
activity.path <- "./UCI HAR Dataset/activity_labels.txt"

features <- read.table(features.path)
activity <- read.table(activity.path)
x.test <- read.table(xtest.path, col.names = features$V2)
y.test <- read.table(ytest.path, col.names = "Activity")
subj.test <- read.table(subj.test.path, col.names = "Subject")
x.train <- read.table(xtrain.path, col.names = features$V2)
y.train <- read.table(ytrain.path, col.names = "Activity")
subj.train <- read.table(subj.train.path, col.names = "Subject")

# 1. Merges the training and the test sets to create one data set.
test <- cbind(subj.test, y.test, x.test)
train <- cbind(subj.train, y.train, x.train)
data <- rbind(test, train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
mean.measures <- grep("mean", features$V2, ignore.case = TRUE)
std.measures <- grep("std", features$V2, ignore.case = TRUE)
cols.we.want <- sort(c(mean.measures, std.measures))
data1 <- select(data, -Subject, -Activity) %>% select(cols.we.want)
data <- cbind(data[, 1:2], data1)

# 3. Uses descriptive activity names to name the activities in the data set
data$Activity <- factor(data$Activity) 
levels(data$Activity) <- activity$V2

# 4. Appropriately labels the data set with descriptive variable names.
colnames(data) <- tolower(colnames(data))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy.data <- group_by(data, activity, subject) %>% summarise_each(funs(mean))

write.table(tidy.data, file = "./UCI HAR Dataset/tidy_data.txt", row.names = FALSE)

# cleans the working space
rm(features,
   activity,
   x.test,
   y.test,
   subj.test,
   x.train,
   y.train,
   subj.train,
   test,
   train,
   xtest.path,
   ytest.path,
   subj.test.path,
   xtrain.path,
   ytrain.path,
   subj.train.path,
   features.path,
   activity.path,
   mean.measures,
   std.measures,
   cols.we.want,
   data1,
   data)