# About dataset
You can read more about dataset here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Steps to clean and prepare dataset  
I perform this following steps to clean and prepare dataset.  
1. Read feature and activity names from features.txt and activity_labels.txt.  
2. Read features from train dataset from X_train.txt.  
3. Read activities from y_train.txt and create new column activity.  
4. Read subjects from subject_train.txt and create new column subject.  
5. Repear steps 2-4 for test dataset.  
6. Merge train and test datasets.  
7. Create factor variable from activity column.  
8. Calculating mean for each variable and assign to new variable.  
9. Save new data frame to file.  


