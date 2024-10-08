USE [Assingment_PRJ301]
GO
/****** Object:  Table [dbo].[assesments]    Script Date: 30/06/2024 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[assesments](
	[aid] [int] NOT NULL,
	[aname] [varchar](150) NOT NULL,
	[weight] [float] NOT NULL,
	[subid] [int] NULL,
 CONSTRAINT [PK_assesments] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 30/06/2024 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[cid] [int] NOT NULL,
	[cname] [varchar](150) NOT NULL,
	[lid] [int] NOT NULL,
	[subid] [int] NOT NULL,
	[semid] [int] NOT NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses_students]    Script Date: 30/06/2024 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses_students](
	[sid] [int] NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_students_courses] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exams]    Script Date: 30/06/2024 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exams](
	[eid] [int] NOT NULL,
	[from] [datetime] NOT NULL,
	[duration] [float] NOT NULL,
	[aid] [int] NOT NULL,
 CONSTRAINT [PK_exams] PRIMARY KEY CLUSTERED 
(
	[eid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grades]    Script Date: 30/06/2024 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grades](
	[eid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[score] [float] NOT NULL,
 CONSTRAINT [PK_grades] PRIMARY KEY CLUSTERED 
(
	[eid] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lecturers]    Script Date: 30/06/2024 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lecturers](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_lecturers] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lecturers_account]    Script Date: 30/06/2024 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lecturers_account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lecturers_users]    Script Date: 30/06/2024 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lecturers_users](
	[username] [varchar](150) NOT NULL,
	[lid] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_users_lecturers] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[semester]    Script Date: 30/06/2024 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[semester](
	[semid] [int] NOT NULL,
	[year] [int] NOT NULL,
	[season] [varchar](10) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_semester] PRIMARY KEY CLUSTERED 
(
	[semid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 30/06/2024 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[sid] [int] NOT NULL,
	[sname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students_account]    Script Date: 30/06/2024 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students_account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_students_account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students_users]    Script Date: 30/06/2024 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students_users](
	[username] [varchar](150) NOT NULL,
	[sid] [int] NOT NULL,
 CONSTRAINT [PK_students_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 30/06/2024 17:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subjects](
	[subid] [int] NOT NULL,
	[subname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_subjects] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (1, N'Workshop 1', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (2, N'Workshop 2', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (3, N'Progress Test 1', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (4, N'Progress Test 2', 0.05, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (5, N'Assignment', 0.4, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (6, N'Practical Exam', 0.2, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (7, N'Final Exam	', 0.2, 1)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (8, N'Active learning	', 0.1, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (9, N'Small Test 1', 0.1, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (10, N'Small Test 2', 0.1, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (11, N'Mid-term', 0.3, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (12, N'FE (Listening)', 0.1, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (13, N'FE (Reading)', 0.3, 2)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (14, N'Progress Test 1', 0.1, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (15, N'Progress Test 2', 0.1, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (16, N'Progress Test 3', 0.1, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (17, N'Assignment 1', 0.1, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (18, N'Assignment 2', 0.1, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (19, N'Computer Project', 0.15, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (20, N'Final Exam	', 0.35, 3)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (21, N'Active learning	', 0.1, 4)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (22, N'Progress Test 1', 0.05, 4)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (23, N'Progress Test 2', 0.05, 4)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (24, N'Presentation', 0.1, 4)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (25, N'Project', 0.3, 4)
INSERT [dbo].[assesments] ([aid], [aname], [weight], [subid]) VALUES (26, N'Final Exam	', 0.4, 4)
GO
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (1, N'SE1872 - PRJ301', 1, 1, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (2, N'AI1706 - MAS291', 1, 3, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (3, N'SE1407 - IOT102', 1, 4, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (4, N'SE1007 - PRJ301', 1, 1, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (5, N'SE1872 - JPD123', 2, 2, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (6, N'MKT1954 - JDP123', 2, 2, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (7, N'IA1234 - JDP123', 2, 2, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (8, N'SE1407 - JDP123', 2, 2, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (9, N'AI1357 - MAS291', 3, 3, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (10, N'AI2468 - IOT102', 3, 4, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (11, N'SE9090 - PRJ301', 3, 1, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (12, N'MKT1111 - IOT102', 3, 4, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (13, N'SE9999 - PRJ301', 4, 1, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (14, N'SE5678 - JPD123', 4, 2, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (15, N'SE1919 - MAS291', 4, 3, 4)
INSERT [dbo].[courses] ([cid], [cname], [lid], [subid], [semid]) VALUES (16, N'SE2024 - IOT102', 4, 4, 4)
GO
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (1, 1)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (1, 2)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (1, 3)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (1, 5)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (2, 1)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (2, 2)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (2, 3)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (2, 5)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (3, 1)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (3, 2)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (3, 6)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (3, 10)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (4, 4)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (4, 6)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (4, 9)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (4, 10)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (5, 4)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (5, 6)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (5, 9)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (5, 12)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (6, 9)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (6, 11)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (6, 12)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (6, 14)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (7, 7)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (7, 11)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (7, 15)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (7, 16)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (8, 7)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (8, 13)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (8, 15)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (8, 16)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (9, 8)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (9, 10)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (9, 13)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (9, 15)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (10, 1)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (10, 3)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (10, 9)
INSERT [dbo].[courses_students] ([sid], [cid]) VALUES (10, 14)
GO
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (1, CAST(N'2024-05-01T09:00:00.000' AS DateTime), 30, 1)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (2, CAST(N'2024-05-03T10:00:00.000' AS DateTime), 30, 2)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (3, CAST(N'2024-05-05T12:00:00.000' AS DateTime), 30, 3)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (4, CAST(N'2024-05-10T09:00:00.000' AS DateTime), 30, 4)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (5, CAST(N'2024-06-17T15:00:00.000' AS DateTime), 90, 5)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (6, CAST(N'2024-07-14T09:00:00.000' AS DateTime), 60, 6)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (7, CAST(N'2024-07-14T09:00:00.000' AS DateTime), 50, 7)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (8, CAST(N'2024-05-14T09:00:00.000' AS DateTime), 15, 8)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (9, CAST(N'2024-05-18T11:00:00.000' AS DateTime), 45, 9)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (10, CAST(N'2024-05-20T10:00:00.000' AS DateTime), 45, 10)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (11, CAST(N'2024-05-30T07:00:00.000' AS DateTime), 50, 11)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (12, CAST(N'2024-06-25T13:30:00.000' AS DateTime), 30, 12)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (13, CAST(N'2024-06-25T16:00:00.000' AS DateTime), 50, 13)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (14, CAST(N'2024-06-25T13:30:00.000' AS DateTime), 30, 14)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (15, CAST(N'2024-06-28T13:30:00.000' AS DateTime), 30, 15)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (16, CAST(N'2024-06-30T10:30:00.000' AS DateTime), 30, 16)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (17, CAST(N'2024-06-15T07:00:00.000' AS DateTime), 30, 17)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (18, CAST(N'2024-06-15T07:00:00.000' AS DateTime), 45, 18)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (19, CAST(N'2024-06-15T09:45:00.000' AS DateTime), 50, 19)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (20, CAST(N'2024-07-15T07:00:00.000' AS DateTime), 60, 20)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (21, CAST(N'2024-07-01T07:00:00.000' AS DateTime), 15, 21)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (22, CAST(N'2024-06-20T07:00:00.000' AS DateTime), 30, 22)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (23, CAST(N'2024-06-24T10:00:00.000' AS DateTime), 30, 23)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (24, CAST(N'2024-06-30T14:00:00.000' AS DateTime), 45, 24)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (25, CAST(N'2024-06-23T07:00:00.000' AS DateTime), 50, 25)
INSERT [dbo].[exams] ([eid], [from], [duration], [aid]) VALUES (26, CAST(N'2024-07-20T12:45:00.000' AS DateTime), 60, 26)
GO
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 1, 4.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 2, 3.5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (1, 3, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 1, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 2, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (2, 3, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 1, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 2, 4)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (3, 3, 4)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 1, 2)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 2, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (4, 3, 4)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 1, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 2, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (5, 3, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 1, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 2, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (6, 3, 7)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 1, 2)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 2, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (7, 3, 3)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (8, 4, 4)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (8, 5, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (8, 6, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (9, 4, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (9, 5, 2)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (9, 6, 7)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (10, 4, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (10, 5, 5)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (11, 6, 6)
INSERT [dbo].[grades] ([eid], [sid], [score]) VALUES (12, 2, 8)
GO
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (1, N'SonNT')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (2, N'TuanVM')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (3, N'HaiLT')
INSERT [dbo].[lecturers] ([lid], [lname]) VALUES (4, N'BanTQ')
GO
INSERT [dbo].[lecturers_account] ([username], [password], [displayname]) VALUES (N'BanTQ', N'123', N'Tran Quoc Ban')
INSERT [dbo].[lecturers_account] ([username], [password], [displayname]) VALUES (N'HaiLT', N'123', N'Le Trung Hai')
INSERT [dbo].[lecturers_account] ([username], [password], [displayname]) VALUES (N'SonNT', N'123', N'Ngo Tung Son')
INSERT [dbo].[lecturers_account] ([username], [password], [displayname]) VALUES (N'TuanVM', N'123', N'Vu Manh Tuan')
GO
INSERT [dbo].[lecturers_users] ([username], [lid], [active]) VALUES (N'BanTQ', 4, 1)
INSERT [dbo].[lecturers_users] ([username], [lid], [active]) VALUES (N'HaiLT', 3, 1)
INSERT [dbo].[lecturers_users] ([username], [lid], [active]) VALUES (N'SonNT', 1, 1)
INSERT [dbo].[lecturers_users] ([username], [lid], [active]) VALUES (N'SonNT', 2, 0)
INSERT [dbo].[lecturers_users] ([username], [lid], [active]) VALUES (N'TuanVM', 2, 1)
GO
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (1, 2023, N'SUMMER', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (2, 2023, N'FALL', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (3, 2024, N'SPRING', 0)
INSERT [dbo].[semester] ([semid], [year], [season], [active]) VALUES (4, 2024, N'SUMMER', 1)
GO
INSERT [dbo].[students] ([sid], [sname]) VALUES (1, N'Le Doan Thang')
INSERT [dbo].[students] ([sid], [sname]) VALUES (2, N'Ngo Gia Trieu')
INSERT [dbo].[students] ([sid], [sname]) VALUES (3, N'Nguyen Huu Hung')
INSERT [dbo].[students] ([sid], [sname]) VALUES (4, N'Nguyen Dinh Thanh')
INSERT [dbo].[students] ([sid], [sname]) VALUES (5, N'Hoang Mai Huong')
INSERT [dbo].[students] ([sid], [sname]) VALUES (6, N'Cao Thuy Duong')
INSERT [dbo].[students] ([sid], [sname]) VALUES (7, N'Nguyen Thi Anh')
INSERT [dbo].[students] ([sid], [sname]) VALUES (8, N'Nguyen Thi Linh')
INSERT [dbo].[students] ([sid], [sname]) VALUES (9, N'Tran Van Hoang')
INSERT [dbo].[students] ([sid], [sname]) VALUES (10, N'Nguyen Hoang Long')
GO
INSERT [dbo].[students_account] ([username], [password], [displayname]) VALUES (N'AnhNT', N'234', N'Nguyen Thi Anh')
INSERT [dbo].[students_account] ([username], [password], [displayname]) VALUES (N'DuongCT', N'234', N'Cao Thuy Duong')
INSERT [dbo].[students_account] ([username], [password], [displayname]) VALUES (N'HoangTV', N'234', N'Tran Van Hoang')
INSERT [dbo].[students_account] ([username], [password], [displayname]) VALUES (N'HungNH', N'234', N'Nguyen Huu Hung')
INSERT [dbo].[students_account] ([username], [password], [displayname]) VALUES (N'HuongHM', N'234', N'Hoang Mai Huong')
INSERT [dbo].[students_account] ([username], [password], [displayname]) VALUES (N'LinhNT', N'234', N'Nguyen Thi Linh')
INSERT [dbo].[students_account] ([username], [password], [displayname]) VALUES (N'LongNH', N'234', N'Nguyen Hoang Long')
INSERT [dbo].[students_account] ([username], [password], [displayname]) VALUES (N'ThangLD', N'234', N'Le Doan Thang')
INSERT [dbo].[students_account] ([username], [password], [displayname]) VALUES (N'ThanhND', N'234', N'Nguyen Dinh Thanh')
INSERT [dbo].[students_account] ([username], [password], [displayname]) VALUES (N'TrieuNG', N'234', N'Ngo Gia Trieu')
GO
INSERT [dbo].[students_users] ([username], [sid]) VALUES (N'AnhNT', 7)
INSERT [dbo].[students_users] ([username], [sid]) VALUES (N'DuongCT', 6)
INSERT [dbo].[students_users] ([username], [sid]) VALUES (N'HoangTV', 9)
INSERT [dbo].[students_users] ([username], [sid]) VALUES (N'HungNH', 3)
INSERT [dbo].[students_users] ([username], [sid]) VALUES (N'HuongHM', 5)
INSERT [dbo].[students_users] ([username], [sid]) VALUES (N'LinhNT', 8)
INSERT [dbo].[students_users] ([username], [sid]) VALUES (N'LongNH', 10)
INSERT [dbo].[students_users] ([username], [sid]) VALUES (N'ThangLD', 1)
INSERT [dbo].[students_users] ([username], [sid]) VALUES (N'ThanhND', 4)
INSERT [dbo].[students_users] ([username], [sid]) VALUES (N'TrieuNG', 2)
GO
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (1, N'PRJ301')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (2, N'JPD123')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (3, N'MAS291')
INSERT [dbo].[subjects] ([subid], [subname]) VALUES (4, N'IOT102')
GO
ALTER TABLE [dbo].[assesments]  WITH CHECK ADD  CONSTRAINT [FK_assesments_subjects] FOREIGN KEY([subid])
REFERENCES [dbo].[subjects] ([subid])
GO
ALTER TABLE [dbo].[assesments] CHECK CONSTRAINT [FK_assesments_subjects]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_lecturers] FOREIGN KEY([lid])
REFERENCES [dbo].[lecturers] ([lid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_lecturers]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_semester] FOREIGN KEY([semid])
REFERENCES [dbo].[semester] ([semid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_semester]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_subjects] FOREIGN KEY([subid])
REFERENCES [dbo].[subjects] ([subid])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_subjects]
GO
ALTER TABLE [dbo].[courses_students]  WITH CHECK ADD  CONSTRAINT [FK_students_courses_courses] FOREIGN KEY([cid])
REFERENCES [dbo].[courses] ([cid])
GO
ALTER TABLE [dbo].[courses_students] CHECK CONSTRAINT [FK_students_courses_courses]
GO
ALTER TABLE [dbo].[courses_students]  WITH CHECK ADD  CONSTRAINT [FK_students_courses_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[courses_students] CHECK CONSTRAINT [FK_students_courses_students]
GO
ALTER TABLE [dbo].[exams]  WITH CHECK ADD  CONSTRAINT [FK_exams_assesments] FOREIGN KEY([aid])
REFERENCES [dbo].[assesments] ([aid])
GO
ALTER TABLE [dbo].[exams] CHECK CONSTRAINT [FK_exams_assesments]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [FK_grades_exams] FOREIGN KEY([eid])
REFERENCES [dbo].[exams] ([eid])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [FK_grades_exams]
GO
ALTER TABLE [dbo].[grades]  WITH CHECK ADD  CONSTRAINT [FK_grades_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[grades] CHECK CONSTRAINT [FK_grades_students]
GO
ALTER TABLE [dbo].[lecturers_users]  WITH CHECK ADD  CONSTRAINT [FK_users_lecturers_lecturers] FOREIGN KEY([lid])
REFERENCES [dbo].[lecturers] ([lid])
GO
ALTER TABLE [dbo].[lecturers_users] CHECK CONSTRAINT [FK_users_lecturers_lecturers]
GO
ALTER TABLE [dbo].[lecturers_users]  WITH CHECK ADD  CONSTRAINT [FK_users_lecturers_users] FOREIGN KEY([username])
REFERENCES [dbo].[lecturers_account] ([username])
GO
ALTER TABLE [dbo].[lecturers_users] CHECK CONSTRAINT [FK_users_lecturers_users]
GO
ALTER TABLE [dbo].[students_users]  WITH CHECK ADD  CONSTRAINT [FK_students_users_students] FOREIGN KEY([sid])
REFERENCES [dbo].[students] ([sid])
GO
ALTER TABLE [dbo].[students_users] CHECK CONSTRAINT [FK_students_users_students]
GO
ALTER TABLE [dbo].[students_users]  WITH CHECK ADD  CONSTRAINT [FK_students_users_students_account] FOREIGN KEY([username])
REFERENCES [dbo].[students_account] ([username])
GO
ALTER TABLE [dbo].[students_users] CHECK CONSTRAINT [FK_students_users_students_account]
GO
