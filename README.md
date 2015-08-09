Get-REAL-
=========

The purpose of this repository is to house R Scripts and documentation for the  Get REAL! program. 

Data sources include girl survyes, parent surveys, teacher surveys and quarterly academic data. 

Girl surveys measure the Girl Scout Outcomes of Healthy Relationships, Academic Mastery, Academic Engagement. 


# Methodology


## Variables


Life Skills Achievement      |Average Score to indicate high achievement.
-------------------------|-----------------------------------------------
Healthy Relationships      |4.45=>
Academic Mastery           |4.8=>
Academic Engagement        |4.5=>


### Grade Outcomes

**Reading and Language Arts Courses Outcome Tables**

1. Grade increase

2. Dropped grade but maintained a "C" grade

3. Fail to pass


**Attedance Outomce**

1. Number and percent of students without an absence

2. Number and percent of students who decreased their absences


**Suspension Outcome**

1. Number and percent of students without a suspension.

1a. Number and percent of students who decreased their suspenions.


# R Scripts



## Surveys--

1. *girlSurveyDataManagement*--The purpose of this Script is prepare the girl survey data set for analysis.Reads the data into R, changes the column names, changes the girlCode to a character class and move to character case to upper case, removes duplicate Girl Codes. 

2. *girlSurveyReport*--The purpose of this script is to find matches from pre survey to post survey and perform statistical analysis. 


3. *parentScriptR*--The purpose of this scipt is prepare the parent survey for analysis and provides analysis. 


4. *teacherScriptR*--The purpose of this script is to prepare the teacher survey for analysis. 

5. *comments*--This script combines the comments from the survey into one data frame. 




## Academic Data

1. *Q1datamanagement*--The purpose of this script is to change the column names, remove duplicate data entry, and to split the subjects into seperate data frames. 

2. *Q2datamanagement*-- The purpose of this script is to change the column names, remove duplicate data entry, and to split the subjects into seperate data frames.

3. *Q3datamanagement*--The purpose of this script is to change the column names, remove duplicate data entry, and to split the subjects into seperate data frames.

4.*Q4datamanagement*--The purpose of this script is to change the column names, remove duplicate data entry, and to split the subjects into seperate data frames.




  a. readingFinal
  
  b. langArtsFinal
  
  c. unexcusedFinal
  
  d. excusedAbsFinal
  
  e. inSchoolFinal
  
  f. outOfSchoolFinal
  
  g. behaviorRefFinal
  
**See Codebook for more detailed descriptions**
 
 
### Miscellanous R Scripts

6. *fixgirlCodeScript*--template to fix the girl code where girlCode was missing council pre-fix.

7. *girlSurveyAllQuestions*--template to summarize all questions

8. *girlSurveyAnalyisScript*--test script for girl survey

9. *gradeAnalysisScript*--test script for grade data

10. *gradeOutcomeTableScript*-test script for grade outcome tables

11. *readingAnalyisScript*--test script for reading grades and upload scripts to Sqllite

12. *langArtsAnalyis*--test script for language arts and upload scripts to Sqlite

13. 













