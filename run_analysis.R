# Load necessary library
library(dplyr)

# STEP 0: Download and unzip the data
filename <- "getdata_projectfiles_UCI_HAR_Dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# STEP 1: Read and Merge Data
# Read metadata
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Read Test and Train data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Merge them
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Sub <- rbind(subject_train, subject_test)
Combined_Data <- cbind(Sub, Y, X)

# STEP 2: Extract mean and std
TidyData <- Combined_Data %>% select(subject, code, contains("mean"), contains("std"))

# STEP 3: Use descriptive activity names
TidyData$code <- activities[TidyData$code, 2]

# STEP 4: Label with descriptive names
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))

# STEP 5: Create secondary tidy data set
FinalData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean = mean))

# STEP 6: Save the file
write.table(FinalData, "FinalData.txt", row.name=FALSE)