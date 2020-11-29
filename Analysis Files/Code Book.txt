==========================================================================
Getting and Cleaning Data
Week 4 Project
==========================================================================
This file contains a description of the data produced by the analysis of 
the smartphone data. This data is contained in the file "output_data.csv".

The file consists of 180 rows, each representing data for a single 
participant in the study (the "SubjectNumber" from 1 to 30) and a single
activity performed by that subject (the "Activity" -- WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING).

The first column contains the SubjectNumber. The second column contains
the Activity. Each of the remaining columns contains data for one of the 
"features" in the original smartphone data. Only those feature names that
contain a mean or a standard deviation (as indicated by the presence of 
"mean" or "std" in the feature name) are included.

The list of feature column names is as follows:
    tBodyAcc-mean()-X,      tBodyAcc-mean()-Y,      tBodyAcc-mean()-Z,
    tBodyAcc-std()-X,       tBodyAcc-std()-Y,       tBodyAcc-std()-Z,
    tGravityAcc-mean()-X,   tGravityAcc-mean()-Y,   tGravityAcc-mean()-Z,
    tGravityAcc-std()-X,    tGravityAcc-std()-Y,    tGravityAcc-std()-Z,
    tBodyAccJerk-mean()-X,  tBodyAccJerk-mean()-Y,  tBodyAccJerk-mean()-Z,
    tBodyAccJerk-std()-X,   tBodyAccJerk-std()-Y,   tBodyAccJerk-std()-Z,
    tBodyGyro-mean()-X,     tBodyGyro-mean()-Y,     tBodyGyro-mean()-Z,
    tBodyGyro-std()-X,      tBodyGyro-std()-Y,      tBodyGyro-std()-Z,
    tBodyGyroJerk-mean()-X, tBodyGyroJerk-mean()-Y, tBodyGyroJerk-mean()-Z,
    tBodyGyroJerk-std()-X,  tBodyGyroJerk-std()-Y,  tBodyGyroJerk-std()-Z,
    tBodyAccMag-mean(),
    tBodyAccMag-std(),
    tGravityAccMag-mean(),
    tGravityAccMag-std(),
    tBodyAccJerkMag-mean(),
    tBodyAccJerkMag-std(),
    tBodyGyroMag-mean(),
    tBodyGyroMag-std(),
    tBodyGyroJerkMag-mean(),
    tBodyGyroJerkMag-std(),
    fBodyAcc-mean()-X,         fBodyAcc-mean()-Y,         fBodyAcc-mean()-Z,
    fBodyAcc-std()-X,          fBodyAcc-std()-Y,          fBodyAcc-std()-Z,
    fBodyAcc-meanFreq()-X,     fBodyAcc-meanFreq()-Y,     fBodyAcc-meanFreq()-Z,
    fBodyAccJerk-mean()-X,     fBodyAccJerk-mean()-Y,     fBodyAccJerk-mean()-Z,
    fBodyAccJerk-std()-X,      fBodyAccJerk-std()-Y,      fBodyAccJerk-std()-Z,
    fBodyAccJerk-meanFreq()-X, fBodyAccJerk-meanFreq()-Y, fBodyAccJerk-meanFreq()-Z,
    fBodyGyro-mean()-X,        fBodyGyro-mean()-Y,        fBodyGyro-mean()-Z,
    fBodyGyro-std()-X,         fBodyGyro-std()-Y,         fBodyGyro-std()-Z,
    fBodyGyro-meanFreq()-X,    fBodyGyro-meanFreq()-Y,    fBodyGyro-meanFreq()-Z,
    fBodyAccMag-mean(),
    fBodyAccMag-std(),
    fBodyAccMag-meanFreq(),
    fBodyBodyAccJerkMag-mean(),
    fBodyBodyAccJerkMag-std(),
    fBodyBodyAccJerkMag-meanFreq(),
    fBodyBodyGyroMag-mean(),
    fBodyBodyGyroMag-std(),
    fBodyBodyGyroMag-meanFreq(),
    fBodyBodyGyroJerkMag-mean(),
    fBodyBodyGyroJerkMag-std(),
    fBodyBodyGyroJerkMag-meanFreq(),
    angle(tBodyAccMean,gravity),
    angle(tBodyAccJerkMean),gravityMean),
    angle(tBodyGyroMean,gravityMean),
    angle(tBodyGyroJerkMean,gravityMean),
    angle(X,gravityMean), angle(Y,gravityMean), angle(Z,gravityMean)

The column entry for a feature contains the mean of the value of that feature in the smartphone data for that row's SubjectNumber and Activity.
