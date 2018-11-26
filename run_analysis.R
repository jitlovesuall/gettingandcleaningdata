library(dplyr)

# Read all training data
setwd("./UCI HAR Dataset/train")
subject_train<- fread("subject_train.txt")
X_train<- fread("X_train.txt")
y_train<- fread("y_train.txt")

# Read features and activity labels
setwd('..')
features <- fread("features.txt")
activity_labels <- fread("activity_labels.txt")
colnames(activity_labels) <- c("Activity", "ActivityName")

# Rad all test data
setwd("./test")
subject_test<- fread("subject_test.txt")
X_test<- fread("X_test.txt")
y_test<- fread("y_test.txt")

#Step 1: merging the train and test datasets and assigning column names
mergedDT <- rbind(cbind(subject_train, X_train, y_train), cbind(subject_test, X_test, y_test))
colnames(mergedDT) <- c("Subject", features$V2, "Activity")

#Step 2: Keep only mean and std columns
onlyMeanStdCols <- grepl("Subject|mean|std|Activity", colnames(mergedDT))
mergedDT <- mergedDT[, ..onlyMeanStdCols]

#Step 3: Assigning proper activity names to the merged data table
mergedDT <- merge(mergedDT, activity_labels, by="Activity")
mergedDT[, Activity:= NULL]

#Step 4: Renaming the merged datatable with appropriate column descriptions
colDesc <- names(mergedDT)
colDesc <- gsub("-", "", colDesc)
colDesc <- gsub("\\(\\)", "", colDesc)
colDesc <- gsub("^f", "frequencyDomain", colDesc)
colDesc <- gsub("^t", "timeDomain", colDesc)
colDesc <- gsub("Acc", "Accelerometer", colDesc)
colDesc <- gsub("Gyro", "Gyroscope", colDesc)
colDesc <- gsub("Mag", "Magnitude", colDesc)
colDesc <- gsub("Freq", "Frequency", colDesc)
colDesc <- gsub("mean", "Mean", colDesc)
colDesc <- gsub("std", "StandardDeviation", colDesc)

colDesc <- gsub("BodyBody", "Body", colDesc)

colnames(mergedDT) <- colDesc

#Step 5: Creating 2nd data table with avg of each variable grouped by subject and activity
secondDT <- mergedDT %>% group_by(Subject, ActivityName) %>% summarise_all(funs(mean))

#Output to txt file
write.table(secondDT, "tidy_data.txt", row.names = FALSE)