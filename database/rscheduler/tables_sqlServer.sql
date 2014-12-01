USE [enter_db_name_here]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RSCHED_AUDIT_HISTORY]') AND OBJECTPROPERTY(id, N'ISUSERTABLE') = 1)
DROP TABLE [dbo].[RSCHED_AUDIT_HISTORY]
GO

CREATE TABLE [dbo].[RSCHED_AUDIT_HISTORY](
	[TIME_STAMP] [datetime2](7) NOT NULL,
	[ACTION] [nchar](200) NOT NULL,
	[FIRE_INSTANCE_ID] [nchar](200) NULL,
	[JOB_NAME] [nchar](200) NULL,
	[JOB_GROUP] [nchar](200) NULL,
	[JOB_TYPE] [nchar](200) NULL,
	[TRIGGER_NAME] [nchar](200) NULL,
	[TRIGGER_GROUP] [nchar](200) NULL,
	[FIRE_TIME_UTC] [datetimeoffset](7) NULL,
	[SCHEDULED_FIRE_TIME_UTC] [datetimeoffset](7) NULL,
	[JOB_RUN_TIME] [bigint] NULL,
	[PARAMS] [nvarchar](max) NULL,
	[REFIRE_COUNT] [int] NULL,
	[RECOVERING] [bit] NULL,
	[RESULT] [nvarchar](max) NULL,
	[EXECUTION_EXCEPTION] [nvarchar](max) NULL
)
GO
