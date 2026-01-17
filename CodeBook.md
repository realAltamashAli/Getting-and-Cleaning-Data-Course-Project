Code Book
This document describes the variables, the data, and the transformations performed to clean up the data.

The Data Source
The data is derived from the "Human Activity Recognition Using Smartphones Dataset" which contains accelerometer and gyroscope 3-axial raw signals.

Identifiers
subject: The ID of the test subject (1 to 30).

activity: The type of activity performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

Measurements
The columns represent the average of each variable for each activity and each subject.

Time prefix: Time domain signals.

Frequency prefix: Frequency domain signals.

Mean: Mean value.

Std: Standard deviation.

Transformations
Training and test sets were merged.

Only mean and standard deviation measurements were extracted.

Descriptive activity names were applied to the data set.

Variable names were cleaned (e.g., "Acc" became "Accelerometer").

A second tidy data set was created with the average of each variable for each activity and each subject.
