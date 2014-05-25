cleandatacoursera
=================

Created for [Getting and Cleaning Data](https://class.coursera.org/getdata-003) online course (Coursera).

## Project's description (taken verbatim from the course's site)
 
> The purpose of this project is to demonstrate your ability to collect,
> work with, and clean a data set. The goal is to prepare tidy data that
> can be used for later analysis. You will be graded by your peers on a
> series of yes/no questions related to the project. You will be
> required to submit: 1) a tidy data set as described below, 2) a link
> to a Github repository with your script for performing the analysis,
> and 3) a code book that describes the variables, the data, and any
> transformations or work that you performed to clean up the data called
> CodeBook.md. You should also include a README.md in the repo with your
> scripts. This repo explains how all of the scripts work and how they
> are connected. 
> 
> One of the most exciting areas in all of data science right now is
> wearable computing - see for example this article . Companies like
> Fitbit, Nike, and Jawbone Up are racing to develop the most advanced
> algorithms to attract new users. The data linked to from the course
> website represent data collected from the accelerometers from the
> Samsung Galaxy S smartphone. A full description is available at the
> site where the data was obtained:
> 
> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
> 
> Here are the data for the project:
> 
> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
> 
>  You should create one R script called run_analysis.R that does the
> following. 
> 
> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive activity names. 
> 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
----------------------------------------------------

## run_analysis.R

Here's a short description of the [run_analysis.R](https://github.com/prontog/cleandatacoursera/blob/master/run_analysis.R) script: 

Note that the contents of the .zip file should be extracted at the root directory of the repo. 

* The activity labels are read from file "UCI HAR Dataset/activity_labels.txt".
* The features are read from file "UCI HAR Dataset/features.txt".
* The feature names are renamed (regex):
  * from  ",ACTIVITY_ID$" to ", ACTIVITY_NAME"
  * from  ")ACTIVITY_ID$" to ") ACTIVITY_NAME"
where ACTIVITY_ID and ACTIVITY_NAME are the first and secodn columns respectively from *activity_labels.txt*.
* The train and test datasets are read from the "UCI HAR Dataset/train/X_train.txt" and "UCI HAR Dataset/test/X_test.txt" files rescpectively. The column names are taken from the renamed feature names. Both sets are conbined into a single dataframe.
* The mean and standard deviation features are copied into another dataframe. These are the features that have the "mean(" or "std(" substring in their name. Note that feature names containing "meanFreq" are not extracted.
* The tidy dataset is save to file "x_tidy.txt"

## CodeBook.md

This is the code book for the tidy data set that is created by run_analysis.R.

The code book was generated semi-automatically. The following R code was used to create a text file that was further edited in a text editor (gedit):

    vars <- names(meanStdSet)
    vars <- sub("^t(.*)","t\\1    *time*", vars)
    vars <- sub("^f(.*)","f\\1    *frequency*", vars)
    vars <- sub("(.*)(mean\\(\\))(.*)","\\1\\2\\3@@@Mean", vars)
    vars <- sub("(.*)(std\\(\\))(.*)","\\1\\2\\3@@@Standard deviation", vars)
    vars <- sub("(.)([^-]*)(.*)","\\1\\2\\3 \\2", vars)
    vars <- sub("(.*)(-)([XYZ]{1,3})( .*)", "\\1\\2\\3\\4 in the \\3 dimension", vars)

The @@@ substring was added to denote where a new line was to be added.
