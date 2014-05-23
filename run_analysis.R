# Read the activites.
activities <- read.csv("UCI HAR Dataset/activity_labels.txt", 
                       sep=" ", 
                       header=F,
                       colClasses=c("numeric", "character"), 
                       col.names=c("Id", "Name"))

# Read all features.
features <- read.csv("UCI HAR Dataset/features.txt", 
                     sep=" ",
                     header=F,
                     colClasses=c("numeric", "character"), 
                     col.names=c("colNumber", "Name"))

# Clean-up feature names. They contain characters such as '(', ')', ',' that cannot be used ofr column names.
TODO

# Read both test and train data sets into one dataframe.
allObservations <- rbind(read.csv("UCI HAR Dataset/train//X_train.txt", sep="", col.names=features$Name),
                         read.csv("UCI HAR Dataset/test//X_test.txt"  , sep="", col.names=features$Name))




# Get only the mean/std features from the feature set. Use grep on the feature$Name.
meanStdFeatures <- features[grep("(mean|std)\\(", features$Name), ]

# Extract only the mean and std columns from the dataset.
meanStdSet <- allObservations[, meanStdFeatures$colNumber]

