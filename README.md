# datasciencecoursera
### Structure
=========
There are several important files of this project:
  - *run_analysis.R*: the script to manipulate data which is described later
  - *tidy_data.txt*: tidy data produced by executing *run_anaysis.R* on the raw data sets
  - *CodeBook.md*: the code book explaining variables in the data set
  - *features.txt* complements for *CodeBook.md* listing all variable names in *tidy_data.txt*
In addition the two *text* file *tidy_data.txt* and *features.txt* could be loaded from R using the commands below:
```r
read.table("tidy_data.txt")
read.table("features.txt")
```

### How *run_analysis.R* works:
=========
  - Step1: read data and merge train and test sets. Loaded 6 files: subject_train.txt, X_train.txt, y_train.txt, subject_test.txt, X_test.txt, y_test.txt and combined them to create 1 data set using *rbind()*.
  - Step2: label the data set with descriptive variable names. Here I changed the order of the steps as described in the course project description because it is easy and natural to include variable information right after loading data.
  - Step3: extract measurements on mean and std. I used regular expression to find measurements on mean and std and created a new data set combining "subject" and "activity" using *cbind()*.
  - Step4: name activities with descriptive names. Original the value of activities are from 1 to 6. Here I replaced the integer value with its actual meaning with function *mapvalues* from package *plyr*.
  - Step5: create a second, independent tidy data set with the average of each variable for each activity and each subject. Here I used *group_by* and *summarise_each* to group data and apply *mean()* function to each variable.
