# datasciencecoursera
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

### how *run_analysis.R* works:
=========
### Step1:
### Step2:
### Step3:
### Step4:
### Step5:
use regular expression to extract features of measurements on mean and std: grep("mean\\(\\)",features) and grep("std\\(\\)",features)
