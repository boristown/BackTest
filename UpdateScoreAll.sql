/****** Script for SelectTopNRows command from SSMS  ******/

PRINT 'Init Score';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = 0,
	   [Side] = '',
	   [ExitDays] = 0

PRINT 'Updating buy 1 day';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = [Predict01]*2-1,
	   [Side] = 'B',
	   [ExitDays] = 1
where [Predict01] > 0
AND [Predict01]*2-1 > [Score]

PRINT 'Updating sell 1 day';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = 1-[Predict01]*2,
	   [Side] = 'S',
	   [ExitDays] = 1
where [Predict01] > 0
AND 1-[Predict01]*2 > [Score]

PRINT 'Updating buy 2 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = [Predict02]*2-1,
	   [Side] = 'B',
	   [ExitDays] = 2
where [Predict02] > 0
AND [Predict02]*2-1 > [Score]

PRINT 'Updating sell 2 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = 1-[Predict02]*2,
	   [Side] = 'S',
	   [ExitDays] = 2
where [Predict02] > 0
AND 1-[Predict02]*2 > [Score]

PRINT 'Updating buy 3 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = [Predict03]*2-1,
	   [Side] = 'B',
	   [ExitDays] = 3
where [Predict03] > 0
AND [Predict03]*2-1 > [Score]

PRINT 'Updating sell 3 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = 1-[Predict03]*2,
	   [Side] = 'S',
	   [ExitDays] = 3
where [Predict03] > 0
AND 1-[Predict03]*2 > [Score]

PRINT 'Updating buy 4 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = [Predict04]*2-1,
	   [Side] = 'B',
	   [ExitDays] = 4
where [Predict04] > 0
AND [Predict04]*2-1 > [Score]

PRINT 'Updating sell 4 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = 1-[Predict04]*2,
	   [Side] = 'S',
	   [ExitDays] = 4
where [Predict04] > 0
AND 1-[Predict04]*2 > [Score]

PRINT 'Updating buy 5 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = [Predict05]*2-1,
	   [Side] = 'B',
	   [ExitDays] = 5
where [Predict05] > 0
AND [Predict05]*2-1 > [Score]

PRINT 'Updating sell 5 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = 1-[Predict05]*2,
	   [Side] = 'S',
	   [ExitDays] = 5
where [Predict05] > 0
AND 1-[Predict05]*2 > [Score]

PRINT 'Updating buy 6 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = [Predict06]*2-1,
	   [Side] = 'B',
	   [ExitDays] = 6
where [Predict06] > 0
AND [Predict06]*2-1 > [Score]

PRINT 'Updating sell 6 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = 1-[Predict06]*2,
	   [Side] = 'S',
	   [ExitDays] = 6
where [Predict06] > 0
AND 1-[Predict06]*2 > [Score]

PRINT 'Updating buy 7 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = [Predict07]*2-1,
	   [Side] = 'B',
	   [ExitDays] = 7
where [Predict07] > 0
AND [Predict07]*2-1 > [Score]

PRINT 'Updating sell 7 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = 1-[Predict07]*2,
	   [Side] = 'S',
	   [ExitDays] = 7
where [Predict07] > 0
AND 1-[Predict07]*2 > [Score]

PRINT 'Updating buy 8 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = [Predict08]*2-1,
	   [Side] = 'B',
	   [ExitDays] = 8
where [Predict08] > 0
AND [Predict08]*2-1 > [Score]

PRINT 'Updating sell 8 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = 1-[Predict08]*2,
	   [Side] = 'S',
	   [ExitDays] = 8
where [Predict08] > 0
AND 1-[Predict08]*2 > [Score]

PRINT 'Updating buy 9 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = [Predict09]*2-1,
	   [Side] = 'B',
	   [ExitDays] = 9
where [Predict09] > 0
AND [Predict09]*2-1 > [Score]

PRINT 'Updating sell 9 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = 1-[Predict09]*2,
	   [Side] = 'S',
	   [ExitDays] = 9
where [Predict09] > 0
AND 1-[Predict09]*2 > [Score]

PRINT 'Updating buy 10 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = [Predict10]*2-1,
	   [Side] = 'B',
	   [ExitDays] = 10
where [Predict10] > 0
AND [Predict10]*2-1 > [Score]

PRINT 'Updating sell 10 days';

UPDATE [Robot].[dbo].[Investingcom]
   SET [Score] = 1-[Predict10]*2,
	   [Side] = 'S',
	   [ExitDays] = 10
where [Predict10] > 0
AND 1-[Predict10]*2 > [Score]

PRINT 'Updating score finished';