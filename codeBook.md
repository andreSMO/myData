#code book

##Introduction
This project has collected and processed data from the following web site: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The web site contains a number of files with data from the accelerometers and gyroscopes from the Samsung Galaxy S smart-phone that were carried by a number of subjects. A full description of the raw data is available in the aforementioned web site.

##Data transformations
The following are the major transformation steps:

* The original data was combined into one data frame with 10299 rows and 563 columns.

* All the variables that did not described the "mean" or "standard deviation" of the measurements were removed. That is, only the variables that contain the prefixes "mean" or "std" were kept. Note that variables describing the mean frequency ("MeanFreq") were not included. The number of variables was  reduced to 68. The data frame has 10299 rows and 68 columns.

* In the original data each subject repeated the same activities multiple times and the corresponding measures were collected. Now the data was grouped per subject and activity and the mean of each variable was calculated for each element in the group (180 groups).  

* A new data frame with the group subject, activity and the corresponding variable means was created. The data frame has 180 rows and 68 columns. 
  
	* The first column has the name "subject".

	* The second column has the name "activity".

	* All the other columns have the corresponding feature names with the modification described below: 

		* All variable names were transformed to lower case
	
		* All periods in the variable names were removed
	
		* Variable names with "bodybody" were modified to contain only "body".
	
		* Variable names with "bodygyro" were modified to contain only "gyro".
	
		* All variable names got the suffix "mean".
	* The chapter code book describes in detail all the variables used. 

##Final Data
The final data is a data frame with a wide representation with 180 rows and 68 columns. 
Each row represents an observation related to the group of one subject and one activity (30 subjects and 6 activities per subject). The rows are not named.
Each column represents one variable with a well defined name. The column 1 represents a subject, column 2 represents an activity. The columns 3 to 68 represent the means of the corresponding measurements (per group of subscriber and activity). 
The data frame is stored as a text file.

##Code Book
The variables are presented here in alphabetical order. 
Each variable is described by its name (abbreviation), a complete description, its type and the corresponding value range.    
The following variables are used:
* activity
	* Activities performed by a subject.
	* Factor variable with six levels: 
		* WALKING
		* WALKING_UPSTAIRS
		* WALKING_DOWNSTAIRS
		* SITTING
		* STANDING
		* LAYING
	
* fbodyaccjerkmagmeanmean
	* Mean of the means of the magnitude of the body acceleration jerk values per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fbodyaccjerkmagstdmean
	* Mean of the standard deviations of the magnitude of the body acceleration jerk values per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fbodyaccjerkmeanxmean
	* Mean of the means for the body acceleration jerk values in the x-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fbodyaccjerkmeanymean
	* Mean of the means for the body acceleration jerk values in the y-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fbodyaccjerkmeanzmean
 	* Mean of the means for the body acceleration jerk values in the z-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fbodyaccjerkstdxmean
	* Mean of the standard deviations of the body acceleration jerk values in the x-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fbodyaccjerkstdymean
	* Mean of the standard deviations of the body acceleration jerk values in the y-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fbodyaccjerkstdzmean
	* Mean of the standard deviations of the body acceleration jerk values in the z-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fbodyaccmagmeanmean
	* Mean of the means of the magnitude for the body acceleration values per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fbodyaccmagstdmean
 	* Mean of the standard deviations of the magnitude for the body acceleration values per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fbodyaccmeanxmean
	* Mean of the means for the body acceleration values in the x-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fbodyaccmeanymean
 	* Mean of the means for the body acceleration values in the y-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fbodyaccmeanzmean
 	* Mean of the means for the body acceleration values in the z-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fbodyaccstdxmean
	* Mean of the standard deviations of the body acceleration values in the x-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fbodyaccstdymean
	* Mean of the standard deviations of the body acceleration values in the y-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fbodyaccstdzmean
	* Mean of the standard deviations of the body acceleration values in the z-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fgyrojerkmagmeanmean
	* Mean of the means of the magnitude for the gyroscope jerk values per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fgyrojerkmagstdmean
	* Mean of the standard deviations of the magnitude for the gyroscope jerk values per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fgyromagmeanmean
	* Mean of the means of the magnitude of the gyroscope values per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fgyromagstdmean
	* Mean of the standard deviations of the magnitude for the gyroscope values per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fgyromeanxmean
	* Mean of the means for the gyroscope values in the x-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fgyromeanymean
	* Mean of the means for the gyroscope values in the y-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fgyromeanzmean
	* Mean of the means for the gyroscope values in the z-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fgyrostdxmean
	* Mean of the standard deviations for the gyroscope values in the x-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fgyrostdymean
	* Mean of the standard deviations for the gyroscope values in the y-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* fgyrostdzmean
	* Mean of the standard deviations for the gyroscope values in the z-axis per subject and activity. Defined in the frequency domain.
	* A numeric variable with a real value.
	
