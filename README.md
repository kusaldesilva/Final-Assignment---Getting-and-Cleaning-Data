# Final-Assignment---Getting-and-Cleaning-Data

Dataset
Human Activity Recognition Using Smartphones

Files
CodeBook.md a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data

run_analysis.R performs the data preparation as described in the course project’s definition:

Merges the training and the test sets to create one data set with target variables.
Binds these files,
subject_train.txt
X_train.txt
y_train.txt

Binds these files,
subject_test.txt
X_test.txt
y_test.txt

Binds the data frames created for test and train set into one large dataset by rows.

Extracts only the measurements on the mean and standard deviation for each measurement.
Finds the target features, which are the features with measurements about mean and standard deviation, and extracts them as well as those that indicate the 'subject' and 'activity' and creates a new data table only with the target variables.
Uses descriptive activity names to name the activities in the data set.
Replace the variable about activity, that contains integers from 1 to 6, with a factor based on levels and labels contained in the 'activity_labels' data file.
Appropriately labels the data set with target variables with descriptive names.
Extracts the target variable names from 'features.txt'.
Creates a new tidy dataset with the appropriate labels for the variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Group the tidy data table created in step 4, by 'subject' and 'activity'.

Summarize each variable to find the average for the grouped values.

Ungroup the data table.

Add descriptive names to the variables of the new tidy data table, by adding the prefix 'Avrg-' in the names of the target feature averages.

Write the data in a text file in the present working directory, by the command:
