# function run_analysis(path)
#
# This function 
#     1) reads data collected from Samsung Galaxy S phone accelerometer
#        and gyroscope data
#     2) processes that data to produces a summary of a subset of that data
#     3) writes the processed data to a CSV file
#
# Inputs:
#     path = a string containing a path to the folder that contains
#            the phone data
#
# Outputs:
#     output_data.csv = CSV file
#
run_analysis<-function(dataFolder){
    # Read test data
    testDataFile<-paste(dataFolder, "/test/X_test.txt", sep="")
    testData<-read.table(testDataFile)
    
    # Read the subject ID numbers associated with the test data
    testDataSubjectNumbersFile<-paste(dataFolder, "/test/subject_test.txt", sep="")
    testDataSubjectNumbers<-read.table(testDataSubjectNumbersFile)
    
    # Read the activity numbers associated with the test data
    testDataActivitiesFile<-paste(dataFolder, "/test/y_test.txt", sep="")
    testDataActivities<-read.table(testDataActivitiesFile)
    
    # Read training data
    trainDataFile<-paste(dataFolder, "/train/X_train.txt", sep="")
    trainData<-read.table(trainDataFile)
    
    # Read the subject ID numbers associated with the training data
    trainDataSubjectNumbersFile<-paste(dataFolder, "/train/subject_train.txt", sep="")
    trainDataSubjectNumbers<-read.table(trainDataSubjectNumbersFile)
    
    # Read the activity numbers associated with the training data
    trainDataActivitiesFile<-paste(dataFolder, "/train/y_train.txt", sep="")
    trainDataActivities<-read.table(trainDataActivitiesFile)
    
    # Read the names associated with the activity numbers
    dataNamesFile<-paste(dataFolder, "/features.txt", sep="")
    dataNames<-read.table(dataNamesFile)
    
    # Combine rows for test and training data
    data<-bind_rows(testData, trainData)
    activities<-bind_rows(testDataActivities, trainDataActivities)
    subjectNumbers<-bind_rows(testDataSubjectNumbers, trainDataSubjectNumbers)
    
    # Pre-pend columns for activity number and subject ID number
    data<-bind_cols(subjectNumbers, data)
    data<-bind_cols(activities, data)
    
    # Create variable names for the data columns
    dataNamesVector<-c("Activity", "SubjectNumber")
    dataNamesVector<-append(dataNamesVector, dataNames$V2)
    colnames(data)<-dataNamesVector

    # Remove columns that are not a mean or standard deviation
    selectedDataColumns<-select(data, matches("Activity|SubjectNumber|mean|std"))
    
    # Replace activity numbers with factor names
    factorNames<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
    activitiesFactors<-factor(selectedDataColumns$Activity, labels=factorNames)
    selectedDataColumns$Activity<-activitiesFactors
    
    # Create a new table that summarizes the mean of each variable for each
    # subject number and activity
    secondIndependentTidyData<-group_by(selectedDataColumns, Activity, SubjectNumber) %>% summarize(across(everything(),mean))
    View(secondIndependentTidyData)
    
    # Write the results of analysis to a CSV file
    write.csv(secondIndependentTidyData, "output_data.csv")
}