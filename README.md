Step1-Combine all the data
  read test data from X_test.txt
  read subjects from subject_test.txt
  read activities from y_test.txt
  add subjects and activity columns to test Data
  read train data from X_train.txt
  read subjects from subject_train.txt
  read activities from y_train.txt
  add subject and activity columns to train Data
  merge test and train data into a single data frame
  rename column names of the merged data frame with names from features.txt
  
Step2-Reduce the columns to those involving mean and sd
  remove all column with column names NOT containing the string of "mean" or "std"

Step3-Turn the activity numbers into words
  update activitity column with descriptive words such as "WALKING" for "1" and so on

Step4-Fix the variable names
  delete the string "()" from all colunm names
  
Step5-Create and save a version with an average of each variable for each activity and each subject.
  aggregate data frame by subject and activity and calculate the averages of all columns
  write resulting data frame to tideData.txt

