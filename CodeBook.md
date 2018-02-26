#Tidy Datasets: Course Project 
================


------------------------------------------------------------------------

##The Tidy Dataset I
==================

The dataset contains processed data of 6 different activities performed by 30 volunteers wearing Samsung Galaxy S II. Activities include WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING and the mesurements are the readings of embedded accelerometer and gyroscope of the smart phone. The data that was provided for the project is considered as the raw data (though it was itself a tidy data). Using this raw data we merged following modifications...

1.  Merged the training and test data
2.  Extracted columns that contains means and std readings
3.  Added two columns to bind subject and performed activity with every record

###For each record it is provided:
===============================

-   A 81 feature vector
-   Includes 79 features all having either mean or std values
-   Its corrsponding activity label
-   An identifier of the subject who carried out the experiment. 

** List of the features are listed in features.txt file


##The Tidy Data II
================

This data set is generated from the Tidy Data I. Unlike Tidy Data I, It is a grouped data on Activity type and subject who performed the activity.

###For each record it is provided:
===============================

-   An activity label for the experiment
-   The subject ID who carried out the experiment.
-   Average value of 79 different features in their corresponding columns

###The dataset includes the following files:
=========================================

-   'README.md': This file
-   'Codebook.md': Instructions to reproduce the tidy data sets
-   'runAnalysis.R' : Code to generate tidy data I
-   'runAnalysis2.R' : Code to generate tidy data II
-   'result/features.txt': List of all features.
-   'result/X_mean_std.txt': First tidy dataset
-   'result/X_all_means,txt': Second tidy dataset


And the raw data files provided for the project

-   'UCI HAR Dataset/features_info.txt': Shows information about the variables used on the feature vector in raw data.
-   'UCI HAR Dataset/features.txt': List of all features used in raw data.
-   'UCI HAR Dataset/activity_labels.txt': Links the class labels with their activity name.
-   'UCI HAR Dataset/train/X_train.txt': Training set.
-   'UCI HAR Dataset/train/y_train.txt': Training labels.
-   'UCI HAR Dataset/test/X_test.txt': Test set.
-   'UCI HAR Dataset/test/y_test.txt': Test labels.
-   'UCI HAR Dataset/train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
-   'UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.
-   'UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
-   'UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
