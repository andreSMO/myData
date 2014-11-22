#run_analysis script

##1-Read the files and build a basic data frame
###Function to read the local data files and to combine by columns into one data frame
###The function has three file names as input
###The output is a data frame where the data is combined by columns
getCombineCols <- function(file1,file2,file3){
  ###get the data in the files as data.frames assuming that all columns are numeric
  data1 <- read.table(file = file1,colClasses="numeric")
  data2 <- read.table(file = file2,colClasses="numeric")
  data3 <-read.table(file = file3,colClasses="numeric")
  #combine the three data frames by column 
  dataList <- list(data1,data2,data3)
  combData <- do.call(cbind, dataList)
  combData
}
###Read and combine the training data by columns
fSubject <- "UCI HAR Dataset/train/subject_train.txt"
fActivity <-"UCI HAR Dataset/train/y_train.txt"
fFeatures <-"UCI HAR Dataset/train/X_train.txt"
combTrain <- getCombineCols(fSubject,fActivity,fFeatures)
###Read and combine the test data by columns
fSubject <- "UCI HAR Dataset/test/subject_test.txt"
fActivity <-"UCI HAR Dataset/test/y_test.txt"
fFeatures <-"UCI HAR Dataset/test/X_test.txt"
combTest <- getCombineCols(fSubject,fActivity,fFeatures)
###Combine the training and test data by rows
if (!(dim(combTrain)[2] == dim(combTest)[2])){ stop("Error, Combine by row not possible because Train and test with diff number of cols")}
combTrainTest <- rbind(combTrain,combTest)
dim(combTrainTest)
###Check if there are missing data
if (all((colSums(is.na(combTrainTest))==0))){
  print(">>>>>>>>>>>>>>>>>>>>>>No missing data")
} else print("there is missing data")


##2- Define variable names and extract relevant variables into a subset data frame
###read the feature names, one line per component
fFeatNames <- "UCI HAR Dataset/features.txt"
featNames <- readLines(fFeatNames)
###Add variable names to the combined data frame
varNames <- c("subject","activity",featNames)
colnames(combTrainTest)<- varNames
### find the feature names with substrings mean or std but exclude MeanFreq
matchMeanStd <- "mean()|std()" #regex to match substrings "mean"or"std"
matchMeanFreq <- "meanFreq()"   
featMeanStd <- featNames[grepl(matchMeanStd,featNames) & !grepl(matchMeanFreq,featNames)]
featMeanStd <- c("subject","activity",featMeanStd)
###subset of variables that contain subject, activity, mean and std
subTrainTest <- combTrainTest[,featMeanStd]


##3-Organize the data into groups per subject and activities and calculate means
###Define a function to calculate average for a group
###The function receives a D.F with one group (subject, activity) as input.
###The function calculate the mean for each variable that represents a feature
###The function return one D.F with the mean for each variable(column)
avgGrp <- function(x){
  temp <- lapply(x[,-1:-2],mean) #calculate the averages for the features
  data.frame(temp) #return a df with the averages for this subject and activity
}
###Define groups per subject and activities and calculate averages
###ddply splits the data in groups ("suject", "activity") and invokes avGrp for each group
###ddply collects all the results and assemble a D.F with the variable means for each group 
library(plyr)
grpData <- ddply(subTrainTest,c("subject","activity"),avgGrp)


##4-Final clean up of column names
###Code the activity variable as factor
actNames <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
grpData$activity <- as.factor(grpData$activity)
levels(grpData$activity) <- actNames
###Change the duplicated string BodyBody into Body
###Change "BodyGyro" into "gyro"
###Remove periods
###Add a sufix to indiicate the variables that represent a mean
###Remove the variable prefix XNN.(X followed by number)
matchPref <- "^X[0-9]+"       #match prefixes like XNN.(X followed by a number and period) 
matchBodyx2 <- "BodyBody"     #match duplicated Body
matchBodyGyro <- "BodyGyro"   #match BodyGyro
matchPeriod <- "\\.+"         #match one or more periods
colNames <- colnames(grpData) #get the current column names
colNames <- sub(pattern=matchBodyx2,replacement="Body",x=colNames)
colNames <- sub(pattern=matchBodyGyro,replacement="gyro",x=colNames)
colNames <- gsub(pattern=matchPeriod,replacement="",x=colNames) 
colNames[-1:-2] <- paste(colNames[-1:-2],"mean",sep="")
newColNames <- tolower(make.names(sub(pattern=matchPref, replacement="",x=colNames),unique=TRUE)) 
colnames(grpData)<- newColNames


##5-Store the data frame as a text file
write.table(x=grpData,file="tidyData.txt",row.names=FALSE)
