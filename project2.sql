USE [master]
GO
/****** Object:  Database [project2]    Script Date: 10/11/2018 4:57:24 PM ******/
CREATE DATABASE [project2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'project2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\project2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'project2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\project2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [project2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [project2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [project2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [project2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [project2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [project2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [project2] SET ARITHABORT OFF 
GO
ALTER DATABASE [project2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [project2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [project2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [project2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [project2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [project2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [project2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [project2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [project2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [project2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [project2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [project2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [project2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [project2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [project2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [project2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [project2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [project2] SET RECOVERY FULL 
GO
ALTER DATABASE [project2] SET  MULTI_USER 
GO
ALTER DATABASE [project2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [project2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [project2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [project2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [project2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'project2', N'ON'
GO
ALTER DATABASE [project2] SET QUERY_STORE = OFF
GO
USE [project2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [project2]
GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 10/11/2018 4:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NavID] [int] NULL,
 CONSTRAINT [PK_Catalog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/11/2018 4:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Birthday] [smalldatetime] NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Register] [bit] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryOfInputProduct]    Script Date: 10/11/2018 4:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryOfInputProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[SupplierID] [int] NULL,
 CONSTRAINT [PK_HistoryOfInputProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NavMenu]    Script Date: 10/11/2018 4:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NavMenu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_NavMenu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/11/2018 4:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[Size] [varchar](30) NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/11/2018 4:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Total] [int] NULL,
	[OrderDate] [smalldatetime] NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Address] [nvarchar](70) NULL,
	[Note] [ntext] NULL,
	[CustomerID] [int] NULL,
	[ShipperID] [int] NULL,
	[PaymentStsID] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 10/11/2018 4:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](30) NULL,
 CONSTRAINT [PK_PaymentStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/11/2018 4:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Detail] [nvarchar](max) NULL,
	[Price] [int] NULL,
	[Discount] [int] NULL,
	[Date] [smalldatetime] NULL,
	[Quantity] [int] NULL,
	[Brand] [nvarchar](50) NULL,
	[Img1] [nvarchar](max) NULL,
	[Img2] [nvarchar](max) NULL,
	[CatalogID] [int] NULL,
	[SupplierID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/11/2018 4:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](35) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 10/11/2018 4:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Company] [nvarchar](50) NULL,
 CONSTRAINT [PK_Shipper] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 10/11/2018 4:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/11/2018 4:57:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[RoleID] [int] NULL,
	[ImageUser] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Catalog] ON 

INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (1, N'Epos Swiss', 1)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (2, N'Atlantic Swiss', 1)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (3, N'Bruno Sohnle Glashutte', 1)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (4, N'Diamond D', 1)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (5, N'Aries Gold', 1)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (7, N'Diamond D', 2)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (8, N'Aries Gold', 2)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (9, N'Nam', 3)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (10, N'Nữ', 3)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (11, N'Unisex', 3)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (12, N'Bruno Sohnle Glashutte', 2)
INSERT [dbo].[Catalog] ([Id], [Name], [NavID]) VALUES (13, N'Atlantic Swiss', 2)
SET IDENTITY_INSERT [dbo].[Catalog] OFF
SET IDENTITY_INSERT [dbo].[HistoryOfInputProduct] ON 

INSERT [dbo].[HistoryOfInputProduct] ([Id], [ProductID], [Quantity], [SupplierID]) VALUES (1, 1, 30, 1)
SET IDENTITY_INSERT [dbo].[HistoryOfInputProduct] OFF
SET IDENTITY_INSERT [dbo].[NavMenu] ON 

INSERT [dbo].[NavMenu] ([Id], [Name]) VALUES (1, N'Thương hiệu')
INSERT [dbo].[NavMenu] ([Id], [Name]) VALUES (2, N'Phụ kiện')
INSERT [dbo].[NavMenu] ([Id], [Name]) VALUES (3, N'Giới tính')
SET IDENTITY_INSERT [dbo].[NavMenu] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Discount], [Date], [Quantity], [Brand], [Img1], [Img2], [CatalogID], [SupplierID]) VALUES (1, N'Epos E-7000.701.22.18.25', N'khong co gi de noi', 300000000, 150000000, CAST(N'2018-10-04T00:00:00' AS SmallDateTime), 30, N'Epos Swiss', N'p1.jpg', N'p2.jpg', 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Discount], [Date], [Quantity], [Brand], [Img1], [Img2], [CatalogID], [SupplierID]) VALUES (2, N'Epos E-7000.701.22.18.25', N'khong co gi de noi', 99999999, 88888888, CAST(N'2018-10-04T00:00:00' AS SmallDateTime), 29, N'Epos Swiss', N'p1.jpg', N'p2.jpg', 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Detail], [Price], [Discount], [Date], [Quantity], [Brand], [Img1], [Img2], [CatalogID], [SupplierID]) VALUES (3, N'Epos E-7000.701.22.18.25', N'khong co gi de noi', 123131321, 0, CAST(N'2018-10-04T00:00:00' AS SmallDateTime), 28, N'Epos Swiss', N'p1.jpg', N'p2.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Role]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([Id], [Role]) VALUES (2, N'nhanvien')
INSERT [dbo].[Role] ([Id], [Role]) VALUES (3, N'khachhang')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Name], [Address], [Phone], [Email]) VALUES (1, N'Cong ty TNHH Dexter', N'136/48 Tran Quang Dieu', N'01206076517', N'abc@gmail.com')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address]) VALUES (3, N'admin', N'admin', N'admin', N'tanks.museum98@gmail.com', 1, N'xuananh.jpg', N'01206076517', N'136/48 Trần Quang Diệu, P.14, Q.3, TP.HCM')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address]) VALUES (4, N'cac', N'cac', N'cac', NULL, 3, N'cac', N'cac', N'cac')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address]) VALUES (5, N'khoi', N'123', N'Khoi Vo Thach', NULL, 3, N'anhchandung.jpg', N'01206076517', N'3213213231')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address]) VALUES (6, N'toan', N'123', N'cac', N'toanvan@gmail.com', NULL, N'third.png', N'01206076517', N'deo')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address]) VALUES (7, N'toan', N'123', N'cac', N'toanvan@gmail.com', NULL, N'third.png', N'01206076517', N'deo')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address]) VALUES (8, N'toan', N'123', N'cac', N'toanvan@gmail.com', NULL, N'third.png', N'01206076517', N'deo')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address]) VALUES (9, N'toan', N'123', N'toan', N'toanvan@gmail.com', NULL, N'first.png', N'01206076517', N'213654987654')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address]) VALUES (10, N'admin98', N'123', N'cac', N'admin98@gmail.com', NULL, N'anhchandung.jpg', N'01206076517', N'3213213231')
INSERT [dbo].[Users] ([Id], [Username], [Password], [Name], [Email], [RoleID], [ImageUser], [Phone], [Address]) VALUES (11, N'admin198', N'123', N'admin198', N'admin198@gmail.com', 3, N'anhchandung.jpg', N'01206076517', N'admin198')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Catalog]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_NavMenu] FOREIGN KEY([NavID])
REFERENCES [dbo].[NavMenu] ([Id])
GO
ALTER TABLE [dbo].[Catalog] CHECK CONSTRAINT [FK_Catalog_NavMenu]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PaymentStatus] FOREIGN KEY([PaymentStsID])
REFERENCES [dbo].[PaymentStatus] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_PaymentStatus]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shipper] FOREIGN KEY([ShipperID])
REFERENCES [dbo].[Shipper] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shipper]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Catalog] FOREIGN KEY([CatalogID])
REFERENCES [dbo].[Catalog] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Catalog]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_HistoryOfInputProduct] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[HistoryOfInputProduct] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_HistoryOfInputProduct]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [project2] SET  READ_WRITE 
GO