* subject
	* Identity of the subject that participated in the experiment. There are thirty subjects. 
	* An integer with the values: 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30.
	
* tbodyaccjerkmagmeanmean
	* Mean of the means of the magnitude of the body acceleration jerk values per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tbodyaccjerkmagstdmean
	* Mean of the standard deviations of the magnitude of the body acceleration jerk values per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tbodyaccjerkmeanxmean
	* Mean of the means for the body acceleration jerk values in the x-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tbodyaccjerkmeanymean
	* Mean of the means for the body acceleration jerk values in the y-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tbodyaccjerkmeanzmean
 	* Mean of the means for the body acceleration jerk values in the z-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tbodyaccjerkstdxmean
	* Mean of the standard deviations of the body acceleration jerk values in the x-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tbodyaccjerkstdymean
	* Mean of the standard deviations of the body acceleration jerk values in the y-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tbodyaccjerkstdzmean
	* Mean of the standard deviations of the body acceleration jerk values in the z-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tbodyaccmagmeanmean
	* Mean of the means of the magnitude for the body acceleration values per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tbodyaccmagstdmean
 	* Mean of the standard deviations of the magnitude for the body acceleration values per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tbodyaccmeanxmean
	* Mean of the means for the body acceleration values in the x-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tbodyaccmeanymean
 	* Mean of the means for the body acceleration values in the y-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tbodyaccmeanzmean
 	* Mean of the means for the body acceleration values in the z-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tbodyaccstdxmean
	* Mean of the standard deviations of the body acceleration values in the x-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tbodyaccstdymean
	* Mean of the standard deviations of the body acceleration values in the y-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tbodyaccstdzmean
	* Mean of the standard deviations of the body acceleration values in the z-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgyrojerkmagmeanmean
	* Mean of the means of the magnitude for the gyroscope jerk values per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgyrojerkmagstdmean
	* Mean of the standard deviations of the magnitude for the gyroscope jerk values per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgyromagmeanmean
	* Mean of the means of the magnitude of the gyroscope values per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgyromagstdmean
	* Mean of the standard deviations of the magnitude for the gyroscope values per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgyromeanxmean
	* Mean of the means for the gyroscope values in the x-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgyromeanymean
	* Mean of the means for the gyroscope values in the y-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgyromeanzmean
	* Mean of the means for the gyroscope values in the z-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgyrostdxmean
	* Mean of the standard deviations for the gyroscope values in the x-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgyrostdymean
	* Mean of the standard deviations for the gyroscope values in the y-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgyrostdzmean
	* Mean of the standard deviations for the gyroscope values in the z-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* subject
	Identity of the subject that participated in the experiment
	An integer in the range from 1 to 30.
	
* tgravityaccmagmeanmean
 	* Mean of the means of the magnitude for the gravity acceleration values per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgravityaccmagstdmean
	* Mean of the standard deviations of the magnitude for the gravity acceleration values per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgravityaccmeanxmean
	* Mean of the means for the gravity acceleration values in the x-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgravityaccmeanymean
	* Mean of the means for the gravity acceleration values in the y-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgravityaccmeanzmean
	* Mean of the means for the gravity acceleration values in the z-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgravityaccstdxmean
	* Mean of the standard deviations for the gravity acceleration values in the x-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgravityaccstdymean
	* Mean of the standard deviations for the gravity acceleration values in the y-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	
* tgravityaccstdzmean
	* Mean of the standard deviations for the gravity acceleration values in the z-axis per subject and activity. Defined in the time domain.
	* A numeric variable with a real value.
	