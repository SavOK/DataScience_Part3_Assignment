#! /usr/bin/Rscript

library("dplyr")
library("data.table")

CWD <- "~/Coursera/DataScience/Part3/DataScience_Part3_Assignment/"  # working directory
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" # url to data
PATH <- "./UCI_HAR_Datase" # relative path to the data
setwd(CWD)

# function to get zip archive from web and save it in working directory 
# should be run only once return date and time data was downloaded 
get_data_from_web <- function(URL = character()){
    download.file(url = URL, destfile = "./DataSet_Archive.zip", method="curl")
    dateDownloaded <- date()
    unzip(zipfile = "./DataSet_Archive.zip")
    file.rename(from = "./UCI HAR Dataset/", to = PATH) #remove spaces in dir name
    return(dateDownloaded)
}

# extract the features names 
# input:    path to the location of data files
# output:   vector of the names
get_features_names <- function(Path = character() ) {
    File.features <- sprintf("%s/features.txt", Path) 
    if ( ! file.exists(File.features) ) {
        errorStr <- sprintf("ERROR Cannot find file: %s", File.features)
        warning(errorStr)
        return()
    }
    DT <- fread(File.features)
    DT$V2 <- gsub("-", "_", DT$V2)
    DT$V2 <- gsub(",", "_", DT$V2)
    DT$V2 <- gsub("meanF", "MEAN_F", DT$V2)
    DT$V2 <- gsub("angle[(]", "angle_", DT$V2)
    DT$V2 <- gsub("[(]", "", DT$V2)
    DT$V2 <- gsub("[)]", "", DT$V2)
    return(DT$V2)
}

# extract the activity names 
# input:    path to the location of data files
# output:   vector of the names
get_activity_names <- function(Path = character() ) {
    File.activity <- sprintf("%s/activity_labels.txt", Path) 
    if ( ! file.exists(File.activity) ) {
        errorStr <- sprintf("ERROR Cannot find file: %s", File.activity)
        warning(errorStr)
        return()
    }
    DT <- fread(File.activity)
    DT <- DT[order(V1),]
    return(DT$V2)
}

# generate the data.table of the particular type
# input:    path to the location of data files
#           type of the data set ( test or train ) 
# output:   data.table if files are found 
#           NULL if no files are found
get_data_of_type <- function(Path = character(), type = character()) {
    features_names <- get_features_names(Path)
    if ( is.null(features_names) ) {
      errorStr <- sprintf("ERROR Wrong path cannot find features list file: %s", Path)
      warning(errorStr)
      return()
    }
    activity.names <- get_activity_names(Path)
    if ( is.null(activity.names) ) {
      errorStr <- sprintf("ERROR Wrong path cannot find activity list file: %s", Path)
      warning(errorStr)
      return()
    }
    
    FILE.list <- character(length=3)
    FILE.list[1] <- sprintf("%s/%s/X_%s.txt", Path, type, type) #data
    FILE.list[2] <- sprintf("%s/%s/subject_%s.txt", Path, type, type) # subject factor
    FILE.list[3] <- sprintf("%s/%s/y_%s.txt", Path, type, type) # activity factor
    if (! identical(file.exists(FILE.list), c(T, T, T))) {
        errorStr <- sprintf("ERROR Cannot find files: %s %s %s", FILE.list[1], 
                            FILE.list[2], FILE.list[3])
        warning(errorStr)
        return( )
    }
    DT <- fread(input = FILE.list[1], header=F )
    colnames(DT) <- features_names
    subject.DT <- fread(input = FILE.list[2], header = F )
    activity.DT <- fread(input = FILE.list[3], header = F )
    DT$subject <- subject.DT$V1
    DT$activity <- as.factor(activity.DT$V1)
    levels( DT$activity) <- activity.names
    return( DT )  
}

# creates combined data 
# input:    path to the location of the set
# output:   combine data table
#           NULL if something went wrong
get_combined_data <- function(Path = character()) {
    DT.test <- get_data_of_type(Path, "test")
    DT.train <- get_data_of_type(Path, "train")
    if ( is.null(DT.test) | is.null(DT.train) ) {
        return() 
    }
    DT <- rbindlist(l = list(DT.test, DT.train))
    DT$subject <- as.factor(DT$subject)
    return( arrange(DT, subject, activity))
}

# extract only colums with mean and standard deviation
get_means_and_std <- function(DT = data.table()) {
    Col.Names <- colnames(DT)
    ColToKeep <- grep(pattern = "mean|std|Mean", x = Col.Names, perl = F)
    return( DT[, c(ncol(DT)-1, ncol(DT), ColToKeep),  with = F])
}

round_mean <- function (X) {
  return ( round(mean(X), 8) )
}

# ALL IN ONE FUNCTION
# Copy file from assignment web page in Path
# input:    relative path to derectory with data directory
#           DownloadFlag = T will fetch data from the web and unzip it
# output:   Tidy data set in data.table 
make_tidy_set <- function( Path = character(), DownloadFlag = FALSE) {
    if (DownloadFlag) {
        dataDate <- get_data_from_web(URL)
    }
    #creates combine data 
    # IMPORTANT all factoring and renaming happend at this stage
    DT <- get_combined_data(Path)

    #creates data table of means and std measurements
    DT.mean <- get_means_and_std(DT)

    Features <- colnames(DT.mean)
    #aggregates mean values for subject and activity
    DT.final <-aggregate(DT.mean[,3:ncol(DT.mean), with=F], 
                         by=list(DT.mean$subject, DT.mean$activity), FUN = round_mean,  simplify = TRUE)
    colnames(DT.final) <- Features
    return(DT.final)
} 


DT.tidy <- make_tidy_set(PATH, F)
write.table(x = DT.tidy, file = "./clean_average_dataset.txt", row.names = F, col.names = T, 
            sep = " ", quote = F)

