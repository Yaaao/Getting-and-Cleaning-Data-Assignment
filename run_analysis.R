getwd()
setwd("/Users/yaodi/Documents/CouseraLearning/DataScience /DS_Course3/UCI HAR Dataset")
#Part 1 & 2: 
#Merges the training and the test sets to create one data set 
#Extracts only the measurements on the mean and standard deviation for
#each measurement 
install.packages("data.table")
library(data.table)

readData = function(fileName, folderName) {
    path = file.path(folderName, paste("y_", fileName, ".txt", sep = ""))
    y_data = read.table(path, col.names = "ActivityID")
    #View(y_data)
    
    path = file.path(folderName, paste("subject_", fileName, ".txt", sep = ""))
    subject_data = read.table(path, col.names = "SubjectID")
    #View(subject_data)
    
    data_columns = read.table("features.txt", col.names = c("MeasureID", "MeasureName"))
    #View(data_columns)
    
    path = file.path(folderName, paste("x_", fileName, ".txt", sep = ""))
    dataset = read.table(path, col.names = data_columns$MeasureName)
    #View(dataset)
    
    subset_data_columns = grep(".*mean\\(\\)|.*std\\(\\)", data_columns$MeasureName)
    class(subset_data_columns)
    #View(subset_data_columns)
    
    dataset = dataset[, subset_data_columns]
    #View(dataset)
    
    dataset$ActivityID = y_data$ActivityID
    dataset$SubjectID = subject_data$SubjectID
    
    dataset
}

#Read data from local train and test folders respectively
trainData = readData("train","train")
testData = readData("test", "test")

#Merge these two datasets and assign proper names to the columns
mergeData = rbind(testData,trainData)
#View(mergeData)
columnNames = colnames(mergeData)
columnNames = gsub("\\.+mean\\.+",columnNames,replacement = "Mean")
columnNames = gsub("\\.+std\\.+",columnNames,replacement = "SD")
colnames(mergeData) = columnNames
#View(mergeData)

#Part 3 & 4: 
#Uses descriptive activity names to name the activities in the dataset
#Appropriately labels the data set with descriptive variable names
activity_labels = read.table("activity_labels.txt",col.names = c("ActivityID","ActivityName"))
View(activity_labels)
activity_labels$ActivityName = as.factor(activity_labels$ActivityName)
data_labels = merge(mergeData,activity_labels)
#View(data_labels)
