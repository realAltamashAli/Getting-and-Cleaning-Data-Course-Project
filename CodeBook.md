# Code Book: Wearable Computing Data Summary

This code book describes the variables, the data, and any transformations performed to clean up the data.

## The Data Source
The raw data comes from the "Human Activity Recognition Using Smartphones Dataset," which recorded 30 subjects performing six activities while wearing a Samsung Galaxy S II smartphone.

## Identifiers
* `subject` - The ID of the test subject (Integer: 1 to 30).
* `activity` - The type of activity performed (Factor: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

## Measurements
The dataset contains 79 measurements. Each value in `FinalData.txt` represents the **average** of the original variable for each subject and activity pair.

### Signal Prefixes:
* **Time** - Time domain signals captured at a constant rate of 50 Hz.
* **Frequency** - Frequency domain signals resulting from a Fast Fourier Transform (FFT).

### Components:
* **Accelerometer** - Linear acceleration signals.
* **Gyroscope** - Angular velocity signals.
* **Mean** - The average value.
* **Std** - The standard deviation.

## Transformations Performed
1. **Merging:** Training and test data (X, Y, and Subject files) were merged using `rbind` and `cbind`.
2. **Filtering:** Used the `select` function to keep only variables with "mean" or "std" in their names.
3. **Activity Naming:** Linked numeric activity codes to the `activity_labels.txt` file for readability.
4. **Variable Renaming:** Used `gsub` to expand abbreviations (e.g., "Mag" to "Magnitude", "Acc" to "Accelerometer").
5. **Aggregating:** Grouped data by `subject` and `activity` and applied the `mean` function to all measurements.
