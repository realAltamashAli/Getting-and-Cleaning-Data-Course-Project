# Getting and Cleaning Data Course Project

This repository contains the R script and documentation for the Week 4 assignment of the Getting and Cleaning Data Coursera course.

### Project Overview
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

### Files in this Repository
* `run_analysis.R` - The R script that performs the 5 steps of the data cleaning process.
* `FinalData.txt` - The final output tidy dataset containing the averages for each subject and activity.
* `CodeBook.md` - A document describing the variables, the data, and the transformations performed.
* `README.md` - This file, explaining how the script works and how the files are connected.

### Data Cleaning Steps
The `run_analysis.R` script performs the following:
1. **Merge:** Combines the training and test sets to create one comprehensive data set.
2. **Extract:** Filters for only the measurements on the mean and standard deviation for each sensor measurement.
3. **Name:** Replaces numeric activity codes with descriptive names (e.g., WALKING).
4. **Label:** Renames columns with descriptive names (e.g., replacing "Acc" with "Accelerometer").
5. **Summarize:** Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### How to Reproduce the Results
1. Download the data from the [UCI HAR Dataset link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip the folder into your working directory.
3. Run the `run_analysis.R` script in RStudio.
4. Locate the `FinalData.txt` file generated in your folder.
