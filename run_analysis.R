
readData <- function(file){
  data <- read.table(file, 
                     header = FALSE,
                     quote = "",
                     na.strings = "",
                     fill = TRUE
  )
}

writeData <- function(data, file){
  write.table(data, 
              file=file,
              sep = " ",
              row.names = FALSE,
              col.names = FALSE,
              quote = FALSE
  )
}


meanStdColumns <- function(){
  features <- read.table("./UCI HAR Dataset/features.txt",
                         col.names = c("colNo","featureName"))
  index <- features$colNo[grep('mean()|std()',as.character(features$featureName))]
  colNames <- as.character(features$featureName[index])
  write(colNames, "./result/features.txt")
  index
}


library(dplyr)

if(!file.exists("./rawData.zip")){
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              destfile = "rawData.zip")
}  
unzip("rawData.zip", exdir = ".")

#set the working directory to the directory that contains dataset 



# The result data will be stored in the result folder
resultRecDir <- "./result"

# delete the result directory and all its files if alreay exists 
if (dir.exists(resultRecDir)){
  unlink(resultRecDir, recursive = TRUE)
}

#create a result directory
dir.create(resultRecDir, recursive = TRUE,mode = 0777 )


#All the files that contain data 

trainSubjectFile <- "./UCI HAR Dataset/train/subject_train.txt"
testSubjectFile <- "./UCI HAR Dataset/test/subject_test.txt"
resultSubjectFile <- "./result/subject.txt"

trainLabelFile <- "./UCI HAR Dataset/train/y_train.txt"
testLabelFile<- "./UCI HAR Dataset/test/y_test.txt"
resultLabelFile<- "./result/y.txt"

trainSetFile <- "./UCI HAR Dataset/train/X_train.txt"
testSetFile<- "./UCI HAR Dataset/test/X_test.txt"
resultSetFile<- "./result/X_mean_std.txt"  

colNames <-vector()
tryCatch({

   dfAct <- read.table("./UCI HAR Dataset/activity_labels.txt",
                      col.names = c("ID","Label"))
   
   trainSub <- readData(trainSubjectFile)  
   testSub <- readData(testSubjectFile)
   #merge trainData and testData 
   subData <- rbind(trainSub, testSub)
   
   ###Sort all the observations based on ascending id of subject 
   ##from subject records get an orderedIndex that sorts 
   ##subject after merging, 
   orderedIndex <- order(subData)
   
   #rearrange all other measurements based on the orderedIndex
   orderedSubData <- subData[orderedIndex,]
   
   
  
     
   trainLab <- readData(trainLabelFile)
   testLab <- readData(testLabelFile)
   labData <- rbind(trainLab,testLab)
   orderedLabelData <- labData[orderedIndex,]  
   
   
   trainSet <- readData(trainSetFile)
   testSet <- readData(testSetFile)
   dataSet <- rbind(trainSet,testSet)
   orderedDataSet <- dataSet[orderedIndex,]
   meanStdDataSet <- orderedDataSet[,meanStdColumns()]
   activtyData <- cbind("labelID"=orderedLabelData,meanStdDataSet,orderedSubData)
   
   mergedData <- merge(x=activtyData, y=dfAct, by.x="labelID", by.y="ID")
   finalData <- mergedData[,-1]
   
   #writeData(orderedSubData,resultSubjectFile)
   #writeData(orderedLabelData,resultLabelFile)
   writeData(finalData, resultSetFile)
  
})


