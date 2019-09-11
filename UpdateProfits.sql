USE [Robot]
GO

UPDATE A
   SET A.[ExitProfit] = A.[ExitPrice]/A.[Close]-1
   FROM [dbo].[Investingcom] AS A
   WHERE A.[ExitDays] > 0
   AND A.[Close] > 0
   AND A.Side = 'B'
   
UPDATE A
   SET A.[ExitProfit] = A.[Close]/A.[ExitPrice]-1
   FROM [dbo].[Investingcom] AS A
   WHERE A.[ExitDays] > 0
   AND A.[Close] > 0
   AND A.Side = 'S'
GO


