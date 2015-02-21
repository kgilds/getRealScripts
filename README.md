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

1. *Q1gradeScript*--The purpose of this script is to change the column names, remove duplicate data entry, and to split the subjects into seperate data frames. 



### Girl Survey Variables

1. Response ID:  
Alpha Numeric Code that uniquely identifies a response

2. ResponseSet

3. StartDate:
Date the data entry started for a particular response.

4.EndDate:
Date the data entry was completed for a particular response.

5.Finished:
Identifies whethter the data entry was completed.

6.hr.sum:

The sum of the score obtained from the  healthy relationship questions 

7.hr.avg

The average of the score obtained from healhy relationships questions.

8. hr.stddev.

The standard deviation of the score obtained from healthy relationships questions.

9. hr.disualify.sum

10. Disqualify.Outcome.6.weightedAvg

11. Disqualify.Outcome.6.weightedStdDev

12. ae.sum

13. ae.avg

14. ae.stddev

15. am.sum

16. am.avg

17. am.stddev

18. am.disqualify.sum

19. Academic.Engagement.Disqualify.weightedAvg

20. Academic.Engagement.Disqualify.weihtedStdDev

21. ae.disquaalify.sum

22. Disqualify.Academic.Mastery.weightedAvg

23. Disqualify.Academic.Mastery.weightedStdDev

24. Outcome5_jsweightedMean

25. Outcome6_jsWeightedMean

26. Council

The Girl Scout Council that is delivering the service and entering the data.

27. girlCode

The unique identification number assigned to students in the Get REAL! program

28. school

The site or school where the program is delivered.

29. Grade

The grade of the student

30. Time

Time denotes the point of the program when the student complete the survey. Pre and Post

31. In program Last Year

Did the student particpate in the program last year is o the survey. 

32. iamMotivatedToGraduateHighSchool

Question measures motivation to complete high school 

33. iReadBooksforFun

Question measures student's attitude towards reading.

34. ireallyLikeWhoIam

Question measures self worth

35. .....ImproveMySkillsThisYear

Question measures motivation to improve skills

36. ....UnderstandMyClassWork

Question 


