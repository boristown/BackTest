/****** Script for SelectTopNRows command from SSMS  ******/
UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = 1 - [Predict01]*2,
	   [Side] = 'S',
	   [ExitDays] = 1
where Predict01 > 0
AND [Predict01]*2-1 < 0