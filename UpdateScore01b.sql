/****** Script for SelectTopNRows command from SSMS  ******/
UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = [Predict01]*2-1,
	   [Side] = 'B',
	   [ExitDays] = 1
where Predict01 > 0
AND [Predict01]*2-1 >= 0