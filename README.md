# Getting-and-Cleaning-Data-Assignment

In the run_analysis.R script, the whole file works in the following procedule: 
  
  In the first part, the requirements 1 & 2 are handled. In the first place, by following the related requirements, the function readData   is established for reading data from local test or train files. Then, combining test and train datasets produces the initial version of   target merge data set called mergeData. Afterwards,change "mean" and "std" mergeData column names into "Mean" and "SD".
  
  In the second Part,the requirements 3 & 4 are met. the names contained in the "activity_label.txt" file are used to name the columns of 
  mergeData in the last part. Also, the row number list is produced which can be used to locate the rows in mergeData that meet the 
  activity labels. 
  
  In the third part, the wanted tidy file is produced based on the row number list built in the last part. 
