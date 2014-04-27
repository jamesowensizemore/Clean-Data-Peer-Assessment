
## Reads the activity label from the appropriate file
label<-read.table("activity_labels.txt")
## Coerces the labels to character variables
label[,2]<-as.character(label[,2])


## Reads in the activity label numbers from the test subjects
testlabels<-read.table(".\\test\\y_test.txt")
## Replaces the numbers in the test subject labels with the appropriate descriptive name for the activity
   for(i in 1:2947){
        testlabels[i, 1]<-label[testlabels[i, 1], 2]
   }
   
## Reads into R the table for the "test" values"
testdata<-read.table(".\\test\\X_test.txt")


## Reads in the activity label numbers from the train subjects
trainlabels<-read.table(".\\train\\y_train.txt")

    i<-NULL
## Replaces the numbers in the train subject labels with the appropriate descriptive name for the activity
    for(i in 1:2947){
    trainlabels[i, 1]<-label[trainlabels[i, 1], 2]
}
## Reads into R the table for the "train values"
traindata<-read.table(".\\train\\X_train.txt")

## Combine the above two dataframes into a single dataframe by putting "testdata" on top and "traindata" on bottom
totaldata<-rbind(testdata, traindata)
## Combine the labels for the above two dataframes into a single "labeling" dataframe by putting "testdata" on top and "traindata" on bottom
TotalLabels<-rbind(testlabels, trainlabels)




## Creates a numeric vector that is the desired columns I will want. I use any column that features a mean or std of other measurements 
##  (ie anything of the form ...mean() or ...stf())
ColList<-c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266:271, 345:350, 424:429,
           503, 504, 516, 517, 529, 530, 542, 543)

## Creates a new dataframe with only the desired columns described above
datameans<-totaldata[, ColList]

## Creates a character vector with descriptive names for each of the columns
MeasNames<-c("Activity", "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", "tBodyAcc-std()-X", 
             "tBodyAcc-std()-Z", "tBodyAcc-std()-Z", "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", 
             "tGravityAcc-mean()-Z", "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z",
             "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", "tBodyAccJerk-std()-X",
             "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y",
             "tBodyGyro-mean()-Z", "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z", 
             "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", "tBodyGyroJerk-std()-X",
             "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", "tBodyAccMag-mean()", "tBodyAccMag-std()", 
             "tGravityAccMag-mean()", "tGravityAccMag-std()", "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()",
             "tBodyGyroMag-mean()", "tBodyGyroMag-std()", "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()",
             "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", "fBodyAcc-std()-X", "fBodyAcc-std()-Y",
             "fBodyAcc-std()-Z", "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", 
             "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z", "fBodyGyro-mean()-X", 
             "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z",
             "fBodyAccMag-mean()", "fBodyAccMag-std()", "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()",
             "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()", "fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()")


## Adds the descriptive activity labels to the first column of the dataframe
TotalData<-cbind(TotalLabels, datameans)
## Renames the columns of "datameans" to the descriptive names desired
colnames(TotalData)<-MeasNames

## Outputs the final version of the dataframe to a .txt (text) file
write.table(TotalData, "TotalData.txt", sep = " ")
