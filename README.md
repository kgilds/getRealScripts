Get-REAL-
=========

R Scripts and documentation for Get REAL program. 



# Methodology


## Variables




Life Skills Achievement      |Average Score to indicate high achievement.
-------------------------|-----------------------------------------------
Healthy Relationships      |4.45=>
Academic Mastery           |4.8=>
Academic Behavioral Engagement |4.5=>








# R Scripts



## Surveys--

1. *girlSurveyDataManagement*--The purpose of this Script is prepare the girl survey data set for analysis.Reads the data into R, changes the column names, changes the girlCode to a character class and move to character case to upper case, removes duplicate Girl Codes. 


2. *girlSurveyAnalysisScript*--The purpose of this script is to perform analysis on the data set. 

2. *parentScriptR*--The purpose of this scipt is prepare the parent survey for analysis and provides analysis. 


3. *teacherScriptR*--The purpose of this script is to prepare the teacher survey for analysis. 


## Academic Data

1. *Q1datamanagement*--The purpose of this script is to change the column names, remove duplicate data entry, and to split the subjects into seperate data frames. 

2. *Q2datamanagement*-- The purpose of this script is to change the column names, remove duplicate data entry, and to split the subjects into seperate data frames. 

3. *analysisPre*-- Takes output from Q1datamangement and Q2datamanagement and uploads data to temporary sqlite database. 


4. *gradeAnalysisScript*--Pulls data down from temporary sqlite. Cleans data up, creates calculated fields and prepares variables for reporting script. **It is critical to verify how the sql statement was written to be clear that the correct grading periods are correctly identified. 

  a. readingFinal
  
  b. langArtsFinal
  
  c. unexcusedFinal
  
  d. excusedAbsFinal
  
  e. inSchoolFinal
  
  f. outOfSchoolFinal
  
  g. behaviorRefFinal

**See Codebook for more detailed descriptions**


5. 









