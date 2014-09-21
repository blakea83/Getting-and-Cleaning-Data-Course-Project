This is the Codebook for Getting and Cleaning Data Course Project

The zip file of the samsung motion data was downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The downloaded file as unzipped.  The x_train (training data), y_train (subject activity),subject_train (training subjects),
x_test (test data), subject_test (test subject ID) ,and y_test (subject activity text files were read in as a tables.
The test tables were merged in a test table: x,y, subject.  The training tables were merged into a training table: x,y, subject.  
Next, the test and training tables were merged into a data table. The features text file was turned into a vector with  data labels including 
the identity and activity columns. Next, only columns with mean, std, activity, and ID were extracted from the data table into
a mean table. The activity label text file was read into an activities table. 
The numbers in the activity column were converted to activity labels using the activities table.  
