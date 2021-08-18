USE [Emmanuel]
GO
/****** Object:  Trigger [dbo].[sampletrigger]    Script Date: 8/16/2021 12:29:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER TRIGGER  [dbo].[sampletrigger] 
ON 
[dbo].[MARK_SHEET]  
  for INSERT 
  AS BEGIN
UPDATE MARK_SHEET SET MARK_SHEET.TOTAL_PERCENTAGE = ((MARK_SHEET.MARK_OBTAINED/MARK_SHEET.TOTAL_MARK)*100)
END;

insert into MARK_SHEET values (3,3533,'james','Maths',70,100,null)

SELECT * FROM MARK_SHEET