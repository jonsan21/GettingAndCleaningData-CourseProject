# Codebook
Jonathan Sanito  
August 17, 2015  


#General

##Tidy data set (tidydata.txt)



- The tidy data set contains merged rows of train and test data sets.
- There are 10299 observations of 68 variables - a subset of mean and SD features from the original 561 measurements.

```
## [1] "Dimensions of the tidy dataset (rows, columns):"
```

```
## [1] 10299    68
```

- Variables include subject and activity labels, and a subset of measurements described in features.txt file of the orignal data sets (mean and SD features), with column labels in the header row.


```
## [1] "Variables in the data set:"
```

```
##  [1] "subject"                     "activitylabels"             
##  [3] "tBodyAcc.mean...X"           "tBodyAcc.mean...Y"          
##  [5] "tBodyAcc.mean...Z"           "tBodyAcc.std...X"           
##  [7] "tBodyAcc.std...Y"            "tBodyAcc.std...Z"           
##  [9] "tGravityAcc.mean...X"        "tGravityAcc.mean...Y"       
## [11] "tGravityAcc.mean...Z"        "tGravityAcc.std...X"        
## [13] "tGravityAcc.std...Y"         "tGravityAcc.std...Z"        
## [15] "tBodyAccJerk.mean...X"       "tBodyAccJerk.mean...Y"      
## [17] "tBodyAccJerk.mean...Z"       "tBodyAccJerk.std...X"       
## [19] "tBodyAccJerk.std...Y"        "tBodyAccJerk.std...Z"       
## [21] "tBodyGyro.mean...X"          "tBodyGyro.mean...Y"         
## [23] "tBodyGyro.mean...Z"          "tBodyGyro.std...X"          
## [25] "tBodyGyro.std...Y"           "tBodyGyro.std...Z"          
## [27] "tBodyGyroJerk.mean...X"      "tBodyGyroJerk.mean...Y"     
## [29] "tBodyGyroJerk.mean...Z"      "tBodyGyroJerk.std...X"      
## [31] "tBodyGyroJerk.std...Y"       "tBodyGyroJerk.std...Z"      
## [33] "tBodyAccMag.mean.."          "tBodyAccMag.std.."          
## [35] "tGravityAccMag.mean.."       "tGravityAccMag.std.."       
## [37] "tBodyAccJerkMag.mean.."      "tBodyAccJerkMag.std.."      
## [39] "tBodyGyroMag.mean.."         "tBodyGyroMag.std.."         
## [41] "tBodyGyroJerkMag.mean.."     "tBodyGyroJerkMag.std.."     
## [43] "fBodyAcc.mean...X"           "fBodyAcc.mean...Y"          
## [45] "fBodyAcc.mean...Z"           "fBodyAcc.std...X"           
## [47] "fBodyAcc.std...Y"            "fBodyAcc.std...Z"           
## [49] "fBodyAccJerk.mean...X"       "fBodyAccJerk.mean...Y"      
## [51] "fBodyAccJerk.mean...Z"       "fBodyAccJerk.std...X"       
## [53] "fBodyAccJerk.std...Y"        "fBodyAccJerk.std...Z"       
## [55] "fBodyGyro.mean...X"          "fBodyGyro.mean...Y"         
## [57] "fBodyGyro.mean...Z"          "fBodyGyro.std...X"          
## [59] "fBodyGyro.std...Y"           "fBodyGyro.std...Z"          
## [61] "fBodyAccMag.mean.."          "fBodyAccMag.std.."          
## [63] "fBodyBodyAccJerkMag.mean.."  "fBodyBodyAccJerkMag.std.."  
## [65] "fBodyBodyGyroMag.mean.."     "fBodyBodyGyroMag.std.."     
## [67] "fBodyBodyGyroJerkMag.mean.." "fBodyBodyGyroJerkMag.std.."
```

##Mean Tidy data set (tidydata_mean.txt)



- The mean tidy data set contains means of the features in tidy data set, aggregated by Subject and Activity.
- Variable names are the same as the tidydata.txt
- There are 180 rows, aggregates for each of 6 activities for each of 30 subjects.


```
## [1] "Dimensions of the tidy dataset (rows, columns):"
```

```
## [1] 180  68
```

