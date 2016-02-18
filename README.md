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

Original data was simplified and summarized in [tidy set]. 
The [R script] that performs data transformation by: 


+ Merging the training and the test sets to create unified set.
+ Extracting only the measurements on the mean and standard deviation for each measurement.
+ Changing activity names to more descriptive.
+ Changing labels of the data set with descriptive variable names.
+ Creating  tidy data set with the average of each variable for each activity and each subject.


__IMPORTANT: All measurements in tidy set are averages of each variable for each activity and each participant__ 
---
### Description of each variable
+ subject (integer).  Identifies the participant number. Its range is from  1 to 30
+ activity (character). The activity the participant performed. 
	1. WALKING
	2. WALKING_UPSTAIRS
	3. WALKING_DOWNSTAIRS
	4. SITTING
	5. STANDING
	6. LAYING
+ tBodyAcc_mean_XYZ (numeric). Mean value of the body acceleration signal in X, Y, Z directions [$m/s^2$].
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
+ tBodyAccJerkMag_mean (numeric). Magnitude mean of Jerk body acceleration signal [$m/s^3$].
+ tBodyAccJerkMag_std (numeric). Magnitude standard deviation of Jerk body acceleration signal [$m/s^3$].
+ tBodyGyroMag_mean (numeric). Magnitude mean of body gyroscope signal [$rad/s^2$].
+ tBodyGyroMag_std (numeric). Magnitude standard deviation of body gyroscope signal [$rad/s^2$].
+ tBodyGyroJerkMag_mean (numeric). Magnitude mean of Jerk body gyroscope signal [$rad/s^3$].
+ tBodyGyroJerkMag_std (numeric). Magnitude standard deviation of Jerk body gyroscope signal [$rad/s^3$].
+ fBodyAcc_mean_XYZ (numeric). Mean value of the body acceleration signal in X, Y, Z directions after Fast Fourier Transformation (FFT) [$m/s^2$ ].
+ fBodyAcc_std_XYZ (numeric). Standard deviation of the body acceleration signal in X, Y, Z directions after FFT [$m/s^2$ ].
+ fBodyAccJerk_mean_XYZ (numeric). Mean value of the Jerk acceleration signal in X, Y, Z directions after FFT [$m/s^3$].
+ fBodyAccJerk_std_XYZ (numeric). Standard deviation of the Jerk acceleration signal in X, Y, Z directions after FFT [$m/s^3$].
+ fBodyGyro_mean_XYZ (numeric). Mean value of the body gyroscope signal in X, Y, Z directions after FFT [$rad/s$].
+ fBodyGyro_std_XYZ (numeric). Standard deviation of the body gyroscope signal in X, Y, Z directions after FFT [$rad/s$].
+ fBodyAccMag_mean (numeric). Magnitude mean value of body acceleration signal after FFT [$m/s^2$].
+  fBodyAccMag_std (numeric). Magnitude standard deviation of body acceleration signal after FFT [$m/s^2$].
+ fBodyBodyAccJerkMag_mean (numeric). Magnitude mean of Jerk body acceleration signal after FFT [$m/s^3$].
+ fBodyBodyAccJerkMag_std (numeric). Magnitude standard deviation of Jerk body acceleration signal after FFT [$m/s^3$].
+ fBodyBodyGyroMag_mean (numeric). Magnitude mean of body gyroscope signal after FFT  [$rad/s^2$].
+ fBodyBodyGyroMag_std (numeric). Magnitude standard deviation of body gyroscope signal after FFT  [$rad/s^2$].
+ fBodyBodyGyroJerkMag_mean (numeric). Magnitude mean of Jerk body gyroscope signal after FFT [$rad/s^3$].
+ fBodyBodyGyroJerkMag_std (numeric). Magnitude standard deviation of Jerk body gyroscope signal after FFT [$rad/s^3$].
+ angle_tBodyAccMean_gravity (numeric). Mean value of the body acceleration signal in signal window. [$m/s^2$].
+ angle_tBodyAccJerkMean_gravityMean (numeric). Mean value of Jerk body acceleration signal in signal window. [$m/s^3$].
+ angle_tBodyGyroMean_gravityMean (numeric). Mean value of the gyroscope signal in signal window. [$rad/s^2$].
+ angle_tBodyGyroJerkMean_gravityMean (numeric). Mean value of Jerk of  gyroscope signal in signal window. [$rad/s^3$].
+ angle_XYZ_gravityMean  (numeric). Mean value of the gravity acceleration in signal window in X, Y, Z directions [$m/s^2$]. 

For more detailed and meaningful explanation please refer to original [description]. ( _I myself have difficulty to understand about a half of those variables_ ) 

## Reference
<a name="ref1">
1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. _International Workshop of Ambient Assisted Living (IWAAL 2012)_. Vitoria-Gasteiz, Spain. Dec 2012
</a>
[Assignment Page]: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
[dataset page]:<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
[tidy set]:./clean_average_dataset.txt
[R script]:./run_analysis.R
[description]:./features_info.txt


