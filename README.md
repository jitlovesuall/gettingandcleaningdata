# gettingandcleaningdata
Repo to submit assignment on getting and cleaning data course project


This is a course project data set that has been created known as "tidy_data.txt" through the R code "run_analysis.R". 

The initial experiment was carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was captured. The obtained dataset was initially randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Then, through the R script, "run_analysis.R", following were performed to create tidy data set (tidy_data.txt):
a. Step 1 - Both training and test data sets were merged
b. Step 2 - Only columns related to mean and standard deviations were kept
c. Step 3 - Proper activity names were assigned to the merged data set
d. Step 4 - The merged dataset was renamed with appropriate column descriptions 
e. Step 5 - A new data set was created from the merged data set having the averge of each variable grouped by subject / volunteer and activity name. Finally, this new data set was outputted as "tidy_data.txt". 

Following files are included for in-depth analysis:
=========================================

- 'README.md' : Shows how the experiment was carried out and what steps were done on the original data sets to come up with the tidy data set. Also, reveals the necessary files / scripts for further analysis.

- 'codebook.md' : Shows information about the variables used on the tidy data set.

- 'run_analysis.R' : Shows the actual R code to come up with the tidy data set.

- 'tidy_data.txt' : Shows the final tidy data set.
