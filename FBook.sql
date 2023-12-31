USE [master]
GO
/****** Object:  Database [Fbook]    Script Date: 8/31/2023 1:02:22 PM ******/
CREATE DATABASE [Fbook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fbook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS03\MSSQL\DATA\Fbook.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fbook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS03\MSSQL\DATA\Fbook_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Fbook] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fbook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fbook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fbook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fbook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fbook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fbook] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fbook] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Fbook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fbook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fbook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fbook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fbook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fbook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fbook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fbook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fbook] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fbook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fbook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fbook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fbook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fbook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fbook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fbook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fbook] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Fbook] SET  MULTI_USER 
GO
ALTER DATABASE [Fbook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fbook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fbook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fbook] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fbook] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Fbook] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Fbook] SET QUERY_STORE = OFF
GO
USE [Fbook]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Fullname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Photo] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Roleid] [varchar](10) NULL,
 CONSTRAINT [PK_Authorities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Billdetails]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billdetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Billid] [bigint] NULL,
	[Bookid] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[Billdate] [date] NULL,
 CONSTRAINT [PK_Billdetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Userid] [nvarchar](50) NULL,
	[Createdate] [date] NULL,
	[Billtotal] [float] NULL,
	[Ship] [float] NULL,
	[Address] [nvarchar](max) NULL,
	[Voucherid] [nvarchar](12) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Image] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Createdate] [date] NULL,
	[Status] [int] NULL,
	[Categoryid] [nvarchar](50) NULL,
	[Discriptions] [nvarchar](max) NULL,
	[Authorsid] [nvarchar](50) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cartdetails]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cartdetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Cartid] [int] NULL,
	[Bookid] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Cartdetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Userid] [nvarchar](50) NULL,
	[Createdate] [date] NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookid] [int] NULL,
	[discount] [float] NULL,
	[startdate] [date] NULL,
	[enddate] [date] NULL,
 CONSTRAINT [PK_Discounts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluates]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluates](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Userid] [nvarchar](50) NULL,
	[Bookid] [int] NULL,
	[Comment] [nvarchar](225) NULL,
	[Star] [int] NULL,
	[CommentDate] [date] NULL,
 CONSTRAINT [PK_Evaluates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Userid] [nvarchar](50) NULL,
	[Bookid] [int] NULL,
	[Likedate] [date] NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bookid] [int] NULL,
	[Link] [nvarchar](max) NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proofreads]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proofreads](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bookid] [int] NULL,
	[images] [nvarchar](max) NULL,
 CONSTRAINT [PK_Proofread] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[uservoucher]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uservoucher](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[voucherid] [nvarchar](12) NULL,
 CONSTRAINT [PK_uservoucher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vouchers]    Script Date: 8/31/2023 1:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vouchers](
	[Voucherid] [nvarchar](12) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[image] [nvarchar](50) NULL,
	[Startdate] [date] NULL,
	[Enddate] [date] NULL,
 CONSTRAINT [PK_Vouchers] PRIMARY KEY CLUSTERED 
(
	[Voucherid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Address]) VALUES (N'abc', N'abc', N'Nguyễn Văn A', N'Anv@gmail.com', N'31eeefa.png', N'0974765839', N'Can Tho')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Address]) VALUES (N'hduc', N'123', N'Tạ Huỳnh Đức', N'duc@gmail.com', N'd2192b48.jpg', N'0366846921', N'Tra Vinh')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Address]) VALUES (N'khanh', N'123', N'Nguyễn Vĩnh Khánh', N'khanh123@gmail.com', NULL, N'0348593882', N'Cà Mau')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Address]) VALUES (N'khoa123', N'123', N'Nguyễn Đăng Khoa', N'khoa123@gmail.com', N'9c85eb76.png', N'0349858322', N'Bac Liêu')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Address]) VALUES (N'linh', N'123', N'Tran Vu Linh', N'tieutuhottan1221@gmail.com', N'', N'0388490985', N'An Giang 111111')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Address]) VALUES (N'qua123', N'123', N'Huỳnh Dương Quá', N'qua123@gmail.com', N'', N'0354775737', N'Kiên Giang')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Address]) VALUES (N'tien', N'123', N'Nguyễn Hoàng Tiến', N'tiennhpc03691@fpt.edu.vn', N'b332656d.jpg', N'0358475573', N'Vĩnh Long')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Address]) VALUES (N'tienkun1147@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Address]) VALUES (N'tiennv', N'123', N'Nguyễn Hoàng Tiến', N'tienkun1147@gmail.com', NULL, N'0763447035', N'Vĩnh long')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Phone], [Address]) VALUES (N'tienth', N'123', N'Nguyễn Hoàng Tiến', N'len73854@gmail.com', NULL, N'0763447035', N'Vĩnh long')
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [Roleid]) VALUES (1, N'hduc', N'USER')
INSERT [dbo].[Authorities] ([Id], [Username], [Roleid]) VALUES (2, N'linh', N'ADMIN')
INSERT [dbo].[Authorities] ([Id], [Username], [Roleid]) VALUES (3, N'qua123', N'ADMIN')
INSERT [dbo].[Authorities] ([Id], [Username], [Roleid]) VALUES (6, N'khanh', N'USER')
INSERT [dbo].[Authorities] ([Id], [Username], [Roleid]) VALUES (7, N'khoa123', N'USER')
INSERT [dbo].[Authorities] ([Id], [Username], [Roleid]) VALUES (12, N'tien', N'ADMIN')
INSERT [dbo].[Authorities] ([Id], [Username], [Roleid]) VALUES (13, N'tien', N'USER')
INSERT [dbo].[Authorities] ([Id], [Username], [Roleid]) VALUES (14, N'abc', N'ADMIN')
INSERT [dbo].[Authorities] ([Id], [Username], [Roleid]) VALUES (16, N'abc', N'USER')
INSERT [dbo].[Authorities] ([Id], [Username], [Roleid]) VALUES (17, N'tienth', N'USER')
INSERT [dbo].[Authorities] ([Id], [Username], [Roleid]) VALUES (18, N'hduc', N'ADMIN')
INSERT [dbo].[Authorities] ([Id], [Username], [Roleid]) VALUES (19, N'khanh', N'ADMIN')
INSERT [dbo].[Authorities] ([Id], [Username], [Roleid]) VALUES (20, N'linh', N'USER')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'1', N'José Mauro de Vasconcelos ')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'10', N'GEORGE SAMUEL CLASON')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'11', N'Luis Sepulveda')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'12', N'Antoine De Saint-Exupéry')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'13', N'Jun Phạm (365 Band)')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'14', N'Tô Hoài')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'15', N'Nguyên Phong')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'16', N'Brian L Weiss')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'17', N' Baird T. Spalding, Nguyên Phong')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'18', N'Thích Nhất Hạnh')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'19', N'Nhóm tác giả')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'2', N'Higashino Keigo')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'20', N' Ngô Sa Thạch')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'21', N'Nam Cao')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'22', N'Đặng Nguyễn Đông Vy')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'3', N'Paulo Coelho')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'4', N'Matt Haig')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'5', N'Khaled Hosseini')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'6', N'Hae Min')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'7', N'Morgan Housel')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'8', N'Napoleon Hill')
INSERT [dbo].[Authors] ([Id], [Name]) VALUES (N'9', N'Tim Marshall')
GO
SET IDENTITY_INSERT [dbo].[Billdetails] ON 

INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (63, 56, 1, 145400, 2, CAST(N'2023-08-23' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (65, 57, 1, 145400, 2, CAST(N'2023-08-23' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (66, 58, 1, 145400, 1, CAST(N'2023-08-23' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (85, 70, 1, 145400, 1, CAST(N'2023-08-23' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (86, 70, 9, 108000, 1, CAST(N'2023-08-23' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (98, 77, 1, 145400, 1, CAST(N'2023-08-23' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (99, 77, 9, 108000, 1, CAST(N'2023-08-23' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (100, 78, 9, 108000, 1, CAST(N'2023-08-23' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (102, 79, 1, 145400, 1, CAST(N'2023-08-23' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (103, 79, 1, 145400, 1, CAST(N'2023-08-23' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (104, 80, 1, 145400, 3, CAST(N'2023-08-24' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (105, 80, 10, 77100, 1, CAST(N'2023-08-24' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (116, 86, 21, 73500, 1, CAST(N'2023-08-24' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (117, 86, 20, 49000, 1, CAST(N'2023-08-24' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (118, 87, 21, 73500, 1, CAST(N'2023-08-24' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (119, 87, 20, 49000, 1, CAST(N'2023-08-24' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (122, 89, 19, 199000, 1, CAST(N'2023-08-24' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (123, 90, 20, 49000, 1, CAST(N'2023-08-24' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (124, 90, 21, 73500, 2, CAST(N'2023-08-24' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (125, 91, 21, 73500, 2, CAST(N'2023-08-24' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (126, 91, 20, 49000, 1, CAST(N'2023-08-24' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (127, 91, 19, 199000, 1, CAST(N'2023-08-24' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (128, 92, 1, 145400, 2, CAST(N'2023-08-25' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (130, 93, 48, 188000, 1, CAST(N'2023-08-25' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (131, 93, 47, 189000, 2, CAST(N'2023-08-25' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (132, 94, 12, 115000, 2, CAST(N'2023-08-25' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (133, 94, 49, 110000, 1, CAST(N'2023-08-25' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (134, 95, 1, 145400, 2, CAST(N'2023-08-26' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (135, 95, 54, 150000, 1, CAST(N'2023-08-26' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (136, 95, 53, 150000, 1, CAST(N'2023-08-26' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (137, 95, 49, 110000, 1, CAST(N'2023-08-26' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (138, 95, 52, 99000, 2, CAST(N'2023-08-26' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (139, 96, 49, 110000, 2, CAST(N'2023-08-26' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (140, 98, 9, 128250, 1, CAST(N'2023-08-28' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (141, 98, 13, 71280, 1, CAST(N'2023-08-28' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (142, 101, 1, 157000, 1, CAST(N'2023-08-28' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (143, 101, 10, 77100, 1, CAST(N'2023-08-28' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (144, 103, 1, 157000, 1, CAST(N'2023-08-28' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (145, 103, 10, 77100, 1, CAST(N'2023-08-28' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (146, 104, 53, 150000, 1, CAST(N'2023-08-28' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (147, 104, 52, 99000, 1, CAST(N'2023-08-28' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (148, 104, 51, 62000, 1, CAST(N'2023-08-28' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (149, 105, 53, 150000, 1, CAST(N'2023-08-28' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (150, 105, 52, 99000, 1, CAST(N'2023-08-28' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (151, 106, 53, 150000, 1, CAST(N'2023-08-28' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (154, 108, 12, 114240, 1, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (155, 108, 19, 199000, 1, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (156, 109, 1, 157000, 1, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (157, 109, 15, 122850, 1, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (158, 110, 22, 220000, 1, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (159, 110, 10, 77100, 1, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (160, 111, 12, 115000, 1, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (161, 112, 12, 115000, 1, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (162, 115, 12, 115000, 1, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (163, 117, 12, 115000, 1, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (164, 118, 12, 115000, 1, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (165, 119, 12, 115000, 1, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (166, 120, 22, 220000, 1, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (167, 120, 25, 71280, 1, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (168, 121, 12, 115000, 1, CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (169, 123, 10, 77100, 1, CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (170, 123, 1, 157000, 1, CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (171, 124, 19, 175120, 2, CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (172, 124, 9, 108000, 1, CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (173, 125, 1, 157000, 1, CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (174, 125, 54, 150000, 1, CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (175, 126, 1, 157000, 1, CAST(N'2023-08-31' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (176, 126, 29, 135000, 1, CAST(N'2023-08-31' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (177, 126, 31, 75000, 1, CAST(N'2023-08-31' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (178, 127, 1, 145400, 1, CAST(N'2023-08-31' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (179, 127, 10, 77100, 1, CAST(N'2023-08-31' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (180, 127, 22, 220000, 1, CAST(N'2023-08-31' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (181, 127, 21, 73500, 1, CAST(N'2023-08-31' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (182, 128, 26, 141120, 1, CAST(N'2023-08-31' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (183, 129, 1, 157000, 2, CAST(N'2023-08-31' AS Date))
INSERT [dbo].[Billdetails] ([Id], [Billid], [Bookid], [Price], [Quantity], [Billdate]) VALUES (184, 129, 53, 150000, 1, CAST(N'2023-08-31' AS Date))
SET IDENTITY_INSERT [dbo].[Billdetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (56, N'hduc', CAST(N'2023-07-23' AS Date), 427366, 36500, N'Xã Ninh Thạnh Lợi A, Huyện Hồng Dân ,Bạc Liêu', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (57, N'hduc', CAST(N'2023-06-23' AS Date), 422367, 31501, N'Xã Long Trị, Thị xã Long Mỹ ,Hậu Giang', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (58, N'hduc', CAST(N'2023-08-23' AS Date), 327300, 36500, N'Xã Phong Thạnh A, Thị Xã Giá Rai ,Bạc Liêu', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (59, N'hduc', CAST(N'2023-08-23' AS Date), 181900, 36500, N'Xã Vĩnh Phú Tây, Huyện Phước Long ,Bạc Liêu', NULL, 4)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (64, N'hduc', CAST(N'2023-08-23' AS Date), 136566, 36500, N'Xã Khánh Lâm, Huyện U Minh ,Cà Mau', NULL, 4)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (66, N'hduc', CAST(N'2023-08-23' AS Date), 34036, 34000, N'Xã Hương Mai, Huyện Việt Yên ,Bắc Giang', NULL, 4)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (70, N'hduc', CAST(N'2023-08-23' AS Date), 322301, 31501, N'Xã Lợi Hải, Huyện Thuận Bắc ,Ninh Thuận', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (77, N'hduc', CAST(N'2023-08-23' AS Date), 289900, 36500, N'Xã Hòa Thành, Thị xã Đông Hòa ,Phú Yên', NULL, 4)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (78, N'hduc', CAST(N'2023-09-23' AS Date), 31501, 31501, N'Xã Long Trị, Thị xã Long Mỹ ,Hậu Giang', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (79, N'tien', CAST(N'2023-08-23' AS Date), 244566, 36500, N'Xã Xuân Phước, Huyện Đồng Xuân ,Phú Yên', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (80, N'tien', CAST(N'2023-08-24' AS Date), 472700, 36500, N'Xã Sa Sơn, Huyện Sa Thầy ,Kon Tum', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (86, N'hduc', CAST(N'2023-08-24' AS Date), 279501, 31501, N'Xã Phước Kháng, Huyện Thuận Bắc ,Ninh Thuận', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (87, N'hduc', CAST(N'2023-08-24' AS Date), 190501, 36500, N'Xã Tân An Thạnh, Huyện Bình Tân ,Vĩnh Long', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (89, N'hduc', CAST(N'2023-08-24' AS Date), 166500, 44000, N'Xã Thọ Lộc, Huyện Phúc Thọ ,Hà Nội', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (90, N'hduc', CAST(N'2023-08-24' AS Date), 232500, 36500, N'Xã Ya ly, Huyện Sa Thầy ,Kon Tum', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (91, N'hduc', CAST(N'2023-08-24' AS Date), 431500, 36500, N'Xã Đông Phước, Huyện Châu Thành ,Hậu Giang', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (92, N'linh', CAST(N'2023-08-25' AS Date), 431866, 41000, N'Xã Hồ Thầu, Huyện Tam Đường ,Lai Châu', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (93, N'hduc', CAST(N'2023-08-25' AS Date), 602500, 36500, N'Xã Đông Phước, Huyện Châu Thành ,Hậu Giang', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (94, N'hduc', CAST(N'2023-08-25' AS Date), 384000, 44000, N'Xã Đông Xuân, Huyện Quốc Oai ,Hà Nội', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (95, N'hduc', CAST(N'2023-08-26' AS Date), 939800, 41000, N'Xã Thanh Long, Huyện Thông Nông ,Cao Bằng', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (96, N'hduc', CAST(N'2023-08-26' AS Date), 254000, 34000, N'Xã Nậm Loỏng, Thành phố Lai Châu ,Lai Châu', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (97, N'hduc', CAST(N'2023-08-26' AS Date), 562500, 36500, N'Xã Khánh Hòa, Huyện U Minh ,Cà Mau', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (98, N'hduc', CAST(N'2023-08-28' AS Date), 236030, 36500, N'Xã Sơn Hà, Huyện Sơn Hòa ,Phú Yên', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (99, N'hduc', CAST(N'2023-08-28' AS Date), 349740, 36500, N'Xã Mỹ Cát, Huyện Phù Mỹ ,Bình Định', NULL, 4)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (101, N'linh', CAST(N'2023-08-28' AS Date), 270600, 36500, N'Xã Khánh Lâm, Huyện U Minh ,Cà Mau', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (103, N'linh', CAST(N'2023-08-28' AS Date), 265601, 31501, N'Phường Tân Thuận Đông, Quận 7 ,Hồ Chí Minh', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (104, N'linh', CAST(N'2023-08-28' AS Date), 355000, 44000, N'Xã Hải Bối, Huyện Đông Anh ,Hà Nội', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (105, N'linh', CAST(N'2023-08-28' AS Date), 290000, 41000, N'Xã Pú Nhi, Huyện Điện Biên Đông ,Điện Biên', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (106, N'linh', CAST(N'2023-08-28' AS Date), 191000, 41000, N'Xã Pú Nhi, Huyện Điện Biên Đông ,Điện Biên', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (108, N'hduc', CAST(N'2023-08-29' AS Date), 354240, 41000, N'Xã Nậm Mười, Huyện Văn Chấn ,Yên Bái', NULL, 3)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (109, N'hduc', CAST(N'2023-08-29' AS Date), 320850, 41000, N'Xã Nghĩa Sơn, Huyện Văn Chấn ,Yên Bái', N'MIENPHI15K', 2)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (110, N'hduc', CAST(N'2023-08-29' AS Date), 328100, 41000, N'Xã Đôn Phong, Huyện Bạch Thông ,Bắc Kạn', N'GIAMGIA10K', 2)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (111, N'hduc', CAST(N'2023-08-29' AS Date), 141000, 41000, N'Xã Hoàng Thắng, Huyện Văn Yên ,Yên Bái', N'MIENPHI15K', 2)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (112, N'tiennv', CAST(N'2023-08-29' AS Date), 136500, 36500, N'Xã Tân Lược, Huyện Bình Tân ,Vĩnh Long', N'MIENPHI15K', 2)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (113, N'tiennv', CAST(N'2023-08-29' AS Date), 136500, 36500, N'Xã Tân Lược, Huyện Bình Tân ,Vĩnh Long', N'MIENPHI15K', 1)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (115, N'tiennv', CAST(N'2023-08-29' AS Date), 146000, 41000, N'Xã Mỏ Vàng, Huyện Văn Yên ,Yên Bái', N'GIAMGIA10K', 1)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (117, N'tiennv', CAST(N'2023-08-29' AS Date), 156000, 41000, N'Xã Sùng Phài, Huyện Tam Đường ,Lai Châu', N'0', 1)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (118, N'tiennv', CAST(N'2023-08-29' AS Date), 156000, 41000, N'Xã Nghĩa Sơn, Huyện Văn Chấn ,Yên Bái', N'0', 1)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (119, N'tiennv', CAST(N'2023-08-29' AS Date), 146501, 31501, N'Xã Phước Sơn, Huyện Ninh Phước ,Ninh Thuận', N'0', 1)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (120, N'tiennv', CAST(N'2023-08-29' AS Date), 317780, 36500, N'Xã Ninh Thới, Huyện Cầu Kè ,Trà Vinh', N'GIAMGIA10K', 1)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (121, N'tiennv', CAST(N'2023-08-29' AS Date), 151500, 36500, N'Xã Ninh Thới, Huyện Cầu Kè ,Trà Vinh', N'0', 1)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (123, N'linh', CAST(N'2023-08-30' AS Date), 270600, 36500, N'Xã Tạ An Khương Đông, Huyện Đầm Dơi ,Cà Mau', N'0', 1)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (124, N'tiennv', CAST(N'2023-08-30' AS Date), 484740, 36500, N'Xã Khánh Lâm, Huyện U Minh ,Cà Mau', N'GIAMGIA10K', 1)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (125, N'linh', CAST(N'2023-08-30' AS Date), 333500, 36500, N'Xã Xuân Quang 1, Huyện Đồng Xuân ,Phú Yên', N'GIAMGIA10K', 1)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (126, N'linh', CAST(N'2023-08-31' AS Date), 378000, 41000, N'Xã Vị Quang, Huyện Thông Nông ,Cao Bằng', N'LUNARNEWYEAR', 1)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (127, N'tien', CAST(N'2023-08-31' AS Date), 552500, 36500, N'Xã Đắk Nông, Huyện Ngọc Hồi ,Kon Tum', N'0', 1)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (128, N'tien', CAST(N'2023-08-31' AS Date), 177620, 36500, N'Xã Hòa Minh, Huyện Tuy Phong ,Bình Thuận', N'0', 1)
INSERT [dbo].[Bills] ([Id], [Userid], [Createdate], [Billtotal], [Ship], [Address], [Voucherid], [Status]) VALUES (129, N'hduc', CAST(N'2023-08-31' AS Date), 488000, 34000, N'Phường Quán Trữ, Quận Kiến An ,Hải Phòng', N'GIAMGIA10K', 1)
SET IDENTITY_INSERT [dbo].[Bills] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (1, N'Ngày Đòi Nợ', N'9db7cb2b.jpg', 157000, CAST(N'2023-01-02' AS Date), 1, N'KNS', N'truyen dai', N'1')
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (9, N'Cây Cam Ngọt Của Tôi', N'Cay-cam-ngot-cua-toi.jpg', 108000, CAST(N'2023-08-11' AS Date), 1, N'VH', N'“Vị chua chát của cái nghèo hòa trộn với vị ngọt ngào khi khám phá ra những điều khiến cuộc đời này đáng số một tác phẩm kinh điển của Brazil.”

- Booklist

“Một cách nhìn cuộc sống gần như hoàn chỉnh từ con mắt trẻ thơ… có sức mạnh sưởi ấm và làm tan nát cõi lòng, dù người đọc ở lứa tuổi nào.”

- The National

Hãy làm quen với Zezé, cậu bé tinh nghịch siêu hạng đồng thời cũng đáng yêu bậc nhất, với ước mơ lớn lên trở thành nhà thơ cổ thắt nơ bướm. Chẳng phải ai cũng công nhận khoản “đáng yêu” kia đâu nhé. Bởi vì, ở cái xóm ngoại ô nghèo ấy, nỗi khắc khổ bủa vây đã che mờ mắt người ta trước trái tim thiện lương cùng trí tưởng tượng tuyệt vời của cậu bé con năm tuổi.

Có hề gì đâu bao nhiêu là hắt hủi, đánh mắng, vì Zezé đã có một người bạn đặc biệt để trút nỗi lòng: cây cam ngọt nơi vườn sau. Và cả một người bạn nữa, bằng xương bằng thịt, một ngày kia xuất hiện, cho cậu bé nhạy cảm khôn sớm biết thế nào là trìu mến, thế nào là nỗi đau, và mãi mãi thay đổi cuộc đời cậu.
Mở đầu bằng những thanh âm trong sáng và kết thúc lắng lại trong những nốt trầm hoài niệm, Cây cam ngọt của tôi khiến ta nhận ra vẻ đẹp thực sự của cuộc sống đến từ những điều giản dị như bông hoa trắng của cái cây sau nhà, và rằng cuộc đời thật khốn khổ nếu thiếu đi lòng yêu thương và niềm trắc ẩn. Cuốn sách kinh điển này bởi thế không ngừng khiến trái tim người đọc khắp thế giới thổn thức, kể từ khi ra mắt lần đầu năm 1968 tại Brazil.', N'5')
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (10, N'Điều Kỳ Diệu Của Tiệm Tạp Hóa NAMIYA', N'Điều Kỳ Diệu Của Tiệm Tạp Hóa NAMIYA.jpg', 77100, CAST(N'2023-08-11' AS Date), 1, N'VH', N'Điều Kỳ Diệu Của Tiệm Tạp Hóa

Một đêm vội vã lẩn trốn sau phi vụ khoắng đồ nhà người, Atsuya, Shota và Kouhei đã rẽ vào lánh tạm trong một căn nhà hoang bên con dốc vắng người qua lại. Căn nhà có vẻ khi xưa là một tiệm tạp hóa với biển hiệu cũ kỹ bám đầy bồ hóng, khiến người ta khó lòng đọc được trên đó viết gì. Định bụng nghỉ tạm một đêm rồi sáng hôm sau chuồn sớm, cả ba không ngờ chờ đợi cả bọn sẽ là một đêm không ngủ, với bao điều kỳ bí bắt đầu từ một phong thư bất ngờ gửi đến…

Tài kể chuyện hơn người đã giúp Keigo khéo léo thay đổi các mốc dấu thời gian và không gian, chắp nối những câu chuyện tưởng chừng hoàn toàn riêng rẽ thành một kết cấu chặt chẽ, gây bất ngờ từ đầu tới cuối.

 

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'8')
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (11, N'Nhà Giả Kim (Tái Bản 2020)', N'Nhà Giả Kim (Tái Bản 2020).jpg', 57100, CAST(N'2023-08-11' AS Date), 1, N'VH', N'Sơ lược về tác phẩm

Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.

Tiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.

“Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ. Tuy vậy, tự đáy lòng mình, ông không thể không cảm thấy vui trước hạnh phúc của mỗi người lữ khách, sau bao ngày chỉ có cát vàng với trời xanh nay được thấy chà là xanh tươi hiện ra trước mắt. ‘Có thể Thượng đế tạo ra sa mạc chỉ để cho con người biết quý trọng cây chà là,’ ông nghĩ.”', N'20')
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (12, N'Thư Viện Nửa Đêm', N'Thư Viện Nửa Đêm.jpg', 115000, CAST(N'2023-08-11' AS Date), 1, N'VH', N'Cuộc đời Nora Seed tràn ngập khổ sở và nuối tiếc. Cô có nhiều khả năng nhưng lại ít thành tựu, và luôn cảm thấy mình đã làm mọi người xung quanh mình thất vọng. Thế rồi, vào lúc chuông điểm nửa đêm trong ngày cuối cùng còn trên thế gian, Nora thấy mình xuất hiện ở Thư viện nửa đêm – một nơi “nằm giữa cõi sống và cõi chết”, với những dãy kệ trải dài bất tận và hằng hà sa số cuốn sách giúp Nora có thể sống một cuộc đời khác nếu cô đã lựa chọn cho mình những lối đi khác. Với sự giúp đỡ của một người quen cũ, Nora nắm trong tay cơ hội sửa chữa mọi sai lầm và xóa bỏ mọi hối tiếc để tìm kiếm một cuộc sống hoàn hảo cho riêng mình.

Vậy nhưng, với vô vàn chọn lựa như vậy, đâu mới là cách sống tốt nhất, và ta có nhờ thế mà hạnh phúc hơn chăng?', N'13')
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (13, N'Người Đua Diều (Tái Bản 2018)', N'Người Đua Diều (Tái Bản 2018).jfif', 88000, CAST(N'2023-08-11' AS Date), 1, N'VH', N'Người Đua Diều (Tái Bản 2018)

Câu chuyện là lời tự thuật của nhà văn người Mỹ gốc Afghanistan Amir về những năm tháng tuổi thơ đầy niềm vui cũng như lỗi lầm, về những ngày trôi dạt trên đất khách rồi cuộc hành trình trở lại quê hương đổ nát để cứu chuộc tội lỗi cho bản thân và cho cả người cha đã khuất. Theo dòng hồi ức của Amir, người đọc trở lại hơn hai mươi năm về trước, khi Amir còn là một cậu bé mười hai tuổi sống trong vòng tay che chở của Baba giàu sang và thanh thế. Cùng gắn bó với Amir suốt những năm tháng tuổi thơ là Hassan, con trai của người quản gia Ali, một cậu bé lanh lợi, mạnh mẽ nhiều lần xả thân để bảo vệ Amir. Thế nhưng tình bạn và lòng tận tụy của Hassan đã không được đền đáp, một ngày mùa đông năm 1975, Hassan vì ra sức bảo vệ chiếc diều xanh chiến lợi phẩm của Amir đã bị bọn trẻ xấu hành hung và nhục mạ.

Sự nhu nhược và hèn nhát đã cản bước Amir cứu bạn, thậm chí, còn biến cậu thành một kẻ gian dối khi bịa chuyện nhằm đuổi cha con Ali và Hassan ra khỏi nhà. Và Amir đã phải trả giá cho lỗi lầm ấy trong suốt phần đời còn lại. Ngay cả khi anh đang sống sung túc trên đất Mỹ, ngay cả khi tìm được một mái ấm cho riêng mình hay thực hiện được mơ ước trở thành nhà văn, nỗi ám ảnh của một kẻ gian dối vẫn ngày đêm đeo đuổi Amir. Và cuối cùng, trở lại Afghanistan để cứu con trai Hassan khỏi tay bọn Taliban là con đường duy nhất để Amir chuộc lỗi với người bạn, người em cùng cha khác mẹ Hassan đã chết dưới họng súng Taliban.

Người đua diều có đầy đủ các yếu tố cần thiết để trở thành một tác phẩm best-seller: tính thời sự, cốt truyện ly kỳ, xúc động, xung đột gay gắt giữa các tuyến nhân vật, trong chính bản thân nhân vật… Và sự thật, tác phẩm đã nắm giữ vị trí đầu bảng của The New York Times trong 110 tuần. Ngoài những khía cạnh trên, sức hấp dẫn của Người đua diều còn bắt nguồn từ giá trị nhận thức sâu sắc.

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', N'16')
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (14, N'Yêu Những Điều Không Hoàn Hảo', N'Yêu Những Điều Không Hoàn Hảo.jpg', 97300, CAST(N'2023-08-11' AS Date), 1, N'VH', N'Yêu Những Điều Không Hoàn Hảo

Đại đức Hae Min sinh ra và lớn lên tại Hàn Quốc. Sau khi hoàn thành bằng Thạc sĩ Tôn giáo học đối chiếu ở Đại học Havard và Tiến sĩ Tôn giáo học ở Đại học Princeton, ông ở lại Mỹ tham gia giảng dạy về tôn giáo ở trường Đại học Hampshire, Massachusetts. Không chỉ dừng lại ở nghiên cứu lý thuyết, mùa xuân năm 2000 ông quyết định xuất gia theo tông phái Tào Khê, một tông phái tiêu biểu của Phật giáo Hàn Quốc. Năm 2015, Đại đức Hae Min trở về Seoul, cùng nhiều chuyên gia mở trường Trị liệu tâm hồn, điều trị miễn phí cho những người gặp bất hạnh trong cuộc sống hay đang mang trong lòng nhiều khổ tâm. Đại đức Haemin là một trong những người rất có ảnh hưởng tới giới trẻ Hàn Quốc, trang Twitter cá nhân (https://twitter.com/haeminsunim) của ông hiện có tới hơn một triệu người theo dõi. Sách cùng tác giả: - Những vỡ lẽ của tuổi trẻ - Yêu lấy những điều không hoàn hảo.

 

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (15, N'Tâm Lý Học Về Tiền', N'Tâm Lý Học Về Tiền.jpg', 122850, CAST(N'2023-08-11' AS Date), 1, N'KT', N'Tiền bạc có ở khắp mọi nơi, nó ảnh hưởng đến tất cả chúng ta, và khiến phần lớn chúng ta bối rối. Mọi người nghĩ về nó theo những cách hơi khác nhau một chút. Nó mang lại những bài học có thể được áp dụng tới rất nhiều lĩnh vực trong cuộc sống, như rủi ro, sự tự tin, và hạnh phúc. Rất ít chủ đề cung cấp một lăng kính phóng to đầy quyền lực giúp giải thích vì sao mọi người lại hành xử theo cách họ làm hơn là về tiền bạc. Đó mới là một trong những chương trình hoành tráng nhất trên thế giới.

Chúng ta hiếm khi lâm vào hoàn cảnh nợ ngập đầu ư? Biết tiết kiệm để dành cho lúc khốn khó hơn ư? Chuẩn bị sẵn sàng cho việc nghỉ hưu? Có những cái nhìn thiết thực về mối quan hệ giữa tiền và hạnh phúc của chúng ta hơn phải không?

Chúng ta đều làm những điều điên rồ với tiền bạc, bởi vì chúng ta đều còn khá mới mẻ với trò chơi này và điều có vẻ điên rồ với bạn lại có khi hợp lý với tôi. Nhưng không ai là điên rồ cả – chúng ta đều đưa ra các quyết định dựa trên những trải nghiệm độc đáo riêng có mang vẻ hợp lý với mình ở bất cứ thời điểm nào.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (16, N'Sách Nghĩ Giàu Và Làm Giàu (Bìa Mềm)', N'Sách Nghĩ Giàu Và Làm Giàu (Bìa Mềm).jpg', 111000, CAST(N'2023-08-11' AS Date), 1, N'KT', N'"Think and Grow Rich –Nghĩ giàu và Làm giàu là một trong những cuốn sách bán chạy nhất mọi thời đại. Đã hơn 60 triệu bản được phát hành với gần trăm ngôn ngữ trên toàn thế giới và được công nhận là cuốn sách tạo ra nhiều triệu phú, một cuốn sách truyền cảm hứng thành công nhiều hơn bất cứ cuốn sách kinh doanh nào trong lịch sử.

Tác phẩm này đã giúp tác giả của nó, Napoleon Hill, được tôn vinh bằng danh hiệu “người tạo ra những nhà triệu phú”. Đây cũng là cuốn sách hiếm hoi được đứng trong top của rất nhiều bình chọn theo nhiều tiêu chí khác nhau - bình chọn của độc giả, của giới chuyên môn, của báo chí. Lý do để Think and Grow Rich - Nghĩ giàu và làm giàu có được vinh quang này thật hiển nhiên và dễ hiểu: Bằng việc đọc và áp dụng những phương pháp đơn giản, cô đọng này vào đời sống của mỗi cá nhân mà đã có hàng ngàn người trên thế giới trở thành triệu phú và thành công bền vững.

Điều thú vị nhất là các bí quyết này có thể được hiểu và áp dụng bởi bất kỳ một người bình thường nào, hoạt động trong bất cứ lĩnh vực nào. Qua hơn 70 năm tồn tại, những đúc kết về thành công của Napoleon Hill đến nay vẫn không hề bị lỗi thời, ngược lại, thời gian chính là minh chứng sống động cho tính đúng đắn của những bí quyết mà ông chia sẻ.

Sinh ra trong một gia đình nghèo vùng Tây Virginia, con đường thành công của Napoleon Hill cũng trải qua nhiều thăng trầm. Khởi đầu bằng chân cộng tác viên cho một tờ báo địa phương lúc 15 tuổi, đến năm 19 tuổi Hill trở thành nhà quản lý mỏ than trẻ tuổi nhất, sau đó bỏ ngang để theo đuổi ngành luật. Napoleon Hill còn kinh qua nhiều nghề như kinh doanh gỗ, xe hơi, viết báo về kinh doanh…', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (17, N'Quyền Lực Của Địa Lý - The Power Of Geography', N'Quyền Lực Của Địa Lý - The Power Of Geography.jfif', 280000, CAST(N'2023-08-11' AS Date), 1, N'KT', N'Tim Marshall đã nhận xét rất xác đáng rằng: "Các đế chế nổi lên rồi suy tàn. Các liên minh hình thành rồi tan rã. Thời kỳ hòa bình ở châu Âu sau các cuộc chiến của Napoleon kéo dài khoảng sáu mươi năm; ảo vọng ''Bá chủ nghìn năm'' của Đức quốc xã cũng chỉ tồn tại hơn một thập niên. Cho nên không thể biết được chính xác cán cân quyền lực sẽ thay đổi như thế nào trong những năm tớ"

Và "những nền kinh tế và địa chính trị khổng lồ sẽ tiếp tục có sức ảnh hưởng lớn đến các vấn đề toàn cầu", vì vậy mà trong cuốn sách bán chạy Những tù nhân địa lý của mình, Tim Marshall đã đề cập đến các cường quốc có ảnh hưởng đến chính trị toàn cầu như Mỹ, Nga, Trung Quốc, EU, Ấn Độ

Tuy thế, các quốc gia nhỏ hơn cũng đóng một vai trò quan trọng, vì địa chính trị liên quan đến các đồng minh, và với trật tự thế giới đang thay đổi không ngừng, các cường quốc lớn cần lôi kéo các nước nhỏ về phe mình và ngược lại. Quyền lực của địa lý sẽ đề cập đến vai trò, vị thế của quốc gia và vùng lãnh thổ nhỏ hơn đó.

Chúng ta sẽ thấy, liệu Thổ Nhĩ Kỳ, Ả Rập Saudi và Anh có cơ hội nào để giành lấy quyền lực trong tương lai hay không?

Có cách gì hóa giải được những rắc rối ở vùng Sahel để ngăn chặn cuộc khủng hoảng tị nạn tiếp theo cho châu Âu không?', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (18, N'Sách Người Giàu Có Nhất Thành Babylon (Tái Bản 2020)', N'Sách Nghĩ Giàu Và Làm Giàu (Bìa Mềm).jpg', 98000, CAST(N'2023-08-11' AS Date), 1, N'KT', N'NGƯỜI GIÀU CÓ NHẤT THÀNH BABYLON

Người giàu có nhất thành Babylon (tiếng Anh: The Richest Man in Babylon) được xem là một trong những tác phẩm truyền cảm hứng lớn nhất về chủ đề tiết kiệm, kế hoạch tài chính và sự giàu có cá nhân. Tác phẩm được viết bởi doanh nhân, nhà văn Mỹ George Samuel Clason vào năm 1926, kể về cách tiết kiệm, buôn bán và làm giàu của người dân ở thành Babylon cổ xưa.

Ban đầu đây chỉ là một tập sách nhỏ, viết về các cách quản lý tài chính và do các ngân hàng và công ty bảo hiểm phân phối. Sau khi được tổng hợp, biên tập thành một cuốn sách trọn vẹn, “Người giàu có nhất thành Babylon” bất ngờ trở nên phổ biến và nổi tiếng trên toàn thế giới bởi những lời khuyên về quản lý tài chính hết sức khôn ngoan.

Cuốn sách tập hợp nhiều câu chuyện cổ về các nhân vật vươn lên từ nghèo khổ để trở nên giàu có, được kính trọng bậc nhất thành Babylon. Có thể kể đến câu chuyện của “người giàu có nhất thành Babylon” Arkad – một thợ khắc gỗ khi còn trẻ, hay người cho vay vàng Mathon, những người nô lệ như Dabasir, Megiddo, Sharru Nada,…

Các bí quyết tài chính quan trọng nhất được cuốn sách tiết lộ bao gồm: 7 cách để chữa trị một túi tiền xẹp lép, 5 quy luật của vàng, công thức tích lũy theo tỷ lệ 1/10. Ngoài ra, cuốn sách còn đưa ra nhiều lời khuyên hữu ích về cách kiểm soát những khoản chi tiêu, làm cho vàng sinh lợi, gìn giữ tài sản, đảm bảo nguồn thu nhập lâu dài,…

Trên thực tế, không ai có thể phủ nhận rằng sự dồi dào về vật chất có thể làm cho đời sống con người trở nên tốt đẹp hơn. Riêng trong lĩnh vực kinh doanh, sức mạnh tài chính là phương tiện chủ yếu để đo lường mức độ thành đạt của các doanh nghiệp.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (19, N'
Khởi Nghiệp Kinh Doanh Online - Bán Hàng Hiệu Quả Trên Shopee', N'Khởi Nghiệp Kinh Doanh Online - Bán Hàng Hiệu Quả Trên Shopee.png', 199000, CAST(N'2023-08-11' AS Date), 1, N'KT', N'QUYỂN SÁCH CĂN BẢN CHO NGƯỜI MỚI BẮT ĐẦU, DÀNH RIÊNG CHO THỊ TRƯỜNG VIỆT NAM.
Bạn đang muốn kinh doanh online?
Bạn muốn tìm kiếm thu nhập thụ động hấp dẫn?
Hay bạn muốn làm việc tại nhà và có được tự do mơ ước?
Nhưng lại có quá nhiều vấn đề cần phải suy nghĩ như:

Bán sản phẩm gì mới có lãi?
Nguồn hàng ở đâu giá tốt và chất lượng?
Làm sao để chốt được đơn hàng hiệu quả?
Cuốn sách Khởi Nghiệp Kinh Doanh Online sẽ giúp bạn trả lời những câu hỏi trên.

Quyển sách mang đến cho bạn:

Cách tìm sản phẩm phù hợp để bắt đầu kinh doanh 
Địa chỉ cung cấp nguồn hàng uy tín và chất lượng
Các mẹo nhỏ giúp tăng tương tác tự nhiên cho kênh bán hàng
Cách chốt đơn hàng hiệu quả và những chương trình khuyến mãi hấp dẫn biến khách hàng trở thành những người bạn thân thiết.
Quyển sách có nội dung gần gũi, thiết thực, theo văn hóa tiêu dùng của người Việt. 

Dễ đọc
Dễ hiểu
Dễ áp dụng
Đây là cuốn CẨM NANG CƠ BẢN nhưng KHÔNG THỂ THIẾU cho bất kỳ ai lần đầu kinh doanh trên Internet.

Hãy mua ngay quyển sách này để bắt đầu công việc kinh doanh của bạn thật hiệu quả!', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (20, N'Chuyện Con Mèo Dạy Hải Âu Bay (Tái Bản 2019)', N'Chuyện Con Mèo Dạy Hải Âu Bay (Tái Bản 2019).jpg', 49000, CAST(N'2023-08-11' AS Date), 1, N'TN', N'Cô hải âu Kengah bị nhấn chìm trong váng dầu – thứ chất thải nguy hiểm mà những con người xấu xa bí mật đổ ra đại dương. Với nỗ lực đầy tuyệt vọng, cô bay vào bến cảng Hamburg và rơi xuống ban công của con mèo mun, to đùng, mập ú Zorba. Trong phút cuối cuộc đời, cô sinh ra một quả trứng và con mèo mun hứa với cô sẽ thực hiện ba lời hứa chừng như không tưởng với loài mèo:

Không ăn quả trứng.

Chăm sóc cho tới khi nó nở.

Dạy cho con hải âu bay.

Lời hứa của một con mèo cũng là trách nhiệm của toàn bộ mèo trên bến cảng, bởi vậy bè bạn của Zorba bao gồm ngài mèo Đại Tá đầy uy tín, mèo Secretario nhanh nhảu, mèo Einstein uyên bác, mèo Bốn Biển đầy kinh nghiệm đã chung sức giúp nó hoàn thành trách nhiệm. Tuy nhiên, việc chăm sóc, dạy dỗ một con hải âu đâu phải chuyện đùa, sẽ có hàng trăm rắc rối nảy sinh và cần có những kế hoạch đầy linh hoạt được bàn bạc kỹ càng…

Chuyện con mèo dạy hải âu bay là kiệt tác dành cho thiếu nhi của nhà văn Chi Lê nổi tiếng Luis Sepúlveda – tác giả của cuốn Lão già mê đọc truyện tình đã bán được 18 triệu bản khắp thế giới. Tác phẩm không chỉ là một câu chuyện ấm áp, trong sáng, dễ thương về loài vật mà còn chuyển tải thông điệp về trách nhiệm với môi trường, về sự sẻ chia và yêu thương cũng như ý nghĩa của những nỗ lực – “Chỉ những kẻ dám mới có thể bay”.

Cuốn sách mở đầu cho mùa hè với minh họa dễ thương, hài hước là món quà dành cho mọi trẻ em và người lớn.

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (21, N'Hoàng Tử Bé (Tái Bản 2019)', N'Hoàng Tử Bé (Tái Bản 2019).jfif', 73500, CAST(N'2023-08-11' AS Date), 1, N'TN', N'Hoàng tử bé được viết ở New York trong những ngày tác giả sống lưu vong và được xuất bản lần đầu tiên tại New York vào năm 1943, rồi đến năm 1946 mới được xuất bản tại Pháp. Không nghi ngờ gì, đây là tác phẩm nổi tiếng nhất, được đọc nhiều nhất và cũng được yêu mến nhất của Saint-Exupéry. Cuốn sách được bình chọn là tác phẩm hay nhất thế kỉ 20 ở Pháp, đồng thời cũng là cuốn sách Pháp được dịch và được đọc nhiều nhất trên thế giới. Với 250 ngôn ngữ dịch khác nhau kể cả phương ngữ cùng hơn 200 triệu bản in trên toàn thế giới, Hoàng tử bé được coi là một trong những tác phẩm bán chạy nhất của nhân loại.

Ở Việt Nam, Hoàng tử bé được dịch và xuất bản khá sớm. Từ năm 1966 đã có đồng thời hai bản dịch: Hoàng tử bé của Bùi Giáng do An Tiêm xuất bản và Cậu hoàng con của Trần Thiện Đạo do Khai Trí xuất bản. Từ đó đến nay đã có thêm nhiều bản dịch Hoàng tử bé mới của các dịch giả khác nhau. Bản dịch Hoàng tử bé lần này, xuất bản nhân dịp kỷ niệm 70 năm Hoàng tử bé ra đời, cũng là ấn bản đầu tiên được Gallimard chính thức chuyển nhượng bản quyền tại Việt Nam, hy vọng sẽ góp phần làm phong phú thêm việc dịch và tiếp nhận tác phẩm quan trọng này với các thế hệ độc giả.

Tôi cứ sống cô độc như vậy, chẳng có một ai để chuyện trò thật sự, cho tới một lần gặp nạn ở sa mạc Sahara cách đây sáu năm. Có thứ gì đó bị vỡ trong động cơ máy bay. Và vì ở bên cạnh chẳng có thợ máy cũng như hành khách nào nên một mình tôi sẽ phải cố mà sửa cho bằng được vụ hỏng hóc nan giải này. Với tôi đó thật là một việc sống còn. Tôi chỉ có vừa đủ nước để uống trong tám ngày.

Thế là đêm đầu tiên tôi ngủ trên cát, cách mọi chốn có người ở cả nghìn dặm xa. Tôi cô đơn hơn cả một kẻ đắm tàu sống sót trên bè giữa đại dương. Thế nên các bạn cứ tưởng tượng tôi đã ngạc nhiên làm sao, khi ánh ngày vừa rạng, thì một giọng nói nhỏ nhẹ lạ lùng đã đánh thức tôi. Giọng ấy nói:
“Ông làm ơn… vẽ cho tôi một con cừu!”
- Trích "Hoàng tử bé"
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (22, N'Xứ Sở Miên Man', N'Xứ Sở Miên Man.jpg', 220000, CAST(N'2023-08-11' AS Date), 1, N'TN', N'Cuộc sống của người lớn như ngồi trong một chiếc tàu lửa, mặc nhiên đi về phía trước mà đôi khi bản thân không biết đang tìm kiếm điều gì. Giữa hàng vạn những chuyện mệt mỏi trong cuộc sống, đôi lúc bạn không còn đủ sức để mở lòng mình và sẻ chia với mọi người xung quanh. Và khi ấy, ai cũng mong một lần được bé lại, thả mình nhẹ trôi bên tiếng ru của mẹ và kỷ niệm chơi đùa cùng đám bạn mỗi chiều. Mang trong mình câu hỏi “Ai rồi cũng phải lớn lên, nhưng mấy ai có thể trẻ lại như thuở ban đầu?”, Jun Phạm đưa bạn đọc đến với “Xứ sở miên man” để tìm kiếm câu trả lời cho con đường trở về với niềm vui trong dáng vẻ của một đứa nhỏ được yêu thương, che chở.

Cuốn sách “Xứ sở miên man” mở ra trước mắt bạn đọc bức tranh đối lập trong cuộc sống bình dị của ông Thảo và bé Mì Gói - đứa con gái nhỏ được ông nhận nuôi tại Tiệm cắt tóc Tân Kỳ. Mỗi ngày trôi qua, ông Thảo luôn cảm thấy mệt mỏi vì cơm áo gạo tiền, ông bị cuốn vào cuộc chiến với một con quái vật mang tên Cuối Tháng. Còn Mì Gói thì lúc nào cũng có hàng tá câu hỏi hoang đường về các nàng tiên và những bức vẽ về vùng đất “Minamun” do cô bé tự tạo ra. Sau cuộc cãi vã với ông Thảo, bé Mì Gói bị bắt đến xứ Xứ sở miên man kỳ ảo và cuộc hành trình đi giải cứu Mì Gói đầy điều bất ngờ của ông Thảo và chú Tò he chính thức bắt đầu. Cuốn sách chứa đựng những góc nhìn sâu sắc về cuộc sống của Jun Phạm qua lăng kính đầy màu sắc trẻ thơ trong nhân vật bé Mì Gói.

“Xứ sở miên man” là cuốn sách dành cho thiếu nhi với tất cả sự hồn nhiên trong câu từ, vun vén trí tưởng tượng diệu kỳ và làm thế giới nở đầy sắc hoa rực rỡ trong mắt mỗi em nhỏ. Hình bóng cô bé Mì Gói đắm mình nơi các bức vẽ xinh, tự mình sáng tạo ra một thế giới trong mơ nhiệm màu với các nhân vật đàn cá đầu mèo, tộc Huỳnh Điệp, nông trại của những phú bà rau củ, chú Cuội… Jun Phạm tỉ mỉ xây dựng vùng đất đầy thi vị, khiến trẻ em thích thú khi từ trên trời rơi xuống những thiên thạch đẹp mắt hay từ dưới đất mọc lên như đóa hoa rực rỡ, ngỡ như giấc mơ ngay đời thực. Nhân vật Tò He có nói rằng: “Mơ hay thực cũng phụ thuộc vào cách suy nghĩ của chúng ta. Trẻ con vẫn sống ở thế giới thực, nhưng chúng vẫn luôn mơ mộng đó thôi. Và quan trọng là chúng vẫn rất hạnh phúc.”

Chính từ khung cảnh đáng yêu trong trí tưởng tượng trẻ thơ đó, cuốn sách này cũng dành cho tất cả người lớn từng là những đứa trẻ mộng mơ, đã bỏ quên tình yêu chính mình giữa bộn bề cuộc sống. Dù muốn hay không thì con người ai cũng phải trải qua giai đoạn trưởng thành một lần trong đời. Những khuôn khổ, rào cản, trách nhiệm, bổn phận, hay những phán xét, quy định chẳng phải là chiếc lồng giam vô hình khiến cho chúng ta từng ngày kiệt quệ đi sao.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (23, N'Bản Đồ
', N'Bản Đồ.jpg', 267000, CAST(N'2023-08-11' AS Date), 1, N'TN', N'Hãy khám phá thế giới cùng cuốn bản đồ khổng lồ đầu tiên ở Việt Nam! Sách gồm 52 tấm bản đồ minh họa sinh động các đặc điểm địa lý và biên giới chính trị, giới thiệu những địa điểm nổi tiếng, những nét đặc trưng, về động vật và thực vật bản địa, về con người địa phương, các sự kiện văn hóa cùng nhiều thông tin hấp dẫn khác.

Đến với cuốn Bản đồ khổng lồ (27x37cm) gồm 52 tấm bản đồ đầy màu sắc sống động này, các bạn nhỏ sẽ được thỏa sức khám phá thế giới. Có tất cả 6 tấm bản đồ lục địa và 42 bản đồ quốc gia. Châu u có gì, châu Á nổi tiếng vì điều chi, khí hậu ở châu Phi như thế nào? Tất cả những chi tiết nổi bật của từng vùng miền, từng đất nước, như địa danh, trang phục, ẩm thực, lễ hội tập tục truyền thống, v…v… đều được liệt kê bằng những hình vẽ ngộ nghĩnh đáng yêu. Mỗi bản đồ có thống kê sơ bộ về diện tích, dân số, ngôn ngữ… để các bạn nhỏ nắm được thông tin tổng quát của từng đất nước, châu lục. Mỗi nước đều được phân chia thành các vùng địa lý cụ thể với tên vùng được viết mờ, các thành phố lớn trong từng nước được viết bằng màu đỏ nổi bật với chấm đỏ bên cạnh.

Cuốn sách này hứa hẹn sẽ là tấm vé đưa độc giả nhỏ du lịch khắp mọi miền trên thế giới. Các bậc phụ huynh cũng có thể đồng hành cùng con em mình, cùng ngâm cứu từng chi tiết trên mỗi tấm bản đồ, tìm hiểu và bàn luận về các địa phương. Thông qua việc chỉ dẫn, diễn giải cho các con về những thông tin trên bản đồ, đây sẽ là cuốn sách tương tác tốt để bố mẹ kết nối và gần gũi với con mình hơn.

CUỐN SÁCH NÀY CÓ GÌ ĐẶC BIỆT?

Cuốn sách Bản đồ đã được xuất bản tại hơn 30 quốc gia, bán được hơn 3 triệu bản in, là một trong những cuốn bản đồ ăn khách nhất thế giới. Bản đồ của hai tác giả Aleksandra Mizielińska và Daniel Mizieliński đã giành được nhiều giải thưởng lớn, nổi bật nhất là giải Prix Sorcières của Pháp và giải Premio Andersen của Ý – hai giải thưởng danh giá cho dòng sách thiếu nhi.

Các quốc gia đã xuất bản “Bản đồ”: Úc, Áo, Bỉ, Brazil, Canada, Chile, Trung Quốc, Croatia, Séc, Ecuador, Ai Cập, Fiji, Phần Land, Pháp, Đức, Ghana, Hy Lạp, Iceland, Ấn Độ, Ý, Nhật Bản, Jordan, Madagascar, Ma Rốc, Mexico, Mông Cổ, Namibia, Nepal, Hà Lan, New Zealand, Peru, Ba Lan, Nam Phi, Romania, Nga, Tây Ban Nha, Thụy Điển, Thụy Sĩ, Tanzania, Thái Lan, Anh, Mỹ.

ĐẶC BIỆT: Phiên bản "Bản đồ" Việt Nam đặc biệt được tác giả vẽ riêng đất nước Việt Nam.

Để thực hiện cuốn sách đồ sộ này, hai tác giả trẻ đã phải mất hơn 3 năm trời. Sau khi nghiên cứu và tìm hiểu kỹ lưỡng, họ lập một danh sách các thông tin hấp dẫn và thú vị với trẻ em, chọn lọc ra những chi tiết đặc sắc nhất của mỗi nước để vẽ vào bản đồ. Các tấm bản đồ đều được vẽ theo tỉ lệ chuẩn xác dựa trên các bản đồ địa lý đã được phát hành. Hai tác giả không chỉ vẽ tay tất cả các chi tiết hình ảnh mà còn dày công thiết kế tất cả các phông chữ được dùng trong sách.

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....

', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (24, N'Dế Mèn Phiêu Lưu Ký', N'Dế Mèn Phiêu Lưu Ký.jfif', 119000, CAST(N'2023-08-11' AS Date), 1, N'TN', N'Trong hơn nửa thế kỉ kể từ ngày ra mắt bạn đọc lần đầu tiên năm 1941, "Dế Mèn phiêu lưu kí" là một trong những sáng tác tâm đắc nhất của nhà văn Tô Hoài. 

Tác phẩm đã được tái bản nhiều lần và được dịch ra hơn 20 thứ tiếng trên thế giới và luôn được các thế hệ độc giả nhỏ tuổi đón nhận. 

Tác phẩm đã được xuất bản với nhiều hình thức khác nhau. 

Trong đó cuốn "Dế Mèn phiêu lưu kí" gồm 148 trang, trên khổ giấy 18x25 cm với nhiều minh hoạ sinh động của hoạ sĩ Tạ Huy Long - một hoạ sĩ chuyên vẽ cho sách thiếu nhi. 

Bằng cách sử dụng màu nước điêu luyện, hoạ sĩ Tạ Huy Long đã làm sống động thêm tác phẩm bất hủ của nhà văn Tô Hoài. 

Cuốn sách là món quà đẹp cả về hình thức lẫn nội dung, là món quà ý nghĩa và bổ ích mà các bậc phụ huynh tặng cho con em của mình.

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (25, N'Thỏ Bảy Màu Và Những Người Nghĩ Nó Là Bạn (Tái Bản 2023)', N'Thỏ Bảy Màu Và Những Người Nghĩ Nó Là Bạn (Tái Bản 2023).jpg', 79200, CAST(N'2023-08-11' AS Date), 1, N'TN', N'Thỏ Bảy Màu Và Những Người Nghĩ Nó Là Bạn (Tái Bản 2023)

Thỏ Bảy Màu là fanpage sở hữu hơn 2,6tr lượt thích trên mạng xã hội. Với hình tượng nhân vật thú vị cùng phong cách sáng tạo độc đáo, Thỏ bảy màu vẫn luôn là thu hút được số lượng lớn người quan tâm thể hiện qua nhiều bài viết với hàng chục nghìn lượt like và share.

Thỏ Bảy Màu là một nhân vật hư cấu chẳng còn xa lạ gì với anh em dùng mạng xã hội với slogan “Nghe lời Thỏ, kiếp này coi như bỏ!”.

Thỏ Bảy Màu đơn giản chỉ là một con thỏ trắng với sự dở hơi, ngang ngược nhưng đáng yêu vô cùng tận. Nó luôn nghĩ rằng mình không có cuộc sống và không có bạn bè. Tuy nhiên, Thỏ lại chẳng bao giờ thấy cô đơn vì đến cô đơn cũng bỏ nó mà đi.

Cuốn sách là những mẩu chuyện nhỏ được ghi lại bằng tranh xoay quanh Thỏ Bảy Màu và những người nghĩ nó là bạn. Những mẩu chuyện được truyền tải rất “teen” đậm chất hài hước, châm biếm qua sự sáng tạo không kém phần “mặn mà” của tác giả càng trở nên độc đáo và thu hút.

Nếu một ngày bạn lỡ cảm thấy buồn thì hãy đọc cuốn sách này để biết thế nào là cười sảng nha!

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (26, N'Sách Muôn Kiếp Nhân Sinh (Bìa Mềm) - Nguyên Phong', N'Sách Muôn Kiếp Nhân Sinh (Bìa Mềm) - Nguyên Phong.jpg', 168000, CAST(N'2023-08-11' AS Date), 1, N'TG-TL', N'“Muôn kiếp nhân sinh” là tác phẩm do Giáo sư John Vũ - Nguyên Phong viết từ năm 2017 và hoàn tất đầu năm 2020 ghi lại những câu chuyện, trải nghiệm tiền kiếp kỳ lạ từ nhiều kiếp sống của người bạn tâm giao lâu năm, ông Thomas – một nhà kinh doanh tài chính nổi tiếng ở New York. Những câu chuyện chưa từng tiết lộ này sẽ giúp mọi người trên thế giới chiêm nghiệm, khám phá các quy luật về luật Nhân quả và Luân hồi của vũ trụ giữa lúc trái đất đang gặp nhiều tai ương, biến động, khủng hoảng từng ngày.

“Muôn kiếp nhân sinh” là một bức tranh lớn với vô vàn mảnh ghép cuộc đời, là một cuốn phim đồ sộ, sống động về những kiếp sống huyền bí, trải dài từ nền văn minh Atlantis hùng mạnh đến vương quốc Ai Cập cổ đại của các Pharaoh quyền uy, đến Hợp Chủng Quốc Hoa Kỳ ngày nay.

“Muôn kiếp nhân sinh” cung cấp cho bạn đọc kiến thức mới mẻ, vô tận của nhân loại lần đầu được hé mở, cùng những phân tích uyên bác, tiên đoán bất ngờ về hiện tại và tương lai thế giới của những bậc hiền triết thông thái. Đời người tưởng chừng rất dài nhưng lại trôi qua rất nhanh, sinh vượng suy tử, mong manh như sóng nước. Luật nhân quả cực kỳ chính xác, chi tiết, phức tạp được thu thập qua nhiều đời, nhiều kiếp, liên hệ tương hỗ đan xen chặt chữ lẫn nhau, không ai có thể tính được tích đức này có thể trừ được nghiệp kia không, không ai có thể biết được khi nào nhân sẽ trổ quả. Nhưng, một khi đã gây ra nhân thì chắc chắn sẽ gặt quả - luật Nhân quả của vũ trụ trước giờ không bao giờ sai.

Luật Luân hồi và Nhân quả đã tạo nhân duyên để người này gặp người kia. Gặp nhau có khi là duyên, có khi là nợ; gặp nhau có lúc để trả nợ, có lúc để nối lại duyên xưa. Có biết bao việc diễn ra trong đời, tưởng chừng như là ngẫu nhiên nhưng thật ra đã được sắp đặt từ trước. Luân hồi là một ngôi trường rộng lớn, nơi tất cả con người, tất cả sinh vật đều phải học bài học của riêng mình cho đến khi thật hoàn thiện mới thôi. Nếu không chịu học hay chưa học được trọn vẹn thì buộc phải học lại, chính xác theo quy luật của Nhân quả.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (27, N'Kiếp Nào Ta Cũng Tìm Thấy Nhau: Câu Chuyện Về Những Linh Hồn Tri Kỷ Vĩnh Viễn Không Chia Lìa (Tái Bản)', N'Kiếp Nào Ta Cũng Tìm Thấy Nhau Câu Chuyện Về Những Linh Hồn Tri Kỷ Vĩnh Viễn Không Chia Lìa (Tái Bản).jpg', 99000, CAST(N'2023-08-11' AS Date), 1, N'TG-TL', N'Kiếp nào ta cũng tìm thấy nhau là cuốn sách thứ ba của Brain L. Weiss – một nhà tâm thần học có tiếng. Trước đó ông đã viết hai cuốn sách: cuốn đầu tiên là Ám ảnh từ kiếp trước, cuốn sách mô tả câu chuyện có thật về một bệnh nhân trẻ tuổi cùng với những liệu pháp thôi miên về kiếp trước đã làm thay đổi cả cuộc đời tác giả lẫn cô ấy. Cuốn sách đã bán chạy trên toàn thế giới với hơn 2 triệu bản in và được dịch sang hơn 20 ngôn ngữ. Cuốn sách thứ hai Through Time into Healing (Đi qua thời gian để chữa lành), mô tả những gì tác giả đã học được về tiềm năng chữa bệnh của liệu pháp hồi quy tiền kiếp. Trong cuốn sách đều là những câu chuyện người thật việc thật. Nhưng câu chuyện hấp dẫn nhất lại nằm trong cuốn sách thứ ba.

Kiếp nào ta cũng tìm thấy nhau nói về những linh hồn tri kỷ, những người có mối liên kết vĩnh viễn với nhau bằng tình yêu thương, luôn gặp lại nhau hết lần này đến lần khác, qua hết kiếp này tới kiếp khác. Chúng ta sẽ tìm thấy và nhận ra tri kỷ của mình như thế nào, rồi đưa ra những quyết định làm thay đổi cuộc sống của chính mình ra sao là những khoảnh khắc quan trọng và xúc động nhất trong cuộc đời mỗi người.

Định mệnh sẽ dẫn lối cho những linh hồn tri kỷ hội ngộ. Chúng ta sẽ gặp họ. Nhưng quyết định làm gì sau đó lại là quyền tự do lựa chọn của mỗi người. Một lựa chọn sai lầm hoặc một cơ hội bị bỏ lỡ có thể dẫn đến nỗi cô đơn và thống khổ tột cùng. Và một lựa chọn đúng đắn, một cơ hội được nắm bắt có thể mang lại niềm hạnh phúc sâu sắc.

Những gì tác giả viết trong sách được ghi lại từ hồ sơ bệnh án, băng thu âm và trí nhớ. Chỉ có tên và một vài chi tiết nhỏ được thay đổi để giữ tính bảo mật. Đây là câu chuyện về vận mệnh và hy vọng. Đây là câu chuyện xảy ra âm thầm mỗi ngày.

Ngày này năm đó, đã có người lắng nghe.
Linh hồn tựa như nước
Rơi xuống từ thiên đường
Lên trời như khói sương
Rồi trở về với đất
Chuỗi tuần hoàn bất tận.
GOETHE', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (28, N'Hành Trình Về Phương Đông (Tái Bản 2021)', N'Hành Trình Về Phương Đông (Tái Bản 2021).jpg', 118000, CAST(N'2023-08-11' AS Date), 1, N'TG-TL', N'Hành Trình Về Phương Đông, một trong những tác phẩm đương đại hay và độc đáo nhất về văn hóa phương Đông vừa tái ngộ bạn đọc trong một diện mạo hoàn toàn mới, sang trọng và ấn tượng. Đây là ấn bản có lượng phát hành ấn tượng, hơn 40.000 bản tại Việt Nam chỉ trong vài năm trở lại đây.

Hành Trình Về Phương Đông kể về những trải nghiệm của một đoàn khoa học gồm các chuyên gia hàng đầu của Hội Khoa Học Hoàng Gia Anh được cử sang Ấn Độ nghiên cứu về huyền học và những khả năng siêu nhiên của con người. Suốt hai năm trời rong ruổi khắp các đền chùa Ấn Độ, diện kiến nhiều pháp thuật, nhiều cảnh mê tín dị đoan, thậm chí lừa đào… của nhiều pháp sư, đạo sĩ… họ được tiếp xúc với những vị chân tu thông thái sống ẩn dật ở thị trấn hay trên rặng Tuyết Sơn. Nhờ thế, họ được chứng kiến, trải nghiệm, hiểu biết sâu sắc về các khoa học cổ xức và bí truyền của văn hóa Ấn Độ như yoga, thiền định, thuật chiêm tinh, các phép dưỡng sinh và chữa bệnh, những kiến thức về nhân duyên, nghiệp báo, luật nhân quả, cõi sống và cõi chết…

Cuốn sách là một phần trong bộ hồi ký nổi tiếng của giáo sư Blair T. Spalding (1857 - 1953), “Life and Teaching of the Masters of the Far East” (xuất bản năm 1953). Bộ sách có tất cả sáu quyển, ghi nhận đầy đủ về cuộc hành trình gay go nhưng lý thú và tràn đầy sự huyền bí ở Ấn Độ, Tây Tạng, Trung Hoa và Ba Tư. Ba quyển đầu ghi lại những cuộc thám hiểm của phái đoàn gồm các nhà khoa học hàng đầu của Hoàng gia Anh đi từ Anh quốc sang Ấn Độ, các cuộc gặp gỡ giữa phái đoàn và những vị thầy tâm linh sống ở châu Á và dãy Hy Mã Lạp Sơn. Ba quyển sau là những ghi nhận riêng của giáo sư Spalding về các cuộc hành trình, sự trao đổi kiến thức giữa phái đoàn và các vị thầy tâm linh, cùng bản tường trình của phái đoàn đã đưa đến những cuộc tranh luận sôi nổi. Cuối cùng thì ba người trong phái đoàn đã trở lại Ấn Độ sống đời ẩn sĩ.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (29, N'Giận (Tái Bản)', N'Giận (Tái Bản).jpg', 135000, CAST(N'2023-08-11' AS Date), 1, N'TG-TL', N'Giận là một cuốn sách hay của Thiền sư Thích Nhất Hạnh, nó mở ra cho ta những khả năng kỳ diệu, nhưng lại rất dễ thực hành để ta tự mình từng bước thoát khỏi cơn giận và sống đẹp với xã hội quanh mình.

Giận được xuất bản tại Hoa Kỳ ngày 10.9.2001, trước biến cố 11.9.2001 có một ngày. Vì thế Giận đã trở thành quyển sách bán chạy nhất Hoa Kỳ - 50.000 bản mỗi tuần - trong vòng 9 tháng.

Tại Hàn Quốc, quyển sách này đã bán được 1 triệu bản trong vòng 11 tháng. Rất nhiều độc giả nhờ đọc sách này mà đã điều phục được tâm mình, sử dụng ái ngữ lắng nghe để hoà giải với người thân, đem lại hạnh phúc trong gia đình và trong cộng đồng của họ.

Khi ta giận, khi một ai đó làm cho ta giận, ta phải trở về với thân tâm và chăm sóc cơn giận của mình. Không nên nói gì hết. Không nên làm gì hết. Khi đang giận mà nói năng hay hành động thì chỉ gây thêm đổ vỡ mà thôư thế là không khôn ngoan. Phải trở về dập tắt lửa trước đã

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (30, N'Muốn An Được An (Tái bản 2021)', N'Muốn An Được An (Tái bản 2021).jpg', 65000, CAST(N'2023-08-11' AS Date), 1, N'TG-TL', N'Muốn An Được An

Ngày chủ nhật và cũng là ngày cuối cùng của tháng 11 năm 2014 tôi nhận được bản thảo cuốn sách Muốn an được an của thiền sư Thích Nhất Hạnh đã được sư cô Hội Nghiêm dịch ra tiếng Việt từ bản nguyên gốc tiếng anh Being peace. Tôi ngồi vào bàn rồi đọc ngay tức khắc.

Tôi đọc ngay những dòng đầu tiên và phải đọc đi đọc lại vài lần những dòng những chữ của thiền sư Thích Nhất Hạnh "Nếu tự thân ta không có hạnh phúc, bình an thì chúng ta không thể hiến tặng hạnh phúc và bình an cho ai được, kể cả những người ta thương, những người ta cùng chung sống trong một mái ấm gia đình. Có bình an, hạnh phúc thì chúng ta sẽ mỉm cười và xinh tươi như một bông hoa, khi đó, mọi người chung quanh ta, từ gia đình cho đến xã hội, ai cũng được thừa hưởng."

Mỗi ngày chúng ta có rất nhiều cảm thọ. Khi thì hạnh phúc, lúc thì buồn khổ. Các cảm thọ cứ lần lượt đến với ta như một dòng sông. Rõ ràng việc thực tập thiền là rất quan trọng. Hành thiền để ý thức được, ghi nhận từng cảm thọ, thậm chí ôm ấp từng cảm thọ. Tôi luôn nhắc mình thực tập như vậy. Tôi biết điều này bởi thiền sư Thích Nhất Hạnh đã hướng dẫn chúng tôi cách đây tròn 10 năm, từ 2005 khi tôi may mắn được biết đến Thầy. Nhờ Thầy mà tôi dần biết cách tìm bình an trong chính mình.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (31, N'Từng Bước Nở Hoa Sen', N'Từng Bước Nở Hoa Sen.jfif', 75000, CAST(N'2023-08-11' AS Date), 1, N'TG-TL', N'Mô Tả Sản Phẩm
Từng Bước Nở Hoa Sen

Không nhơ cũng không sạch

Không bớt cũng không thêm

Trí tuệ Ba La Mật

Không có pháp nào trên

Sống là chuyển hóa không ngừng, tất cả mọi vật nương vào nhau để tồn tại. Thân tâm an trú trong chánh niệm thì khi đốt một lò trầm, tâm ta cũng thanh tịnh. Chấp nhận cuộc đời là chấp nhận cả sinh lẫn diệt, cả còn lẫn mất, cả vui lẫn buồn. Vì có sự sống là có chết chóc… có sum họp thì có chia lìa, có được thì sẽ mất đi…

Đức Phật dạy rằng: "Cứu chữa cho tâm quan trọng hơn là cho thân, vì đó là nguyên nhân gây ra bao điều tội lỗi. Người có tâm từ bi rộng lớn và hành vi thiện lành, tâm sẽ ít bị vẩn đục bởi phiền não tham, sân, si chi phối. Nếu chúng ta mỗi ngày tỉnh giác từng ý nghĩ, lời nói và hành động của mình, thì ta sẽ biết cách làm chủ bản thân để ngày càng hoàn thiện chính mình hơn về mọi mặt."

Từng bước nở hoa sen của Thiền sư Thích Nhất Hạnh là một trong những quyển sách "dạy" ta cách sống an nhiên như thế. Bốn mươi bảy bài kệ trong sách cũng là bốn mươi bảy bài học giúp ta tu tập chánh niệm mỗi ngày, hướng đến sự an lạc trong cả tâm, thân và sống hết mình cho từng giây phút hiện tại.

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (32, N'Các Thế Giới Song Song (Tái Bản 2018)', N'Các Thế Giới Song Song (Tái Bản 2018).jpg', 119500, CAST(N'2023-08-11' AS Date), 1, N'KH-KT', N'Các Thế Giới Song Song

Một chuyến du hành đầy trí tuệ qua các vũ trụ, được dẫn dắt tài tình bởi "thuyền trưởng" Michio Kaku và độc giả có dịp chiêm ngưỡng vẻ đẹp kỳ vĩ của vũ trụ kể từ vụ nổ lớn, vượt qua những hố đen, lỗ sâu, bước vào các thế giới lượng tử từ muôn màu kỳ lạ nằm ngay trước mũi chúng ta, vốn dĩ tồn tại song song trên một màng bên ngoài không - thời gian bốn chiều, ngắm nhìn thực tại vật chất quen thuộc hoà quyện với thế giới của những điều kỳ diệu như năng lượng và vật chất tối, sự nảy chồi của các vũ trụ, những chiều không gian bí ẩn và sự biến ảo của các dây rung siêu nhỏ...

Dẫn chuyện lôi cuốn, kết hợp tường minh, sống động một lượng thông tin đồ sộ để khai mở những giới hạn tột cùng của trí  tưởng tượng, Kaku thực sự xứng đáng là " nhà truyền giáo" vĩ đại đã mang thế giới vật lý lý thuyết tới quảng đại quần chúng.

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (33, N'Khoa Học Khám Phá - Vũ Trụ Toàn Ảnh', N'Khoa Học Khám Phá - Vũ Trụ Toàn Ảnh.jpg', 180650, CAST(N'2023-08-11' AS Date), 1, N'KH-KT', N'Khoa Học Khám Phá - Vũ Trụ Toàn Ảnh

Cuốn sách giải thích những điều kỳ lạ, những phép lạ tôn giáo, trải nghiệm cận tử, thoát xác, những khả năng phi thường của con người bằng nguyên lý toàn ảnh dựa trên ý tưởng cho rằng vũ trụ là một ảnh toàn ký khổng lồ.

Song song với sự phát triển của khoa học, những điều huyền bí vẫn tồn tại bất chấp các định lý, định luật và điều kiện của tự nhiên mà khoa học hiện đại tuân theo. Đối mặt với vấn đề này, hầu hết các nhà khoa học lựa chọn “từ bỏ”, phủ nhận những điều huyền bí, một số người cực đoan thậm chí quy kết tất cả những gì siêu nhiên là mê tín. Mặc dù vậy, vẫn có những người tiếp tục nghiên cứu mặc sự dèm pha của đồng nghiệp. Michael Talbot là một trong số đó. Trong cuốn sách Vũ trụ toàn ảnh, ông đã đề xuất ý tưởng cho rằng toàn bộ vũ trụ là một cơ thể khổng lồ, không thể chia tách, là một ảnh toàn ký mà dù có chia nhỏ đến đâu vẫn cho ra hình ảnh nguyên vẹn. Theo quan niệm này, ông đã giải thích những điều kỳ lạ, những phép lạ tôn giáo, trải nghiệm cận tử, thoát xác, những khả năng phi thường của con người – tiên tri, thấu thị, cơ thể không bị tổn thương, đi trên dung nham nóng chảy, chữa bệnh bằng sức mạnh tinh thần… – bằng nguyên lý toàn ảnh, dựa trên những chứng cứ mà ông thu thập được và chính từ trải nghiệm của bản thân. Qua đó, ông cũng phần nào giải thích vì sao những hiện tượng siêu nhiên hay khả năng đặc biệt phần lớn được những người theo những nền văn hóa cổ trải nghiệm mà không phải những người thông thái theo trường phái hiện đại. Ý thức và niềm tin chính là chìa khóa cho vấn đề này.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (34, N'Trí Tuệ Nhân Tạo Học Máy Và Ứng Dụng', N'Trí Tuệ Nhân Tạo Học Máy Và Ứng Dụng.jfif', 148000, CAST(N'2023-08-11' AS Date), 1, N'KH-KT', N'Sách được biên soạn chủ yếu cho sinh viên các trường Đại học, Cao đẳng chuyên ngành Tin học đặc biệt là Khoa học máy tính làm tài liệu tham khảo. Sách vẫn sử dụng tốt cho những Kỹ sư Tự động hóa, Điện tử viễn thông, Cơ điện tử, Cơ khí…', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (35, N'Xây nhà - Ngàn điều cần biết', N'Xây nhà - Ngàn điều cần biết.jpg', 369000, CAST(N'2023-08-11' AS Date), 1, N'KH-KT', N'Cuốn sách được xuất bản với mong muốn mang đến cho các anh chị sắp xây nhà thật nhiều kiến thức hữu ích cùng với các lưu ý, lời khuyên, tư vấn, giúp cho mọi người có được cái nhìn tổng quát và cụ thể về cả quá trình hình thành một căn nhà, từ ý tưởng ban đầu cho tới khi hoàn thiện đưa vào sử dụng. Giúp gia chủ có được sự chuẩn bị tốt về mọi thứ liên quan để tránh bị động, căng thẳng trong suốt quá trình từ chuẩn bị cho đến khi thiết kế - xây dựng. Cuốn sách cũng là tài liệu hữu ích cho các bạn sinh viên nghành kiến trúc xây dựng, những bạn mới vào nghề muốn cập nhật thêm kiến thức thực tế, những anh chị sale cùng lĩnh vực muốn tìm hiểu thêm về quá trình hình thành căn nhà từ đầu đến cuối để có những tư vấn bán hàng tốt hơn, sát thực tế hơn.

Cuốn sách được sắp xếp nội dung theo trình tự các bước như là hành trình tạo nên ngôi nhà của anh chị: Từ bước xác định nhu cầu, quy mô xây dựng, hình thành ý tưởng, chuẩn bị tài chính, tìm hiểu pháp lý, làm việc với các chuyên gia, đến công việc thiết kế và thi công phần thô, hoàn thiện ngôi nhà đưa vào sử dụng. Ở mỗi mục đều có những phân tích, đưa ra những lời khuyên, tư vấn về các ưu điểm, khuyết điểm cũng như cung cấp các kiến thức, thông tin cơ bản được chắt lọc để gia chủ hiểu về các công việc liên quan. Cuốn sách cũng hướng dẫn anh chị làm việc với các bên như Tư vấn thiết kế, tư vấn giám sát, nhà thầu thi công, chuyên gia phong thủ sao cho phù hợp, giúp toàn bộ quá trình được diễn ra suôn sẻ, hạn chế tối đa những sai lầm, rắc rối không đáng có.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (36, N'Luật Tâm Thức - Giải Mã Ma Trận Vũ Trụ (Tái Bản 2022)', N'Luật Tâm Thức - Giải Mã Ma Trận Vũ Trụ (Tái Bản 2022).jpg', 219000, CAST(N'2023-08-11' AS Date), 1, N'KH-KT', N'Dịch bệnh, thiên tai, chiến tranh… có phải là lời cảnh cáo của tự nhiên đến con người?

“Biến đổi khí hậu” là một nước đi chính trị hay chỉ là sự thay đổi của Trái Đất theo chu kỳ?

UFO, người ngoài hành tinh có thật không?

Tại sao Kinh dịch lại tiên đoán được các sự kiện?

Mỗi con người có số mệnh định sẵn không? Chúng ta sẽ đi về đâu sau khi chết?

…

Liệu tất cả chỉ là ngẫu nhiên, hay có một sự sắp đặt tài tình của vũ trụ?

“Luật Tâm Thức - giải mã ma trận vũ trụ” sẽ giải đáp tất cả những khía cạnh mà có thể bạn không nhận thức được chúng tồn tại, và có thể khám phá những vùng đất mình chưa từng biết đến.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (37, N'Toán Học, Một Thiên Tiểu Thuyết', N'Toán Học, Một Thiên Tiểu Thuyết.jpg', 85100, CAST(N'2023-08-11' AS Date), 1, N'KH-KT', N'Hầu hết mọi người đều thích toán, tiếc là họ không biết điều này!

Bởi ai mà chẳng thấy hấp dẫn với những mẩu chuyện kỳ thú về toán: như “giáo phái” toán học kỳ lạ của Pythagoras thời cổ đại hay những cuộc thăm dò hệ mặt trời bằng công cụ toán học đầy kịch tính thời cận đại, hoặc gần đây hơn là sự kiện máy tính AlphaGo giành chiến thắng trước kỳ thủ cờ vây số một thế giới Lee Sedol bằng những nước đi “thần thánh” sử dụng lý thuyết xác suất.

Toán học khai sinh vì lý do hữu dụng, hẳn nhiên. Vào thời tiền sử, người ta nghĩ ra những con số để đếm đàn gia súc, dùng hình học để đo ruộng đất, làm đường sá. Loài home sapiens chúng ta không ngừng tò mò muốn khám phá thế giới tự nhiên xung quanh, nên suốt mấy ngàn năm qua toán học đã tiến lên phía trước với những bước khổng lồ và ngày càng trừu tượng.

Mickaël Launaykhông chỉ cho người đọc thấy cái đẹp, chất thơ của toán học mà còn xác quyết một điều khác, rằng mọi người đều có thể yêu thích toán học và đều có thể cảm nhận được vẻ đẹp tự nhiên của nó. Cuốn sách này là một minh chứng cho điều đó.

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (38, N'Sách Bài Tập Lớp 1 - Chân Trời Sáng Tạo', N'Sách Bài Tập Lớp 1 - Chân Trời Sáng Tạo.jpg', 9000, CAST(N'2023-08-11' AS Date), 1, N'GK-GT', N'Bộ sách “Chân trời sáng tạo” mang đến góc nhìn rộng hơn với kiến thức khoa học và công nghệ, thế giới nghệ thuật bao la và những giá trị tinh thần tốt đẹp của nhân loại. Bộ sách không chỉ là nơi truyền tải tri thức mà còn gợi mở, truyền cảm hứng để các em học sinh tìm tòi, khám phá, sáng tạo và phát triển mọi tiềm năng của bản thân.

Bô Sách Bài Tập Lớp 1 (11 Cuốn) bao gồm:

1. Vở Bài tập Tiếng Việt 1 - Tập 1

2. Vở Bài tập Tiếng Việt 1 - Tập 2

3. Vở Bài tập Toán 1 - Tập 1

4. Vở Bài tập Toán 1 - Tập 2

5. Tập viết 1 - Tập 1

6. Tập viết 1 - Tập 2

7. Vở Bài tập Đạo đức 1

8. Vở Bài tập Tự nhiên và Xã hội 1

9. Vở Bài tập Âm nhạc 1

10. Vở Bài tập Mĩ thuật 1

11. Vở Bài tập Hoạt động trải nghiệm 1

Khách hàng có thể chọn phân loại tựa sách muốn mua hoặc cả bộ.

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (39, N'Sách Giáo Khoa Lớp 1 - Chân Trời sáng tạo', N'Sách Giáo Khoa Lớp 1 - Chân Trời sáng tạo.png', 186000, CAST(N'2023-08-11' AS Date), 1, N'GK-GT', N'Bộ sách “Chân trời sáng tạo” mang đến góc nhìn rộng hơn với kiến thức khoa học và công nghệ, thế giới nghệ thuật bao la và những giá trị tinh thần tốt đẹp của nhân loại. Bộ sách không chỉ là nơi truyền tải tri thức mà còn gợi mở, truyền cảm hứng để các em học sinh tìm tòi, khám phá, sáng tạo và phát triển mọi tiềm năng của bản thân.

Bộ Sách Giáo Khoa Lớp 1 (9 Cuốn) bao gồm:

1. Tiếng Việt 1 - Tập 1

2. Tiếng Việt 1 - Tập 2

3. Toán 1

4. Đạo đức 1

5. Tự nhiên và Xã hội 1

6. Âm nhạc 1

7. Mĩ thuật 1

8. Hoạt động trải nghiệm 1

9. Giáo dục thể chất 1

Khách hàng có thể chọn phân loại tựa sách muốn mua hoặc cả bộ.

Sách Giáo Khoa Lớp 1 - Chân Trời sáng tạo - Tiếng Việt

Sách giáo khoa Tiếng Việt 1 gồm hai tập dùng cho hai học kì. Phần học âm vần gồm 17 tuần của học kì I (tập một) và hai tuần đầu của học kì II, phần luyện tập tổng hợp gồm 14 tuần (tập hai). Cả hai phần đều được sắp xếp theo chủ đề tương ứng với từng tuần học. Cuối mỗi học kì đều có một tuần ôn tập và kiểm tra.

Sách Giáo Khoa Lớp 1 - Chân Trời sáng tạo - Toán

Sách Toán 1 thuộc bộ sách giáo khoa Chân trời sáng tạo được Nhà xuất bản Giáo dục Việt Nam xuất bản. Với học sinh, cuốn sách như người bạn thân thiết, giúp các em tự tìm tòi, khám phá và học tập một cách sáng tạo theo năng lực của mình. Các hình ảnh dễ thương và nhưng tình huống vui nhộn, gần gũi, lôi cuốn học sinh vào hoạt động học tập giúp cuốn sách trở nên dễ dạy, dễ học.

Sách Giáo Khoa Lớp 1 - Chân Trời sáng tạo - Đạo đức

Bộ sách “Chân trời sáng tạo” mang đến góc nhìn rộng hơn với kiến thức khoa học và công nghệ, thế giới nghệ thuật bao la và những giá trị tinh thần tốt đẹp của nhân loại. Bộ sách không chỉ là nơi truyền tải tri thức mà còn gợi mở, truyền cảm hứng để các em học sinh tìm tòi, khám phá, sáng tạo và phát triển mọi tiềm năng của bản thân.

Sách Giáo Khoa Lớp 1 - Chân Trời sáng tạo - Tự nhiên và Xã hội

Sách Tự nhiên và Xã hội 1 là cuốn sách thuộc bộ sách giáo khoa Chân trời sáng tạo của Nhà xuất bản Giáo dục Việt Nam. Trong cuốn sách này, các em sẽ tham gia nhiều hoạt động học tập thú vị, cùng nhau tìm hiểu, khám phá về thế giới tự nhiên, xã hội xung quanh và có cách ứng xử phù hợp với gia đình, nhà trường, cộng đồng, môi trường sống.

Sách giáo khoa Tự nhiên Xã hội 1 gồm 32 bài học, được sắp xếp thành 6 chủ đề: Gia đình, Trường học, Cộng đồng địa phương, Thực vật và động vật, Con người và sức khỏe, Trái đất và bầu trời. Nội dung mỗi bài học được xây dựng dựa trên các câu chuyện thực tế và gần gũi với đời sống hằng ngày, phù hợp với lứa tuổi của các em. Sách hướng dẫn các em tìm hiểu, khám phá thế giới tự nhiên, xã hội thông qua những hình ảnh minh họa sinh động và hoạt động hấp dẫn.

Sách Giáo Khoa Lớp 1 - Chân Trời sáng tạo - Âm nhạc

Bộ sách “Chân trời sáng tạo” mang đến góc nhìn rộng hơn với kiến thức khoa học và công nghệ, thế giới nghệ thuật bao la và những giá trị tinh thần tốt đẹp của nhân loại. Bộ sách không chỉ là nơi truyền tải tri thức mà còn gợi mở, truyền cảm hứng để các em học sinh tìm tòi, khám phá, sáng tạo và phát triển mọi tiềm năng của bản thân.

Sách Giáo Khoa Lớp 1 - Chân Trời sáng tạo - Mĩ thuật

Sách giáo khoa Mĩ thuật 1 là tài liệu chính thức dùng để dạy học môn Mĩ thuật lớp 1 theo Chương trình giáo dục phổ thông.
Trên cơ sở những nội dung dạy học được quy định trong Chương trình môn Mĩ thuật lớp 1, sách giáo khoa Mĩ thuật q được triển khai thành tám chủ đề: Thế giới mĩ thuật, Ngôi nhà của em, Thiên nhiên và bầu trời, Khu vườn của em, Khéo tay hay làm, Những người bạn, Con vật em yêu, Phong cảnh quê hương. Các chủ đề cung cấp cho học sinh những kiến thức cơ bản theo hướng mở, sinh động, hấp dẫn, chủ trọng phát triển các kĩ năng quan sát và nhận thức, sáng tạo và ứng dụng, phân tích và đánh giá thông qua các nhiệm vụ học tập gắn với thực tiễn đời sống, phù với đặc điểm tâm lí, nhận thức của học sinh lớp 1.

Sách Giáo Khoa Lớp 1 - Chân Trời sáng tạo - Hoạt động trải nghiệm

Sách Hoạt động trải nghiệm 1 mang đến các hoạt động thú vị để các em nỗ lực rèn luyện và phát triển bản thân, xây dựng quan hệ tốt đẹp với mọi người xung quanh, khám phá và xây dựng môi trường thiên nhiên xanh, sạch, đẹp hơn. Sách Hoạt động trải nghiệm 1 gồm tám chủ đề. Mỗi chủ đề bắt đầu với mục tiêu để định hướng và được phân chia thành các tuần. Mỗi tuần gồm: Sinh hoạt dưới cờ, sinh hoạt theo chủ đề và sinh hoạt lớp.

Sách Giáo Khoa Lớp 1 - Chân Trời sáng tạo - Giáo dục thể chất

Sách giáo khoa Giáo dục thể chất 1 được tổ chức biên soạn với phương châm lấy người học làm trung tâm, phát huy tối đa năng lực và phẩm chất của người học. Mỗi bài học giúp học sinh dễ dàng quan sát và nhận biết các động tác, cách thức tập luyện, trò chơi vận động theo từng nội dung, đồng thời giúp các em vận dụng kiến thức để hình thành kĩ năng vận động và phát triển thể chất. Thông qua các học trong sách, giáo viên dễ dàng tổ chức các hoạt động phù hợp với đặc thù ở từng địa phương và đặc điểm của học sinh, giúp các em phát huy tối đa năng lực của bản thân.

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....

', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (40, N'Sách Giáo Khoa Lớp 3 - Chân Trời sáng tạo', N'Sách Giáo Khoa Lớp 3 - Chân Trời sáng tạo.jpg', 165000, CAST(N'2023-08-11' AS Date), 1, N'GK-GT', N'Bộ sách “Chân trời sáng tạo” mang đến góc nhìn rộng hơn với kiến thức khoa học và công nghệ, thế giới nghệ thuật bao la và những giá trị tinh thần tốt đẹp của nhân loại. Bộ sách không chỉ là nơi truyền tải tri thức mà còn gợi mở, truyền cảm hứng để các em học sinh tìm tòi, khám phá, sáng tạo và phát triển mọi tiềm năng của bản thân.

Khách hàng có thể chọn phân loại tựa sách muốn mua hoặc cả bộ.

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (41, N'Sách Giáo Khoa Bộ Lớp 12 - Sách Bài Học (Bộ 14 Cuốn) (2023)', N'Sách Giáo Khoa Bộ Lớp 12 - Sách Bài Học (Bộ 14 Cuốn) (2023).jpg', 180000, CAST(N'2023-08-11' AS Date), 1, N'GK-GT', N'Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (42, N'Kinh Tế Vĩ Mô', N'Kinh Tế Vĩ Mô.jpg', 76000, CAST(N'2023-08-11' AS Date), 1, N'GK-GT', N'Kinh Tế Vĩ Mô

Ngày nay Kinh tế học nói chung và Kinh tế vĩ mô nói riêng là môn học cơ bản được giảng dạy ở tất cả các trường đại học thuộc khối ngành kinh tế.

Để góp phần làm phong phú thêm nguồn tài liệu học tập cho sinh viên, với kinh nghiệm giảng dạy trong nhiều năm, nhóm giảng viên chúng tôi biên soạn cuốn “Kinh tế vĩ mô” theo chương trình cập nhật của Bộ giáo dục và Đào tạo, với hy vọng cuốn sách này sẽ giúp cho sinh viên dễ dàng nắm vững môn học kinh tế vĩ mô.

Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (43, N'Bài Tập Khoa Học Tự Nhiên Lớp 8 - Bộ Cánh Diều', N'Bài Tập Khoa Học Tự Nhiên Lớp 8 - Bộ Cánh Diều.jpg', 29000, CAST(N'2023-08-11' AS Date), 1, N'GK-GT', N'Bài Tập Khoa Học Tự Nhiên 8 - Cánh Diều
- Cánh diều là một trong 3 bộ SGK đã được Bộ GD-ĐT thẩm định phê duyệt cho chương trình giáo dục phổ thông mới từ năm học 2020-2021 và được nhiều trường TH, THCS, THPT trên cả nước lựa chọn đưa vào giảng dạy từ năm học 2022-2023. Đây được xem là bộ SGK duy nhất được biên soạn bằng hình thức xã hội hóa tại Việt Nam kể từ sau năm 1975 cho đến nay.
- Với mong muốn đồng hành cùng các bạn học sinh trên con đường phát triển tri thức, cam kết phân phối sản phẩm mới 100%, chính hãng từ nhà xuất bản đồng thời luôn có ưu đãi, quà tặng hấp dẫn khi mua hàng tại gian hàng chúng tôi.
- Thông tin sản phẩm:
- Tác Giả: Nhiều tác giả
- Số trang: 132
- Năm xuất bản: 2023
- Hình thức: bìa mềm
- NXB: NXB Đại học Sư Phạm', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (44, N'Sách Thay Đổi Cuộc Sống Với Nhân Số Học - Lê Đỗ Quỳnh Hương', N'Sách Thay Đổi Cuộc Sống Với Nhân Số Học - Lê Đỗ Quỳnh Hương.jpg', 248000, CAST(N'2023-08-11' AS Date), 1, N'KNS', N'Thay Đổi Cuộc Sống Với Nhân Số Học

Cuốn sách Thay đổi cuộc sống với Nhân số học là tác phẩm được chị Lê Đỗ Quỳnh Hương phát triển từ tác phẩm gốc “The Complete Book of Numerology” của tiến sỹ David A. Phillips, khiến bộ môn Nhân số học khởi nguồn từ nhà toán học Pythagoras trở nên gần gũi, dễ hiểu hơn với độc giả Việt Nam.

Đầu năm 2020, chuỗi chương trình “Thay đổi cuộc sống với Nhân số học” của biên tập viên, người dẫn chương trình quen thuộc tại Việt Nam Lê Đỗ Quỳnh Hương ra đời trên Youtube, với mục đích chia sẻ kiến thức, giúp mọi người tìm hiểu và phát triển, hoàn thiện bản thân, các mối quan hệ xã hội thông qua bộ môn Nhân số học. Chương trình đã nhận được sự yêu mến và phản hồi tích cực của rất nhiều khán giả và độc giả sau mỗi tập phát sóng.

Nhân số học là một môn nghiên cứu sự tương quan giữa những con số trong ngày sinh, cái tên với cuộc sống, vận mệnh, đường đời và tính cách của mỗi người. Bộ môn này đã được nhà toán học Pythagoras khởi xướng cách đây 2.600 năm và sau này được nhiều thế hệ học trò liên tục kế thừa, phát triển.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (45, N'Ikigai - Bí Mật Sống Trường Thọ Và Hạnh Phúc Của Người Nhật', N'Ikigai - Bí Mật Sống Trường Thọ Và Hạnh Phúc Của Người Nhật.jfif', 90000, CAST(N'2023-08-11' AS Date), 1, N'KNS', N'IKIGAI là tập hợp nhiều câu chuyện đời, chuyện nghề giản dị, lý giải tường minh năm điều cốt lõi của ikigai –triết lý sống mang lại hạnh phúc và trường thọ của người Nhật:

Bắt đầu từ những việc nhỏ nhặt
Giải phóng cái tôi cá nhân
Sự hài hòa và tính bền vững
Niềm vui từ những điều nhỏ bé
Sống trọn khoảnh khắc hiện tại.
Nhưng làm thế nào để bạn tìm được ikigai của mình? Có nhất thiết phải có sự nghiệp thành công như Jiro Ono – ông chủ nhà hàng Sukiyabashi Jiro, nơi vinh dự được tiếp đón Obama, hay phải trở thành một yokozuna trong môn vật sumo mới đạt tới ikigai? Thông qua những nghiên cứu khoa học và từ chính trải nghiệm của bản thân, Ken Mogi mang tới cho độc giả một nhận thức sâu sắc về ikigai, đồng thời hiểu thêm về lịch sử và văn hóa Nhật Bản. Những giá trị của ikigai mà bạn thu nhận từ sách có thểgiúp bạn tìm ra ikigai của mình, và quan trọng hơn hết, mỗi sớm mai thức dậy biết mình đang sống vì điều gì', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (46, N'Sách OSHO Yêu - Being In Love - Yêu Trong Tỉnh Thức', N'Sách OSHO Yêu - Being In Love - Yêu Trong Tỉnh Thức.jpg', 125500, CAST(N'2023-08-11' AS Date), 1, N'KNS', N'“YÊU” TRONG TỈNH THỨC VỚI OSHO

Một chỉ dẫn “yêu không sợ hãi” đầy ngạc nhiên từ bậc thầy tâm linh Osho


Những người đói khát trong nhu cầu, những người luôn kỳ vọng ở tình yêu chính là những người đau khổ nhất. Hai kẻ đói khát tìm thấy nhau trong một mối quan hệ yêu đương cùng những kỳ vọng người kia sẽ mang đến cho mình thứ mình cần – về cơ bản sẽ nhanh chóng thất vọng về nhau và cùng mang đến ngục tù khổ đau cho nhau. Trong cuốn sách Yêu, Osho - bậc thầy tâm linh, người được tôn vinh là một trong 1000 người kiến tạo của thế kỷ 20 – đã đưa ra những kiến giải sâu sắc về nhu cầu tâm lý có sức mạnh lớn nhất của nhân loại và “chỉ cho chúng ta cách trải nghiệm tình yêu”.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (47, N'Nói Chuyện Là Bản Năng, Giữ Miệng Là Tu Dưỡng, Im Lặng Là Trí Tuệ (Tái bản 2022)', N'Nói Chuyện Là Bản Năng, Giữ Miệng Là Tu Dưỡng, Im Lặng Là Trí Tuệ (Tái bản 2022).jpg', 189000, CAST(N'2023-08-11' AS Date), 1, N'KNS', N'Tuân Tử nói: “Nói năng hợp lý, đó gọi là hiểu biết; im lặng đúng lúc, đó cũng là hiểu biết”. Ngôn ngữ là thứ có thể thể hiện rõ nhất mức độ tu dưỡng của một người, nói năng hợp lý là một loại trí tuệ, mà im lặng đúng lúc cũng là một loại trí tuệ. Nếu một người không biết giữ miệng, nói mà không suy nghĩ, nghĩ gì nói nấy, tất nhiên rất dễ khiến người khác chán ghét.

Nội dung quyển sách này xoay quanh hai vấn đề đó là “biết cách nói chuyện” và “biết giữ miệng”, thông qua 12 chương sách nói rõ cách nói chuyện với những người khác nhau, cách nói chuyện trong những trường hợp khác nhau, làm thế nào để nắm vững những kỹ năng và chừng mực để nói chuyện cho khôn khéo, những người không giỏi ăn nói làm cách nào mới có thể nói được những lời thích hợp với đúng người và đúng thời điểm, để có thể ứng phó với những trường hợp khác nhau trong giao tiếp.

Người biết nói chuyện, ẩn sau con người họ là lòng tốt đã khắc sâu vào xương tủy, là sự tôn trọng đến từ việc đặt mình vào vị trí của người khác, là trí tuệ sâu sắc, độc đáo và lòng kiên nhẫn không ngại phiền hà. Họ chưa hẳn là những người giỏi ăn nói, nhưng mỗi khi nói đều làm người khác như được tắm trong gió xuân, vừa mở miệng là đã toát lên khí chất hơn người.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (48, N'Đàn Ông Sao Hỏa Đàn Bà Sao Kim', N'Đàn Ông Sao Hỏa Đàn Bà Sao Kim.jpg', 188000, CAST(N'2023-08-11' AS Date), 1, N'KNS', N'Ngày xửa ngày xưa, những người sao Hỏa và sao Kim đã gặp gỡ, yêu nhau và sống hạnh phúc bởi họ tôn trọng và chấp nhận mọi điều khác biệt. Rồi họ đến Trái Đất và chứng lãng quên đã xảy ra: Họ quên rằng họ đến từ những hành tinh khác

 

Hiểu biết về giới tính giúp chúng ta thêm khoan dung và biết tha thứ khi ai đó không đáp lại theo cách mà ta mong đợi

Tình chỉ đẹp khi còn dang dở
Cưới nhau về nham nhở lắm em ơ 

Bởi kết hôn không phải là kết thúc một cuộc tình, mà nó mới là mở đầu cho rất nhiều những giai đoạn khó khăn mà cặp vợ chồng nào cũng phải trải qua. Bạn phải biết cách thích ứng và đối phó với nó để không rơi vào tình cảnh hôn nhân đổ vỡ.

', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (49, N'Không Diệt Không Sinh Đừng Sợ Hãi (TB5)
', N'Không Diệt Không Sinh Đừng Sợ Hãi (TB5).jpg', 110000, CAST(N'2023-08-11' AS Date), 1, N'KNS', N'Nhiều người trong chúng ta tin rằng cuộc đời của ta bắt đầu từ lúc chào đời và kết thúc khi ta chết. Chúng ta tin rằng chúng ta tới từ cái Không, nên khi chết chúng ta cũng không còn lại gì hết. Và chúng ta lo lắng vì sẽ trở thành hư vô.

Bụt có cái hiểu rất khác về cuộc đời. Ngài hiểu rằng sống và chết chỉ là những ý niệm không có thực. Coi đó là sự thực, chính là nguyên do gây cho chúng ta khổ não. Bụt dạy không có sinh, không có diệt, không tới cũng không đi, không giống nhau cũng không khác nhau, không có cái ngã thường hằng cũng không có hư vô. Chúng ta thì coi là Có hết mọi thứ. Khi chúng ta hiểu rằng mình không bị hủy diệt thì chúng ta không còn lo sợ. Đó là sự giải thoát. Chúng ta có thể an hưởng và thưởng thức đời sống một cách mới mẻ.

Không diệt Không sinh Đừng sợ hãi là tựa sách được Thiền sư Thích Nhất Hạnh viết nên dựa trên kinh nghiệm của chính mình. Ở đó, Thầy Nhất Hạnh đã đưa ra một thay thế đáng ngạc nhiên cho hai triết lý trái ngược nhau về vĩnh cửu và hư không: “Tự muôn đời tôi vẫn tự do. Tử sinh chỉ là cửa ngõ ra vào, tử sinh là trò chơi cút bắt. Tôi chưa bao giờ từng sinh cũng chưa bao giờ từng diệt” và “Nỗi khổ lớn nhất của chúng ta là ý niệm về đến-đi, lui-tới.”

Được lặp đi lặp lại nhiều lần, Thầy khuyên chúng ta thực tập nhìn sâu để chúng ta hiểu được và tự mình nếm được sự tự do của con đường chính giữa, không bị kẹt vào cả hai ý niệm của vĩnh cửu và hư không. Là một thi sĩ nên khi giải thích về các sự trái ngược trong đời sống, Thầy đã nhẹ nhàng vén bức màn vô minh ảo tưởng dùm chúng ta, cho phép chúng ta (có lẽ lần đầu tiên trong đời) được biết rằng sự kinh hoàng về cái chết chỉ có nguyên nhân là các ý niệm và hiểu biết sai lầm của chính mình mà thôi.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (50, N'Càng Bình Tĩnh Càng Hạnh Phúc', N'Càng Bình Tĩnh Càng Hạnh Phúc.jfif', 139000, CAST(N'2023-08-11' AS Date), 1, N'KNS', N'Càng bình tĩnh Càng hạnh phúc

Tiếp nối thành công rực rỡ của Bạn đắt giá bao nhiêu?, Khí chất bao nhiêu hạnh phúc bấy nhiêu, Không sợ chậm chỉ sợ dừng,… Vãn Tình đã quay trở lại cùng cuốn sách Càng bình tĩnh Càng hạnh phúc. Đây là cuốn sách thứ bảy của cô được xuất bản tại Việt Nam bởi thương hiệu sách Bloom Books, đánh dấu cho hành trình trưởng thành đầy rực rỡ của Vãn Tình – từ một cô gái trẻ trung, mạnh mẽ trở nên chín chắn, điềm tĩnh và bao dung hơn với cuộc đời.

Gần bảy mươi câu chuyện trong sách xoay quanh các chủ đề tình yêu, hôn nhân, gia đình, sự nghiệp… đến từ chính cuộc sống của tác giả và những người xung quanh, vừa thực tế lại vừa gợi mở, dễ dàng giúp chúng ta liên hệ với tình huống của chính mình. Với những câu chuyện đó, Vãn Tình hy vọng có thể giúp các cô gái trưởng thành, độc lập và tự tin hơn, tìm lại bản ngã và sống cuộc đời theo cách mà mình mong muốn.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (51, N'Hành Tinh Của Một Kẻ Nghĩ Nhiều', N'Hành Tinh Của Một Kẻ Nghĩ Nhiều.jpg', 62000, CAST(N'2023-08-11' AS Date), 1, N'KNS', N'“Đó là mùa hè năm 2020, mùa hè của COVID-19 và một ngàn vạn khủng hoảng tuổi đôi mươi. Đó là mùa hè mình bắt chuyến bay sớm nhất có thể vào ngày 20 tháng 3 để chạy khỏi nước Anh đang bùng dịch, bị kẹt lại sân bay Bangkok trong 24 giờ đồng hồ vì chuyến bay quá cảnh về Sài Gòn bị huỷ
Đó là mỗi đêm mùa hè nằm trên giường stress chuyện deadline luận văn, stress chuyện thất nghiệp không kiếm ra tiền, stress chuyện bỏ lỡ cơ hội thực tập giúp ích cho sự nghiệp của mình, stress chuyện học hành dở dang - không biết bao giờ mới có thể quay lại Anh và hoàn thành tấm bằng đại học, stress chuyện tồn tại một cách mơ hồ, không biết mình là ai.”

Hành tinh của một kẻ nghĩ nhiều là hành trình khám phá thế giới nội tâm của một người trẻ. Đó là một hành tinh đầy hỗn loạn của những suy nghĩ trăn trở, những dằn vặt, những cuộc chiến nội tâm, những cảm xúc vừa phức tạp cũng vừa rất đỗi con người. Một thế giới quen thuộc với tất cả chúng ta.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (52, N'Rèn Luyện Tư Duy Phản Biện', N'Rèn Luyện Tư Duy Phản Biện.jpg', 99000, CAST(N'2023-08-11' AS Date), 1, N'KNS', N'Như bạn có thể thấy, chìa khóa để trở thành một người có tư duy phản biện tốt chính là sự tự nhận thức. Bạn cần phải đánh giá trung thực những điều trước đây bạn nghĩ là đúng, cũng như quá trình suy nghĩ đã dẫn bạn tới những kết luận đó. Nếu bạn không có những lý lẽ hợp lý, hoặc nếu suy nghĩ của bạn bị ảnh hưởng bởi những kinh nghiệm và cảm xúc, thì lúc đó hãy cân nhắc sử dụng tư duy phản biện! Bạn cần phải nhận ra được rằng con người, kể từ khi sinh ra, rất giỏi việc đưa ra những lý do lý giải cho những suy nghĩ khiếm khuyết của mình. Nếu bạn đang có những kết luận sai lệch này thì có một sự thật là những đức tin của bạn thường mâu thuẫn với nhau và đó thường là kết quả của thiên kiến xác nhận, nhưng nếu bạn biết điều này, thì bạn đã tiến gần hơn tới sự thật rồi!

Những người tư duy phản biện cũng biết rằng họ cần thu thập những ý tưởng và đức tin của mọi người. Tư duy phản biện không thể tự nhiên mà có.', NULL)
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (53, N'Sách mới', N'd49ab409.jpg', 150000, CAST(N'2023-08-25' AS Date), NULL, N'TN', N'Sách hay', N'21')
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (54, N'SÁch', N'eb09b771.jpg', 150000, CAST(N'2023-08-25' AS Date), NULL, N'ANIME', N'Accccccc', N'15')
INSERT [dbo].[Books] ([Id], [Name], [Image], [Price], [Createdate], [Status], [Categoryid], [Discriptions], [Authorsid]) VALUES (60, N'Nhà giả kim', N'439ac29b.jpg', 160000, CAST(N'2023-08-31' AS Date), NULL, N'KNS', N'Sách hay', N'15')
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Cartdetails] ON 

INSERT [dbo].[Cartdetails] ([Id], [Cartid], [Bookid], [Price], [Quantity]) VALUES (140, 5, 1, 157000, 3)
INSERT [dbo].[Cartdetails] ([Id], [Cartid], [Bookid], [Price], [Quantity]) VALUES (148, 6, 10, 77100, 1)
INSERT [dbo].[Cartdetails] ([Id], [Cartid], [Bookid], [Price], [Quantity]) VALUES (149, 6, 11, 57100, 1)
INSERT [dbo].[Cartdetails] ([Id], [Cartid], [Bookid], [Price], [Quantity]) VALUES (160, 2, 9, 108000, 1)
INSERT [dbo].[Cartdetails] ([Id], [Cartid], [Bookid], [Price], [Quantity]) VALUES (162, 1, 10, 77100, 1)
INSERT [dbo].[Cartdetails] ([Id], [Cartid], [Bookid], [Price], [Quantity]) VALUES (163, 1, 54, 150000, 1)
INSERT [dbo].[Cartdetails] ([Id], [Cartid], [Bookid], [Price], [Quantity]) VALUES (164, 1, 53, 150000, 1)
INSERT [dbo].[Cartdetails] ([Id], [Cartid], [Bookid], [Price], [Quantity]) VALUES (165, 1, 49, 110000, 1)
SET IDENTITY_INSERT [dbo].[Cartdetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([Id], [Userid], [Createdate]) VALUES (1, N'linh', CAST(N'2023-08-13' AS Date))
INSERT [dbo].[Carts] ([Id], [Userid], [Createdate]) VALUES (2, N'hduc', CAST(N'2023-08-13' AS Date))
INSERT [dbo].[Carts] ([Id], [Userid], [Createdate]) VALUES (3, N'tien', CAST(N'2023-08-23' AS Date))
INSERT [dbo].[Carts] ([Id], [Userid], [Createdate]) VALUES (5, N'tiennv', CAST(N'2023-08-24' AS Date))
INSERT [dbo].[Carts] ([Id], [Userid], [Createdate]) VALUES (6, N'tienth', CAST(N'2023-08-30' AS Date))
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'ANIME', N'ANIME')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'GK-GT', N'Sách Giáo Khoa - Giáo Trình')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'KH-KT', N'Sách Khoa Học - Kĩ Thuật')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'KNS', N'Sách Kỹ Năng Sống')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'KT', N'Sách Kinh Tế')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'TG-TL', N'Sách Tôn Giáo - Tâm Linh')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'TN', N'Sách Thiếu Nhi')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'VH', N'Sách Văn Học')
GO
SET IDENTITY_INSERT [dbo].[Discounts] ON 

INSERT [dbo].[Discounts] ([id], [bookid], [discount], [startdate], [enddate]) VALUES (1, 1, 15, CAST(N'2023-08-27' AS Date), CAST(N'2023-08-27' AS Date))
INSERT [dbo].[Discounts] ([id], [bookid], [discount], [startdate], [enddate]) VALUES (2, 9, 13, CAST(N'2023-08-27' AS Date), CAST(N'2023-08-27' AS Date))
INSERT [dbo].[Discounts] ([id], [bookid], [discount], [startdate], [enddate]) VALUES (3, 19, 12, CAST(N'2023-08-27' AS Date), CAST(N'2023-09-01' AS Date))
INSERT [dbo].[Discounts] ([id], [bookid], [discount], [startdate], [enddate]) VALUES (7, 26, 16, CAST(N'2023-08-27' AS Date), CAST(N'2023-09-01' AS Date))
INSERT [dbo].[Discounts] ([id], [bookid], [discount], [startdate], [enddate]) VALUES (9, 29, 5, CAST(N'2023-08-27' AS Date), CAST(N'2023-09-01' AS Date))
INSERT [dbo].[Discounts] ([id], [bookid], [discount], [startdate], [enddate]) VALUES (10, 18, 20, CAST(N'2023-08-27' AS Date), CAST(N'2023-09-01' AS Date))
INSERT [dbo].[Discounts] ([id], [bookid], [discount], [startdate], [enddate]) VALUES (11, 23, 10, CAST(N'2023-07-24' AS Date), CAST(N'2023-08-27' AS Date))
INSERT [dbo].[Discounts] ([id], [bookid], [discount], [startdate], [enddate]) VALUES (12, 24, 4, CAST(N'2023-07-24' AS Date), CAST(N'2023-09-01' AS Date))
SET IDENTITY_INSERT [dbo].[Discounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([Id], [Userid], [Bookid], [Likedate]) VALUES (34, N'linh', 15, CAST(N'2023-08-25' AS Date))
INSERT [dbo].[Favorites] ([Id], [Userid], [Bookid], [Likedate]) VALUES (44, N'linh', 17, CAST(N'2023-08-25' AS Date))
INSERT [dbo].[Favorites] ([Id], [Userid], [Bookid], [Likedate]) VALUES (45, N'linh', 1, CAST(N'2023-08-25' AS Date))
INSERT [dbo].[Favorites] ([Id], [Userid], [Bookid], [Likedate]) VALUES (47, N'linh', 19, CAST(N'2023-08-25' AS Date))
INSERT [dbo].[Favorites] ([Id], [Userid], [Bookid], [Likedate]) VALUES (91, N'tiennv', 12, CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Favorites] ([Id], [Userid], [Bookid], [Likedate]) VALUES (92, N'tiennv', 18, CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Favorites] ([Id], [Userid], [Bookid], [Likedate]) VALUES (93, N'tienth', 1, CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Favorites] ([Id], [Userid], [Bookid], [Likedate]) VALUES (94, N'tienth', 9, CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Favorites] ([Id], [Userid], [Bookid], [Likedate]) VALUES (96, N'hduc', 9, CAST(N'2023-08-31' AS Date))
INSERT [dbo].[Favorites] ([Id], [Userid], [Bookid], [Likedate]) VALUES (97, N'hduc', 10, CAST(N'2023-08-31' AS Date))
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (1, 1, N'01phu.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (2, 1, N'02phu.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (3, 1, N'03phu.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (30, 9, N'e4ef5bf3.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (31, 9, N'Cây Cam Ngọt Của Tôi-1.jfif')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (32, 9, N'Cây Cam Ngọt Của Tôi-3.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (33, 10, N'Điều Kỳ Diệu Của Tiệm Tạp Hóa NAMIYA-1.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (34, 10, N'Điều Kỳ Diệu Của Tiệm Tạp Hóa NAMIYA-2.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (35, 10, N'Điều Kỳ Diệu Của Tiệm Tạp Hóa NAMIYA-3.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (36, 11, N'Nhà Giả Kim (Tái Bản 2020)-1.jpeg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (37, 11, N'Nhà Giả Kim (Tái Bản 2020)-2.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (38, 11, N'Nhà Giả Kim (Tái Bản 2020)-3.jfif')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (39, 12, N'Thư Viện Nửa Đêm-1.jfif')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (40, 12, N'Thư Viện Nửa Đêm-2.jfif')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (41, 12, N'Thư Viện Nửa Đêm-3.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (42, 13, N'Người Đua Diều (Tái Bản 2018)-1.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (43, 13, N'Người Đua Diều (Tái Bản 2018)-2.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (44, 13, N'Người Đua Diều (Tái Bản 2018)-3.jfif')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (45, 14, N'Yêu Những Điều Không Hoàn Hảo-1.jfif')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (46, 14, N'Yêu Những Điều Không Hoàn Hảo-2.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (47, 14, N'Yêu Những Điều Không Hoàn Hảo-3.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (48, 15, N'Tâm Lý Học Về Tiền-1.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (49, 15, N'Tâm Lý Học Về Tiền-2.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (50, 15, N'Tâm Lý Học Về Tiền-3.jfif')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (51, 16, N'Sách Nghĩ Giàu Và Làm Giàu (Bìa Mềm)-1.jfif')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (52, 16, N'Sách Nghĩ Giàu Và Làm Giàu (Bìa Mềm)-2.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (53, 16, N'Sách Nghĩ Giàu Và Làm Giàu (Bìa Mềm)-3.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (54, 17, N'Quyền Lực Của Địa Lý - The Power Of Geography-1.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (55, 17, N'Quyền Lực Của Địa Lý - The Power Of Geography-2.jfif')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (56, 17, N'Quyền Lực Của Địa Lý - The Power Of Geography-3.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (57, 18, N'Sách Người Giàu Có Nhất Thành Babylon (Tái Bản 2020)-1.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (58, 18, N'Sách Người Giàu Có Nhất Thành Babylon (Tái Bản 2020)-2.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (59, 18, N'Sách Người Giàu Có Nhất Thành Babylon (Tái Bản 2020)-3.jpg')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (60, 21, N'Hoàng Tử Bé (Tái Bản 2019)-1.jfif')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (61, 21, N'Hoàng Tử Bé (Tái Bản 2019)-2.jfif')
INSERT [dbo].[Images] ([Id], [Bookid], [Link]) VALUES (62, 21, N'Hoàng Tử Bé (Tái Bản 2019)-3.jpg')
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Proofreads] ON 

INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (1, 1, N'1.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (2, 1, N'2.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (3, 1, N'3.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (4, 9, N'Cây Cam Ngọt Của Tôi-chuong-1.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (5, 9, N'Cam-ngot-2.png')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (6, 9, N'Cây Cam Ngọt Của Tôi-3.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (7, 9, N'Cây Cam Ngọt Của Tôi-4.jfif')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (8, 10, N'Điều Kỳ Diệu Của Tiệm Tạp Hóa NAMIYA-1.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (9, 10, N'Điều Kỳ Diệu Của Tiệm Tạp Hóa NAMIYA-2.jfif')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (11, 10, N'Điều Kỳ Diệu Của Tiệm Tạp Hóa NAMIYA-4.jfif')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (12, 11, N'Nhà Giả Kim (Tái Bản 2020)-1.jfif')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (13, 11, N'Nhà Giả Kim (Tái Bản 2020)-2.jfif')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (14, 11, N'Nhà Giả Kim (Tái Bản 2020)-3.jfif')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (15, 11, N'Nhà Giả Kim (Tái Bản 2020)-4.jfif')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (16, 13, N'Người Đua Diều (Tái Bản 2018)-1.jfif')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (17, 13, N'Người Đua Diều (Tái Bản 2018)-2.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (18, 13, N'Người Đua Diều (Tái Bản 2018)-3.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (19, 13, N'Người Đua Diều (Tái Bản 2018)-4.jfif')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (20, 18, N'Sách Người Giàu Có Nhất Thành Babylon (Tái Bản 2020)-1.jfif')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (21, 18, N'Sách Người Giàu Có Nhất Thành Babylon (Tái Bản 2020)-2.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (22, 18, N'Sách Người Giàu Có Nhất Thành Babylon (Tái Bản 2020)-3.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (23, 18, N'Sách Người Giàu Có Nhất Thành Babylon (Tái Bản 2020)-4.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (24, 24, N'Dế Mèn Phiêu Lưu Ký-1.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (25, 24, N'Dế Mèn Phiêu Lưu Ký-2.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (26, 24, N'Dế Mèn Phiêu Lưu Ký-3.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (27, 24, N'Dế Mèn Phiêu Lưu Ký-4.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (28, 14, N'Yêu Những Điều Không Hoàn Hảo-1.jfif')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (29, 14, N'Yêu Những Điều Không Hoàn Hảo-2.jfif')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (30, 14, N'Yêu Những Điều Không Hoàn Hảo-3.jpeg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (31, 14, N'Yêu Những Điều Không Hoàn Hảo-4.jpeg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (32, 16, N'Sách Người Giàu Có Nhất Thành Babylon (Tái Bản 2020)-2.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (33, 16, N'Sách Người Giàu Có Nhất Thành Babylon (Tái Bản 2020)-1.jfif')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (34, 16, N'Sách Người Giàu Có Nhất Thành Babylon (Tái Bản 2020)-3.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (35, 16, N'Sách Người Giàu Có Nhất Thành Babylon (Tái Bản 2020)-4.jpg')
INSERT [dbo].[Proofreads] ([Id], [Bookid], [images]) VALUES (36, 16, N'Sách Người Giàu Có Nhất Thành Babylon (Tái Bản 2020)-5.jpg')
SET IDENTITY_INSERT [dbo].[Proofreads] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'ADMIN', N'quản trị')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'USER', N'người dùng')
GO
INSERT [dbo].[Status] ([Id], [Name]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (2, N'Đang giao hàng')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (3, N'Đã giao hàng')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (4, N'Hủy đơn hàng')
GO
SET IDENTITY_INSERT [dbo].[uservoucher] ON 

INSERT [dbo].[uservoucher] ([id], [username], [voucherid]) VALUES (3, N'hduc', N'GIAMGIA10K')
INSERT [dbo].[uservoucher] ([id], [username], [voucherid]) VALUES (7, N'tiennv', N'GIAMGIA10K')
INSERT [dbo].[uservoucher] ([id], [username], [voucherid]) VALUES (8, N'tiennv', N'TANGFREE')
INSERT [dbo].[uservoucher] ([id], [username], [voucherid]) VALUES (9, N'tiennv', N'MIENPHI15K')
INSERT [dbo].[uservoucher] ([id], [username], [voucherid]) VALUES (24, N'hduc', N'LUNARNEWYEAR')
SET IDENTITY_INSERT [dbo].[uservoucher] OFF
GO
INSERT [dbo].[Vouchers] ([Voucherid], [Name], [Discount], [image], [Startdate], [Enddate]) VALUES (N'0', N'Không có gì hết', 0, NULL, NULL, NULL)
INSERT [dbo].[Vouchers] ([Voucherid], [Name], [Discount], [image], [Startdate], [Enddate]) VALUES (N'GIAMGIA10K', N'Giảm giá thử', 10000, N'b1210b51.png', CAST(N'2023-08-28' AS Date), CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Vouchers] ([Voucherid], [Name], [Discount], [image], [Startdate], [Enddate]) VALUES (N'LUNARNEWYEAR', N'Giảm giá Tết Nguyên Đáng', 30000, N'30k.png', CAST(N'2023-08-28' AS Date), CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Vouchers] ([Voucherid], [Name], [Discount], [image], [Startdate], [Enddate]) VALUES (N'MIDMONTH', N'Giảm giá giữa tháng', 10000, N'10k.png', CAST(N'2023-08-28' AS Date), CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Vouchers] ([Voucherid], [Name], [Discount], [image], [Startdate], [Enddate]) VALUES (N'MIENPHI15K', N'Miễn phí', 15000, N'15k.png', CAST(N'2023-08-28' AS Date), CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Vouchers] ([Voucherid], [Name], [Discount], [image], [Startdate], [Enddate]) VALUES (N'ORDERFIRST', N'Đặt hàng lần đầu tiên', 15000, N'15k.png', CAST(N'2023-08-28' AS Date), CAST(N'2023-08-29' AS Date))
INSERT [dbo].[Vouchers] ([Voucherid], [Name], [Discount], [image], [Startdate], [Enddate]) VALUES (N'ORDERSWEEK', N'Đặt hàng nhiều lần trong tuần', 20000, N'20k.png', CAST(N'2023-08-28' AS Date), CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Vouchers] ([Voucherid], [Name], [Discount], [image], [Startdate], [Enddate]) VALUES (N'QUOCKHANH', N'Lễ Quốc Khánh 2-9', 25000, N'25k.png', CAST(N'2023-08-28' AS Date), CAST(N'2023-08-30' AS Date))
INSERT [dbo].[Vouchers] ([Voucherid], [Name], [Discount], [image], [Startdate], [Enddate]) VALUES (N'TANGFREE', N'Tặng cho người mới', 20000, N'20k.png', CAST(N'2023-08-28' AS Date), CAST(N'2023-08-29' AS Date))
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Accounts]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Roles] FOREIGN KEY([Roleid])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Roles]
GO
ALTER TABLE [dbo].[Billdetails]  WITH CHECK ADD  CONSTRAINT [FK_Billdetails_Bills] FOREIGN KEY([Billid])
REFERENCES [dbo].[Bills] ([Id])
GO
ALTER TABLE [dbo].[Billdetails] CHECK CONSTRAINT [FK_Billdetails_Bills]
GO
ALTER TABLE [dbo].[Billdetails]  WITH CHECK ADD  CONSTRAINT [FK_Billdetails_Books] FOREIGN KEY([Bookid])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Billdetails] CHECK CONSTRAINT [FK_Billdetails_Books]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Accounts] FOREIGN KEY([Userid])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Accounts]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Status] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Status]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Bills_Vouchers] FOREIGN KEY([Voucherid])
REFERENCES [dbo].[Vouchers] ([Voucherid])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Bills_Vouchers]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors] FOREIGN KEY([Authorsid])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories] FOREIGN KEY([Categoryid])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories]
GO
ALTER TABLE [dbo].[Cartdetails]  WITH CHECK ADD  CONSTRAINT [FK_Cartdetails_Books] FOREIGN KEY([Bookid])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Cartdetails] CHECK CONSTRAINT [FK_Cartdetails_Books]
GO
ALTER TABLE [dbo].[Cartdetails]  WITH CHECK ADD  CONSTRAINT [FK_Cartdetails_Carts] FOREIGN KEY([Cartid])
REFERENCES [dbo].[Carts] ([Id])
GO
ALTER TABLE [dbo].[Cartdetails] CHECK CONSTRAINT [FK_Cartdetails_Carts]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Accounts] FOREIGN KEY([Userid])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Accounts]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discounts_Books1] FOREIGN KEY([bookid])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discounts_Books1]
GO
ALTER TABLE [dbo].[Evaluates]  WITH CHECK ADD  CONSTRAINT [FK_Evaluates_Accounts] FOREIGN KEY([Userid])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Evaluates] CHECK CONSTRAINT [FK_Evaluates_Accounts]
GO
ALTER TABLE [dbo].[Evaluates]  WITH CHECK ADD  CONSTRAINT [FK_Evaluates_Books] FOREIGN KEY([Bookid])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Evaluates] CHECK CONSTRAINT [FK_Evaluates_Books]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Accounts] FOREIGN KEY([Userid])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Accounts]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Books] FOREIGN KEY([Bookid])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Books]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Books] FOREIGN KEY([Bookid])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Books]
GO
ALTER TABLE [dbo].[Proofreads]  WITH CHECK ADD  CONSTRAINT [FK_Proofread_Books] FOREIGN KEY([Bookid])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Proofreads] CHECK CONSTRAINT [FK_Proofread_Books]
GO
ALTER TABLE [dbo].[uservoucher]  WITH CHECK ADD  CONSTRAINT [FK_uservoucher_Accounts] FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[uservoucher] CHECK CONSTRAINT [FK_uservoucher_Accounts]
GO
ALTER TABLE [dbo].[uservoucher]  WITH CHECK ADD  CONSTRAINT [FK_uservoucher_Vouchers] FOREIGN KEY([voucherid])
REFERENCES [dbo].[Vouchers] ([Voucherid])
GO
ALTER TABLE [dbo].[uservoucher] CHECK CONSTRAINT [FK_uservoucher_Vouchers]
GO
USE [master]
GO
ALTER DATABASE [Fbook] SET  READ_WRITE 
GO
