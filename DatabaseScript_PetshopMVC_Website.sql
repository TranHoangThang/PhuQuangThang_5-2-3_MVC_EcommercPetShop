USE [master]
GO
/****** Object:  Database [ecommerce_db]    Script Date: 8/29/2024 2:11:42 PM ******/
CREATE DATABASE [ecommerce_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ecommerce_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ecommerce_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ecommerce_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ecommerce_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ecommerce_db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ecommerce_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ecommerce_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ecommerce_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ecommerce_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ecommerce_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ecommerce_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [ecommerce_db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ecommerce_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ecommerce_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ecommerce_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ecommerce_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ecommerce_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ecommerce_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ecommerce_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ecommerce_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ecommerce_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ecommerce_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ecommerce_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ecommerce_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ecommerce_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ecommerce_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ecommerce_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ecommerce_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ecommerce_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ecommerce_db] SET  MULTI_USER 
GO
ALTER DATABASE [ecommerce_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ecommerce_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ecommerce_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ecommerce_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ecommerce_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ecommerce_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ecommerce_db', N'ON'
GO
ALTER DATABASE [ecommerce_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [ecommerce_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ecommerce_db]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/29/2024 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 8/29/2024 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_id] [int] NOT NULL,
	[Ad_name] [varchar](255) NOT NULL,
	[Ad_pass] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/29/2024 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 8/29/2024 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/29/2024 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_date] [datetime] NULL,
	[status] [varchar](50) NULL,
	[total_amount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 8/29/2024 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[payment_type] [varchar](50) NOT NULL,
	[provider] [varchar](50) NOT NULL,
	[account_number] [varchar](50) NULL,
	[expiry_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 8/29/2024 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[image_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[image_url] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/29/2024 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [text] NULL,
	[price] [decimal](10, 2) NOT NULL,
	[stock_quantity] [int] NOT NULL,
	[category_id] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 8/29/2024 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[user_id] [int] NULL,
	[rating] [int] NULL,
	[comment] [text] NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingDetails]    Script Date: 8/29/2024 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingDetails](
	[shipping_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[shipping_address] [text] NOT NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[postal_code] [varchar](20) NULL,
	[country] [varchar](50) NULL,
	[shipping_date] [datetime] NULL,
	[delivery_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[shipping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 8/29/2024 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[order_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/29/2024 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](100) NULL,
	[full_name] [varchar](100) NULL,
	[phone_number] [varchar](20) NULL,
	[address] [text] NULL,
	[created_at] [datetime] NULL,
	[PasswordHash] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlists]    Script Date: 8/29/2024 2:11:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlists](
	[WishlistId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ProductId] [int] NOT NULL,
	[DateAdded] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[WishlistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (35, N'Food')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (36, N'Toy')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (37, N'Furniture')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (38, N'Clothing')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (39, N'Grooming')
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (40, N'Accessories')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (1, 1, 1, 1, CAST(699.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (2, 1, 4, 3, CAST(9.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (3, 2, 2, 1, CAST(999.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (4, 2, 3, 1, CAST(19.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (5, 3, 3, 2, CAST(19.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (6, 4, 4, 1, CAST(9.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (7, 5, 5, 1, CAST(499.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (8, 6, 6, 1, CAST(14.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (9, 7, 7, 1, CAST(79.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (10, 8, 8, 1, CAST(29.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (11, 9, 9, 1, CAST(299.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (12, 10, 10, 5, CAST(3.99 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [total_amount]) VALUES (1, 1, CAST(N'2024-08-17T08:26:50.287' AS DateTime), N'Processing', CAST(729.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [total_amount]) VALUES (2, 2, CAST(N'2024-08-17T08:26:50.287' AS DateTime), N'Shipped', CAST(1019.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [total_amount]) VALUES (3, 3, CAST(N'2024-08-17T08:26:50.287' AS DateTime), N'Delivered', CAST(39.98 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [total_amount]) VALUES (4, 4, CAST(N'2024-08-17T08:26:50.287' AS DateTime), N'Processing', CAST(9.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [total_amount]) VALUES (5, 5, CAST(N'2024-08-17T08:26:50.287' AS DateTime), N'Shipped', CAST(499.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [total_amount]) VALUES (6, 6, CAST(N'2024-08-17T08:26:50.287' AS DateTime), N'Delivered', CAST(14.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [total_amount]) VALUES (7, 7, CAST(N'2024-08-17T08:26:50.287' AS DateTime), N'Processing', CAST(79.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [total_amount]) VALUES (8, 8, CAST(N'2024-08-17T08:26:50.287' AS DateTime), N'Shipped', CAST(29.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [total_amount]) VALUES (9, 9, CAST(N'2024-08-17T08:26:50.287' AS DateTime), N'Delivered', CAST(299.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [status], [total_amount]) VALUES (10, 10, CAST(N'2024-08-17T08:26:50.287' AS DateTime), N'Processing', CAST(19.95 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON 

INSERT [dbo].[PaymentMethods] ([payment_id], [user_id], [payment_type], [provider], [account_number], [expiry_date]) VALUES (1, 1, N'Credit Card', N'Visa', N'4111111111111111', CAST(N'2025-12-31' AS Date))
INSERT [dbo].[PaymentMethods] ([payment_id], [user_id], [payment_type], [provider], [account_number], [expiry_date]) VALUES (2, 2, N'Credit Card', N'MasterCard', N'5500000000000004', CAST(N'2024-11-30' AS Date))
INSERT [dbo].[PaymentMethods] ([payment_id], [user_id], [payment_type], [provider], [account_number], [expiry_date]) VALUES (3, 3, N'PayPal', N'PayPal', N'user3@paypal.com', NULL)
INSERT [dbo].[PaymentMethods] ([payment_id], [user_id], [payment_type], [provider], [account_number], [expiry_date]) VALUES (4, 4, N'Credit Card', N'Visa', N'4111111111111112', CAST(N'2023-10-31' AS Date))
INSERT [dbo].[PaymentMethods] ([payment_id], [user_id], [payment_type], [provider], [account_number], [expiry_date]) VALUES (5, 5, N'Credit Card', N'MasterCard', N'5500000000000005', CAST(N'2025-09-30' AS Date))
INSERT [dbo].[PaymentMethods] ([payment_id], [user_id], [payment_type], [provider], [account_number], [expiry_date]) VALUES (6, 6, N'PayPal', N'PayPal', N'user6@paypal.com', NULL)
INSERT [dbo].[PaymentMethods] ([payment_id], [user_id], [payment_type], [provider], [account_number], [expiry_date]) VALUES (7, 7, N'Credit Card', N'Visa', N'4111111111111113', CAST(N'2023-08-31' AS Date))
INSERT [dbo].[PaymentMethods] ([payment_id], [user_id], [payment_type], [provider], [account_number], [expiry_date]) VALUES (8, 8, N'Credit Card', N'MasterCard', N'5500000000000006', CAST(N'2024-07-31' AS Date))
INSERT [dbo].[PaymentMethods] ([payment_id], [user_id], [payment_type], [provider], [account_number], [expiry_date]) VALUES (9, 9, N'PayPal', N'PayPal', N'user9@paypal.com', NULL)
INSERT [dbo].[PaymentMethods] ([payment_id], [user_id], [payment_type], [provider], [account_number], [expiry_date]) VALUES (10, 10, N'Credit Card', N'Visa', N'4111111111111114', CAST(N'2025-06-30' AS Date))
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (1, 22, N'https://i.pinimg.com/564x/0e/5d/2c/0e5d2c628a102eba97411deca54079e3.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (2, 23, N'https://i.pinimg.com/564x/5f/a5/41/5fa5415c514a8fcf9d22f90a6552b0f5.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (3, 24, N'https://i.pinimg.com/564x/34/d8/78/34d878868d60e6bc5221657580ace48b.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (4, 25, N'https://i.pinimg.com/564x/37/16/4b/37164b518a794d8dda0550008f7fde8f.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (5, 26, N'https://i.pinimg.com/564x/ad/db/d9/addbd92d79eb7fd0372c16ad9de1468b.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (6, 27, N'https://i.pinimg.com/564x/5f/c0/d0/5fc0d0b11f6f4a8115015ae517ca6a6f.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (7, 28, N'https://i.pinimg.com/564x/99/72/c8/9972c8617085f32a00c0e01c7d8eb99e.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (8, 29, N'https://i.pinimg.com/564x/bc/f3/d4/bcf3d40d3ca97c513275eff437162c01.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (9, 30, N'https://i.pinimg.com/564x/3a/b9/7d/3ab97d9b1c5f340dcc80c96022ebcf22.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (10, 31, N'https://i.pinimg.com/564x/3b/53/68/3b53684c6160c6be210e018b58a42587.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (11, 32, N'https://i.pinimg.com/564x/cd/92/be/cd92bebd0a66c155b99a5dc6df28028c.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (12, 33, N'https://i.pinimg.com/564x/c9/bc/15/c9bc15c2837cc54b4121564bded725ef.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (13, 34, N'https://i.pinimg.com/564x/9d/61/82/9d61824dd7e04afc2e335fbed952dc65.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (14, 35, N'https://i.pinimg.com/564x/04/f7/f8/04f7f86a9f448a1e66441b11a54a7849.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (15, 36, N'https://i.pinimg.com/564x/cd/2c/e3/cd2ce31f6773695b97b5224d975447c5.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (16, 37, N'https://i.pinimg.com/564x/16/34/37/16343789083ed8e4b6b0717413891416.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (17, 38, N'https://i.pinimg.com/564x/25/89/03/258903e0ef2f79132fa76ecd6bf3a62d.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (18, 39, N'https://i.pinimg.com/736x/d3/98/0b/d3980b2062cb87839893c62cffaa2609.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (19, 40, N'https://i.pinimg.com/564x/a0/32/47/a03247d88655d2a39dab12e2bb0feb67.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (20, 41, N'https://i.pinimg.com/736x/fb/d0/82/fbd08216fd8b7ae6a43b1b8e433c3f13.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (21, 42, N'https://i.pinimg.com/564x/6b/f9/94/6bf99470f534cb21838420e90d7864c9.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (22, 43, N'https://i.pinimg.com/564x/c4/98/25/c49825a8c0199135e8fceb10e92346dd.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (23, 44, N'https://i.pinimg.com/564x/de/82/8f/de828fe7259d0513a7bc01c491d3459f.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (24, 45, N'https://i.pinimg.com/736x/28/05/b8/2805b8ffdb91448afce77a547caea8f0.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (25, 46, N'https://i.pinimg.com/736x/39/45/3f/39453f3958228f1f685457ff462f14a0.jpg')
INSERT [dbo].[ProductImages] ([image_id], [product_id], [image_url]) VALUES (26, 47, N'https://i.pinimg.com/564x/c8/75/ca/c875ca7c7fc971d96eae0637dc10f097.jpg')
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (22, N'Premium Dog Food', N'High-quality dog food for all breeds.', CAST(50.00 AS Decimal(10, 2)), 100, 35, CAST(N'2024-08-23T19:46:49.613' AS DateTime), CAST(N'2024-08-23T19:46:49.613' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (23, N'Interactive Cat Toy', N'Fun toy to keep your cat engaged.', CAST(15.99 AS Decimal(10, 2)), 200, 36, CAST(N'2024-08-23T19:46:49.613' AS DateTime), CAST(N'2024-08-23T19:46:49.613' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (24, N'Modern Pet Furniture', N'Stylish and comfortable furniture for pets.', CAST(120.00 AS Decimal(10, 2)), 50, 37, CAST(N'2024-08-23T19:46:49.613' AS DateTime), CAST(N'2024-08-23T19:46:49.613' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (25, N'Pet Clothing - Winter Jacket', N'Warm jacket to keep your pet cozy during winter.', CAST(25.00 AS Decimal(10, 2)), 150, 38, CAST(N'2024-08-23T19:46:49.613' AS DateTime), CAST(N'2024-08-23T19:46:49.613' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (26, N'Pet Grooming Kit', N'Complete grooming kit for pets.', CAST(30.00 AS Decimal(10, 2)), 75, 39, CAST(N'2024-08-23T19:46:49.613' AS DateTime), CAST(N'2024-08-23T19:46:49.613' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (27, N'Pet Accessories Bundle', N'A bundle of essential accessories for pets.', CAST(40.00 AS Decimal(10, 2)), 80, 40, CAST(N'2024-08-23T19:46:49.613' AS DateTime), CAST(N'2024-08-23T19:46:49.613' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (28, N'Organic Cat Food', N'Nutritious food made with organic ingredients.', CAST(60.00 AS Decimal(10, 2)), 120, 35, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (29, N'Pet Puzzle Toy', N'Interactive puzzle toy for mental stimulation.', CAST(22.50 AS Decimal(10, 2)), 90, 36, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (30, N'Pet Bed - Small', N'Comfortable bed for small pets.', CAST(45.00 AS Decimal(10, 2)), 70, 37, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (31, N'Summer Pet T-Shirt', N'Lightweight t-shirt for pets.', CAST(15.00 AS Decimal(10, 2)), 200, 38, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (32, N'Luxury Pet Shampoo', N'High-end shampoo for a shiny coat.', CAST(18.00 AS Decimal(10, 2)), 150, 39, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (33, N'Pet Leash Set', N'Durable leash and collar set.', CAST(25.00 AS Decimal(10, 2)), 120, 40, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (34, N'Grain-Free Dog Food', N'Special formula for dogs with grain allergies.', CAST(55.00 AS Decimal(10, 2)), 85, 35, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (35, N'Chew Toy for Dogs', N'Durable chew toy for aggressive chewers.', CAST(12.99 AS Decimal(10, 2)), 250, 36, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (36, N'Cat Tree with Scratching Post', N'Multi-level cat tree for play and rest.', CAST(150.00 AS Decimal(10, 2)), 40, 37, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (37, N'Raincoat for Pets', N'Waterproof raincoat for pets.', CAST(28.00 AS Decimal(10, 2)), 95, 38, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (38, N'Pet Nail Trimmer', N'Safe and easy-to-use nail trimmer.', CAST(20.00 AS Decimal(10, 2)), 130, 39, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (39, N'Pet Travel Bag', N'Convenient travel bag for pets.', CAST(55.00 AS Decimal(10, 2)), 60, 40, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (40, N'Hypoallergenic Dog Food', N'Food specially formulated for dogs with allergies.', CAST(65.00 AS Decimal(10, 2)), 110, 35, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (41, N'Rubber Ball Toy', N'Bouncy rubber ball for active play.', CAST(9.99 AS Decimal(10, 2)), 300, 36, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (42, N'Pet Sofa Bed', N'Luxury sofa bed for pets.', CAST(200.00 AS Decimal(10, 2)), 35, 37, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (43, N'Pet Sweater', N'Warm sweater for pets.', CAST(30.00 AS Decimal(10, 2)), 180, 38, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (44, N'Pet Ear Cleaner', N'Gentle cleaner for pet ears.', CAST(15.00 AS Decimal(10, 2)), 140, 39, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (45, N'Pet ID Tags', N'Personalized ID tags for pets.', CAST(12.00 AS Decimal(10, 2)), 220, 40, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (46, N'Wet Dog Food', N'Canned wet food for dogs.', CAST(40.00 AS Decimal(10, 2)), 160, 35, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [stock_quantity], [category_id], [created_at], [updated_at]) VALUES (47, N'Plush Toy for Cats', N'Soft plush toy for cats.', CAST(14.00 AS Decimal(10, 2)), 260, 36, CAST(N'2024-08-23T19:50:32.850' AS DateTime), CAST(N'2024-08-23T19:50:32.850' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ShippingDetails] ON 

INSERT [dbo].[ShippingDetails] ([shipping_id], [order_id], [shipping_address], [city], [state], [postal_code], [country], [shipping_date], [delivery_date]) VALUES (1, 1, N'123 Main St', N'New York', N'NY', N'10001', N'USA', CAST(N'2024-08-17T08:28:36.700' AS DateTime), CAST(N'2024-08-20T08:28:36.700' AS DateTime))
INSERT [dbo].[ShippingDetails] ([shipping_id], [order_id], [shipping_address], [city], [state], [postal_code], [country], [shipping_date], [delivery_date]) VALUES (2, 2, N'456 Oak St', N'Los Angeles', N'CA', N'90001', N'USA', CAST(N'2024-08-17T08:28:36.700' AS DateTime), CAST(N'2024-08-22T08:28:36.700' AS DateTime))
SET IDENTITY_INSERT [dbo].[ShippingDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoppingCart] ON 

INSERT [dbo].[ShoppingCart] ([cart_id], [user_id], [product_id], [quantity], [order_id]) VALUES (1, 1, 1, 1, NULL)
INSERT [dbo].[ShoppingCart] ([cart_id], [user_id], [product_id], [quantity], [order_id]) VALUES (2, 2, 2, 1, NULL)
INSERT [dbo].[ShoppingCart] ([cart_id], [user_id], [product_id], [quantity], [order_id]) VALUES (3, 3, 3, 2, NULL)
INSERT [dbo].[ShoppingCart] ([cart_id], [user_id], [product_id], [quantity], [order_id]) VALUES (4, 4, 4, 1, NULL)
INSERT [dbo].[ShoppingCart] ([cart_id], [user_id], [product_id], [quantity], [order_id]) VALUES (5, 5, 5, 1, NULL)
INSERT [dbo].[ShoppingCart] ([cart_id], [user_id], [product_id], [quantity], [order_id]) VALUES (6, 6, 6, 1, NULL)
INSERT [dbo].[ShoppingCart] ([cart_id], [user_id], [product_id], [quantity], [order_id]) VALUES (7, 7, 7, 1, NULL)
INSERT [dbo].[ShoppingCart] ([cart_id], [user_id], [product_id], [quantity], [order_id]) VALUES (8, 8, 8, 1, NULL)
INSERT [dbo].[ShoppingCart] ([cart_id], [user_id], [product_id], [quantity], [order_id]) VALUES (9, 9, 9, 1, NULL)
INSERT [dbo].[ShoppingCart] ([cart_id], [user_id], [product_id], [quantity], [order_id]) VALUES (10, 10, 10, 5, NULL)
SET IDENTITY_INSERT [dbo].[ShoppingCart] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [password], [email], [full_name], [phone_number], [address], [created_at], [PasswordHash]) VALUES (1, N'john_doe', N'password123', N'john@example.com', N'John Doe', N'1234567890', N'123 Main St', CAST(N'2024-08-17T08:26:23.070' AS DateTime), NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [full_name], [phone_number], [address], [created_at], [PasswordHash]) VALUES (2, N'jane_smith', N'password123', N'jane@example.com', N'Jane Smith', N'0987654321', N'456 Oak St', CAST(N'2024-08-17T08:26:23.070' AS DateTime), NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [full_name], [phone_number], [address], [created_at], [PasswordHash]) VALUES (3, N'alice_jones', N'password123', N'alice@example.com', N'Alice Jones', N'1112223333', N'789 Pine St', CAST(N'2024-08-17T08:26:23.070' AS DateTime), NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [full_name], [phone_number], [address], [created_at], [PasswordHash]) VALUES (4, N'bob_brown', N'password123', N'bob@example.com', N'Bob Brown', N'4445556666', N'321 Maple St', CAST(N'2024-08-17T08:26:23.070' AS DateTime), NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [full_name], [phone_number], [address], [created_at], [PasswordHash]) VALUES (5, N'carol_white', N'password123', N'carol@example.com', N'Carol White', N'7778889999', N'654 Birch St', CAST(N'2024-08-17T08:26:23.070' AS DateTime), NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [full_name], [phone_number], [address], [created_at], [PasswordHash]) VALUES (6, N'dave_black', N'password123', N'dave@example.com', N'Dave Black', N'1231231234', N'987 Cedar St', CAST(N'2024-08-17T08:26:23.070' AS DateTime), NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [full_name], [phone_number], [address], [created_at], [PasswordHash]) VALUES (7, N'eva_green', N'password123', N'eva@example.com', N'Eva Green', N'4564564567', N'741 Elm St', CAST(N'2024-08-17T08:26:23.070' AS DateTime), NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [full_name], [phone_number], [address], [created_at], [PasswordHash]) VALUES (8, N'frank_young', N'password123', N'frank@example.com', N'Frank Young', N'7897897890', N'852 Ash St', CAST(N'2024-08-17T08:26:23.070' AS DateTime), NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [full_name], [phone_number], [address], [created_at], [PasswordHash]) VALUES (9, N'grace_king', N'password123', N'grace@example.com', N'Grace King', N'1591591591', N'963 Fir St', CAST(N'2024-08-17T08:26:23.070' AS DateTime), NULL)
INSERT [dbo].[Users] ([user_id], [username], [password], [email], [full_name], [phone_number], [address], [created_at], [PasswordHash]) VALUES (10, N'henry_clark', N'password123', N'henry@example.com', N'Henry Clark', N'9519519510', N'753 Walnut St', CAST(N'2024-08-17T08:26:23.070' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Wishlists] ON 

INSERT [dbo].[Wishlists] ([WishlistId], [UserId], [ProductId], [DateAdded]) VALUES (44, 10, 22, CAST(N'2024-08-28T23:18:57.093' AS DateTime))
INSERT [dbo].[Wishlists] ([WishlistId], [UserId], [ProductId], [DateAdded]) VALUES (45, 10, 23, CAST(N'2024-08-28T23:18:57.630' AS DateTime))
INSERT [dbo].[Wishlists] ([WishlistId], [UserId], [ProductId], [DateAdded]) VALUES (46, 10, 24, CAST(N'2024-08-28T23:18:58.453' AS DateTime))
INSERT [dbo].[Wishlists] ([WishlistId], [UserId], [ProductId], [DateAdded]) VALUES (47, 10, 25, CAST(N'2024-08-28T23:18:58.857' AS DateTime))
SET IDENTITY_INSERT [dbo].[Wishlists] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Wishlists] ADD  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH NOCHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[PaymentMethods]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Reviews]  WITH NOCHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH NOCHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCart_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[ShoppingCart] CHECK CONSTRAINT [FK_ShoppingCart_Orders]
GO
ALTER TABLE [dbo].[Wishlists]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Wishlists]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [ecommerce_db] SET  READ_WRITE 
GO
