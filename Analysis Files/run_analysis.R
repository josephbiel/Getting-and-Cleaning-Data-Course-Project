# function run_analysis()
#
# This function 
#     1) reads data collected from Samsung Galaxy S phone accelerometer
#        and gyroscope data
#     2) processes that data to produces a summary of a subset of that data
#     3) writes the processed data to a CSV file
#
# Inputs:
#     The data files (for example, the test folder and train folder) are 
#     assumed to be in the RStudio working directory
#     
#
# Outputs:
#     output_data.csv = CSV file
#
run_analysis<-function(dataFolder){
    # Read test data
    testData<-read.table("test/X_test.txt")
    
    # Read the subject ID numbers associated with the test data
    testDataSubjectNumbers<-read.table("test/subject_test.txt")
    
    # Read the activity numbers associated with the test data
    testDataActivities<-read.table("test/y_test.txt")
    
    # Read training data
    trainData<-read.table("train/X_train.txt")
    
    # Read the subject ID numbers associated with the training data
    trainDataSubjectNumbers<-read.table("train/subject_train.txt")
    
    # Read the activity numbers associated with the training data
    trainDataActivities<-read.table("train/y_train.txt")
    
    # Read the names associated with the activity numbers
    dataNames<-read.table("features.txt")
    
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
    write.table(secondIndependentTidyData, "output_data.txt", row.names=FALSE)
}