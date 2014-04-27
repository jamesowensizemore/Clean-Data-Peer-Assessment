## Getting and Cleaning Data Peer Assessment Project

----------------------------------------------------

Below is a brief overview of the process used in the run_analysis.R file

----------------------------------------------------



* Reads the activity labels into a dataframe and coerces them to character values
* Reads in the activity label numbers from the test subjects
* Replaces the numbers in the above label with the appropriate descriptive activity name
* Reads in the test subject numbers
* Reads in the data from "X_test"
* Repeats the above 4 steps for the "train" data sets
* Merges the data, labels, and subject numbers each into a single dataset
* Selects desired columns from the dataframe containing the data (Here there was some ambiguity in the assignment, I decided to go with all columns that ended in mean() or std() )
* Adds a column containing activity name and subject number to the dataframe containg the data
* Renames the columns to have the appropriate descriptive name
* Reorders the dataframe by the test subject number
* Outputs the final tidy data to a file title "TotalData.txt"
