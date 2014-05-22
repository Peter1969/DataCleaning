run_analysis<-function(){
  
  ## Step1-Combine all the data
  testData<-read.table("X_test.txt",header=F)
  subjects<-read.table("subject_test.txt",header=F)
  activities<-read.table("y_test.txt",header=F)
  testData<-cbind(subjects,activities,testData)
  
  trainData<-read.table("X_train.txt",header=F)
  subjects<-read.table("subject_train.txt",header=F)
  activities<-read.table("y_train.txt",header=F)
  trainData<-cbind(subjects,activities,trainData)
  
  mergeData<-rbind(testData,trainData)
  features<-read.table("features.txt",header=F,stringsAsFactors=F)
  names(mergeData)<-c("subject","activity",features[,2])
  cnames<-names(mergeData)
  
  ## Step2-Reduce the columns to those involving mean and sd
  for (cname in cnames){
    if (!grepl("mean()",cname) & !grepl("std()",cname) & !grepl("subject",cname) & !grepl("activity",cname)) 
    {
      mergeData[,cname]<-NULL
    }
  }

  ## Step3-Turn the activity numbers into words
  mergeData$activity<-as.factor(mergeData$activity)
  levels(mergeData$activity)<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

  ## Step4-Fix the variable names
  names(mergeData)<-gsub("\\(\\)","",names(mergeData))
  
  ## Step5-Create and save a version with an average of each variable for each activity and each subject.
  tideData <-aggregate(.~subject+activity,data=mergeData, FUN=mean)
  write.table(tideData,"tideData.txt")
}