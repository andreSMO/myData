
##Basic prerequisite
  
The working directory must contain a directory called "UCI HAR Dataset" with the corresponding files and directories with the data from the Samsung smart-phone experiments.

##Script run_analysis

The script run_analysis processes the data and it stores a tidy data structure according to the csv format in the file "tidyData.txt" in the working directory. The script functions can be grouped in the following areas:

* Read the files and build a basic data frame

* Define variables and extract relevant variables into a subset data frame

* Organize the data into groups per subject and activities and calculate means

* Clean up variable names

* Store the results

###Read the files and build a basic data frame 

The following steps are performed:

1- Read the data from the "train" directory assuming that all columns are numeric (colClasses="numeric") in order to speed up the read.table(). The data is combined by columns (cbind) into a "train" data frame.
 
2- Read the data from the "test" directory assuming that all columns are numeric. The data is combined by columns (cbind) into a "test" data frame.

3- The test and train data frames are combined by rows (rbind) into a basic data frame with all the data.  

The function called "getCombineCols" that has three files as input is used to perform the steps 1 and 2 above. Both steps follow the same sequence of operations but with different file names. The output is a data frame where the data is combined by columns. 

In this phase, there is also a control if there are any NA values in the data. In this case, the result is false.
The output in this phase is a data frame with 10299 rows and 563 columns containing the raw data. The variable names are default names assigned by R.

###Define variable names and extract relevant variables into a subset data frame

A requirement is to extract only the variables that describe the mean and the standard deviation of the measurements. Notice that the "mean frequency" is not included. 
The following steps are performed:

-1 Read the feature names defined in the file "feature.txt" as the input for defining the symbolic variable names. There are 561 feature names.

-2 Define the symbolic variable names. The variable names are defined as the vector c("subject", "activity", featNames) where featNames is a vector with 561 feature names. That is, the variables now are named as "subject",activity" plus 561 variables defined according to the corresponding feature name. 

-3 Define the column names in the data frame with the symbolic names defined in the previous step.

-4 Use grepl with corresponding regular expression to find all variables that end with mean, std but exclude "meanFreq". The output is a logical vector.

-5 Subset the original data frame to contain only the variables as defined in the previous step.

The output here is a data frame with fewer columns(10299 rows and 68 columns) where are all variable names are based on the feature descriptions (excluding "subject", "activity" variables).
 
###Organize the data into groups per subject and activities and calculate means

In the original data each subject perform the different activities multiple times. The corresponding measurements are taken for each time. Now it is required to group the data per subscriber and activity and to calculate the corresponding mean for the variables for each subscriber, activity group.  
The function ddply (plyr) is used to group the data according to c("subject", "activity")and to calculate the mean for each group. The output is a data frame with 180 rows and 68 columns.    

###Clean up variable names
The following steps are performed:

* The variable "activity" is transformed into a factor variable with six levels: "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"

The following steps are performed by defining the corresponding regular expression and using the sub command.  

* Change the duplicated string BodyBody into Body (sub)

* Remove all periods from the variable names (use gsub)

* Remove the variable prefixes XNN (sub)

* Add the suffix "mean" to each variable name using paste 

When all the steps are performed, the column names for the data frame are updated. 

The output in this step is a data frame with 68 columns and 180 rows. The columns are defined with the variable names according to the aforementioned transformations.

###Store the resulting data frame as a text file
The file is stored as a text file according to the csv format with the sep="," and row.names=FALSE.

write.csv(grpData,file= "tidyData.txt",row.names=FALSE)
