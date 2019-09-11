/****** Script for SelectTopNRows command from SSMS  ******/
UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = [Predict03]*2-1,
	   [Side] = 'B',
	   [ExitDays] = 2
where Predict01 > 0
AND [Predict03]*2-1 > [Score]