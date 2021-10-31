library(dplyr)
filename <- "GCData_Final_Proj.zip"
# Check if archive already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}features <- read.table("UCI HAR Dataset/features.txt",col.names = c("feature_id", "Feature_name"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt",col.names = c("activity_id", "Activity_type"))
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt",col.names = "subject_id")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt",col.names = "subject_id")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt",col.names = features$Feature_name)
X_train <- read.table("UCI HAR Dataset/train/X_train.txt",col.names = features$Feature_name)
Y_test <-read.table("UCI HAR Dataset/test/y_test.txt",col.names = "activity_id")
Y_train <-read.table("UCI HAR Dataset/train/y_train.txt",col.names = "activity_id")

# Merge train and test data
X_comb <- rbind(X_train, X_test)
Y_comb <- rbind(Y_train, Y_test)
subject_comb <- rbind(subject_train, subject_test)
train_test_merged <- cbind(subject_comb, Y_comb, X_comb)

# Choose only mean and Standard deviation
tidy_data <- train_test_merged %>% select(subject_id, activity_id, contains("mean"), contains("std"))
# glimpse(tidy_data)

 # descriptive activity names
tidy_data$activity_id <- activities[tidy_data$activity_id, 2]

# Descriptive label names for the dataset
names(tidy_data)[2] = "Activity_type"
names(tidy_data)<-gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data)<-gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data)<-gsub("BodyBody", "Body", names(tidy_data))
names(tidy_data)<-gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data)<-gsub("^t", "Time", names(tidy_data))
names(tidy_data)<-gsub("^f", "Frequency", names(tidy_data))
names(tidy_data)<-gsub("tBody", "TimeBody", names(tidy_data))
names(tidy_data)<-gsub("-mean()", "Mean", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("-std()", "STD", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("-freq()", "Frequency", names(tidy_data), ignore.case = TRUE)
names(tidy_data)<-gsub("angle", "Angle", names(tidy_data))
names(tidy_data)<-gsub("gravity", "Gravity", names(tidy_data))

# clean dataset with average of each variable by activity type and subject

Final_Data_1 <- tidy_data %>%
  group_by(subject_id, Activity_type) %>%
  summarise_all(funs(mean))
write.table(Final_Data_1, "FinalData.txt", row.names =FALSE)

