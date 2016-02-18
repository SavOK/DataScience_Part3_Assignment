# Getting and Cleaning Data
---
Original dataset "Human Activity Recognition Using Smartphones Dataset" [[1]](#ref1) was downloaded from [Assignment Page] on Febrary 17 2016

---
##Description of original data and experiment
---
Experiment was done on a group of 30 volunteers. Participants performed different tasks while wearing a smartphone _Samsung Galaxy S II_ on their waist. Using its embedded accelerometer and gyroscope. Authors measured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz using embedded accelerometer and gyroscope.
The sensor signals were  pre-processed by applying noise filters and the sampled in fixed width window of 2.56 sec and 50 overlap (128 readings/window). The signal from accelerometer was divided in two components (gravitational and body motion) by Butterworts low-path filter. 
From each each window, a vector of features was calculated from the time and frequency domain. For more details please read [dataset page]

---
## Description of tidy set
---

Original data was simplified and summarized in [tidy set]. __All measurements in tidy set are averages of each variable for each activity and each participant__ All measurements are normalized in range [-1, 1].
### Description of each variable
+ subject (integer).  Identifies the participant number. Its range is from  1 to 30
+ activity (character). The activity the participant performed. 
	1. WALKING
	2. WALKING_UPSTAIRS
	3. WALKING_DOWNSTAIRS
	4. SITTING
	5. STANDING
	6. LAYING
+ tBodyAcc_mean_XYZ (numeric). Mean value of the body acceleration signal in X, Y, Z directions [$m/s^2$ ].
+ tBodyAcc_std_XYZ (numeric). Standard deviation of the body acceleration signal in X, Y, Z directions [$m/s^2$].
+ tGravityAcc_mean_XYZ (numeric). Mean value of the gravity acceleration signal in X, Y, Z directions [$m/s^2$].
+ tGravityAcc_std_XYZ (numeric). Standard deviation of the gravity acceleration signal in X, Y, Z directions [$m/s^3$].
+ tBodyAccJerk_mean_XYZ (numeric). Mean value of the Jerk acceleration signal in X, Y, Z directions [$m/s^3$].
+ tBodyAccJerk_std_XYZ (numeric). Standard deviation of the Jerk acceleration signal in X, Y, Z directions [$m/s^3$].
+ tBodyGyro_mean_XYZ (numeric). Mean value of the body gyroscope signal in X, Y, Z directions [$rad/s$].
+ tBodyGyro_std_XYZ (numeric). Standard deviation of the body gyroscope signal in X, Y, Z directions [$rad/s$].
+ tBodyGyroJerk_mean_XYZ (numeric). Mean value of the Jerk gyroscope signal in X, Y, Z directions [$rad/s^2$].
+ tBodyGyroJerk_std_XYZ (numeric). Standard deviation of the Jerk gyroscope signal in X, Y, Z directions [$rad/s^2$].
+ tBodyAccMag_mean (numeric). Magnitude mean value of body acceleration signal [$m/s^2$].
+ tBodyAccMag_std (numeric). Magnitude standard deviation of body acceleration signal [$m/s^2$].
+ tGravityAccMag_mean (numeric). Magnitude mean of gravity acceleration signal [$m/s^2$].
+ tGravityAccMag_std (numeric). Magnitude standard deviation of gravity acceleration signal [$m/s^2$].

## Reference
<a name="ref1">
1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. _International Workshop of Ambient Assisted Living (IWAAL 2012)_. Vitoria-Gasteiz, Spain. Dec 2012
</a>


[Assignment Page]: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
[dataset page]:<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
[tidy set]:(./clean_average_dataset.txt)


