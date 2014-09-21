# 1) Downloaded the data file from the website

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","project3.zip")

# 2) unzipped downloaded file

unzip("project3.zip")

# 3) move to zipped directory

setwd("./UCI HAR Dataset")

# 4) Read in training files for data, ID, and Activity

trainx<-read.table("./train/X_train.txt")

trainID<-read.table("./train/subject_train.txt")

trainactivity<-read.table("./train/y_train.txt")

# 5) Read in test files for data, ID, and Activity

testx<-read.table("./test/X_test.txt")

testID<-read.table("./test/subject_test.txt")

testactivity<-read.table("./test/y_test.txt")

# 6) Merge the training data together

testx<-cbind(testID,testactivity,testx)

# 7) Merge the test data together

trainx<-cbind(trainID,trainactivity,trainx)

# 8) Merge the data test

combinedx<-rbind(testx,trainx)

# 9) Get the labels for the data set.

a<-read.table("./features.txt")

# 10) Remove the extra column so we have a just a column of names

a1<-a[,2]

# 11) Create additional labels vector for identity and activity.

a2<-c("ID","Activity")

# 23) A1 is a factor so force to a character vector.

a1<-as.character(a1)

# 14) Combine activity and ID labels with the data labels

a3<-c(a2,a1)

# 15) Relabeled the extracted mean and std data frame

colnames(combinedx)<-a3

# 16) Find which columns have mean() and std() in the name.

x1<-grep("mean()",a1)

  x2<-grep("std()",a1)

# 17) Combine and sort the vectors that have mean and std in them.

x3<-c(x1,x2)

x4<-sort(x3)

# 18) Correcting for the vector numbers because the label vector was increased by 2 by adding in ID and Activity

x5<-x4+2

# 19) Making sure the extracted data frame has the ID and activities column

x6<-c(1,2,x5)

# 20) Extracting the columns with mean, std, ID, and activity from the larger data frame

meanstd<-combinedx[,x6]

# 21) Read in the activiy labels

activity<-read.table("./activity_labels.txt")

# 22) Chaning the activity table to a vector and making it a character vector

activity<-activity[,2]

activity=as.character(activity)

# 23) Removing activities from data frame amd converting the integer to character vector

b1<-as.character(combinedx[,2])

# 24) taking the data frame and changing it to a character vector. Revalue needs character vectors

b2=as.character(b1[[1]]) 

# 25) Changing the values in the activities column from numbers to names

b2<-revalue(b1,c("1"=activity[1],"2"=activity[2],"3"=activity[3],"4"=activity[4],"5"=activity[5],"6"=activity[6]))

# 26) Replacing the activities column in the data frame with the new column in labels.

meanstd[,2]=b2

# 31) Generating the average of each column for each activity of each subject

d1<-ddply(meanstd,.(ID,Activity),numcolwise(mean))

# 32) write the tidy data table to a txt file with no row names

write.table(d1,file="data.txt",sep=",",row.names=FALSE)
