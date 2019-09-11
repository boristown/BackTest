USE [Robot]
GO

UPDATE A
   SET A.[ExitPrice] = B.[Close]
   FROM [dbo].[Investingcom] AS A
   INNER JOIN [dbo].[Investingcom] AS B
   ON A.ID-A.[ExitDays] = B.ID
   AND A.Symbol = B.Symbol
   WHERE A.[ExitDays] > 0
   AND A.ID > A.[ExitDays]

GO


