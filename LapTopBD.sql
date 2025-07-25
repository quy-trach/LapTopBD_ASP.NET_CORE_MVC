USE [LaptopBD]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 7/7/2025 12:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[creationDate] [datetime] NOT NULL CONSTRAINT [DF__admin__creationD__117F9D94]  DEFAULT (getdate()),
	[updationDate] [datetime] NULL,
	[FullName] [nvarchar](100) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Roles] [nvarchar](20) NULL,
	[Status] [nvarchar](20) NOT NULL CONSTRAINT [DF__admin__Status__4316F928]  DEFAULT ('Ho?t đ?ng'),
 CONSTRAINT [PK__admin__3213E83F0895FBAE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[banner]    Script Date: 7/7/2025 12:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[banner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adminId] [int] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[imageUrl] [nvarchar](500) NOT NULL,
	[status] [bit] NOT NULL CONSTRAINT [DF__banner__status__6FE99F9F]  DEFAULT ('Active'),
	[creationDate] [datetime] NOT NULL CONSTRAINT [DF__banner__creation__70DDC3D8]  DEFAULT (getdate()),
	[updationDate] [datetime] NULL,
	[position] [int] NULL,
 CONSTRAINT [PK__banner__3213E83F1F446D93] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cartitems]    Script Date: 7/7/2025 12:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cartitems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[addeddate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[category]    Script Date: 7/7/2025 12:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adminId] [int] NOT NULL,
	[categoryName] [nvarchar](255) NOT NULL,
	[categoryDescription] [nvarchar](max) NULL,
	[creationDate] [datetime] NOT NULL DEFAULT (getdate()),
	[updationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orders]    Script Date: 7/7/2025 12:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[orderDate] [datetime] NOT NULL DEFAULT (getdate()),
	[paymentMethod] [nvarchar](50) NOT NULL,
	[orderStatus] [nvarchar](55) NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ordertrackhistory]    Script Date: 7/7/2025 12:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordertrackhistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NOT NULL,
	[status] [nvarchar](255) NOT NULL,
	[remark] [nvarchar](max) NULL,
	[postingDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 7/7/2025 12:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adminId] [int] NOT NULL,
	[category] [int] NOT NULL,
	[subCategory] [int] NULL,
	[productName] [nvarchar](255) NOT NULL,
	[productCompany] [nvarchar](255) NULL,
	[productPrice] [decimal](15, 2) NOT NULL,
	[productPriceBeforeDiscount] [decimal](15, 2) NULL,
	[productDescription] [nvarchar](max) NULL,
	[productImage1] [nvarchar](255) NULL,
	[productImage2] [nvarchar](255) NULL,
	[productImage3] [nvarchar](255) NULL,
	[shippingCharge] [int] NOT NULL,
	[postingDate] [datetime] NOT NULL CONSTRAINT [DF__products__postin__239E4DCF]  DEFAULT (getdate()),
	[updationDate] [datetime] NULL,
	[brand] [nvarchar](100) NULL,
	[cpu] [nvarchar](255) NULL,
	[ram] [nvarchar](255) NULL,
	[storage] [nvarchar](255) NULL,
	[gpu] [nvarchar](255) NULL,
	[promotion] [nvarchar](255) NULL,
	[VGA] [nvarchar](255) NULL,
	[ProductAvailability] [bit] NOT NULL CONSTRAINT [DF__products__Produc__17F790F9]  DEFAULT ((0)),
	[Slug] [nvarchar](255) NOT NULL DEFAULT (''),
 CONSTRAINT [PK__products__3213E83FD1F03240] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[productreviews]    Script Date: 7/7/2025 12:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productreviews](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[summary] [nvarchar](255) NULL,
	[review] [nvarchar](max) NULL,
	[reviewDate] [datetime] NOT NULL DEFAULT (getdate()),
	[rating] [int] NOT NULL,
	[userid] [nvarchar](255) NULL,
	[username] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[subcategory]    Script Date: 7/7/2025 12:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subcategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryid] [int] NOT NULL,
	[SubCategoryName] [nvarchar](255) NOT NULL,
	[creationDate] [datetime] NOT NULL DEFAULT (getdate()),
	[updationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 7/7/2025 12:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[contactno] [nvarchar](20) NULL,
	[password] [nvarchar](255) NOT NULL,
	[regDate] [datetime] NOT NULL DEFAULT (getdate()),
	[updationDate] [datetime] NULL,
	[city] [nvarchar](255) NOT NULL,
	[district] [nvarchar](255) NOT NULL,
	[ward] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[wishlist]    Script Date: 7/7/2025 12:23:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wishlist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[postingDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([id], [username], [password], [creationDate], [updationDate], [FullName], [Avatar], [Roles], [Status]) VALUES (2, N'admin', N'827ccb0eea8a706c4c34a16891f84e7b', CAST(N'2025-02-26 21:18:23.690' AS DateTime), CAST(N'2025-06-19 20:24:39.753' AS DateTime), N'Đoàn Trung Quý', N'/avatar/48186b04-a123-41fb-b45e-682f7cec6923.jpg', N'Admin', N'Hoạt động')
SET IDENTITY_INSERT [dbo].[admin] OFF
SET IDENTITY_INSERT [dbo].[banner] ON 

INSERT [dbo].[banner] ([id], [adminId], [title], [imageUrl], [status], [creationDate], [updationDate], [position]) VALUES (68, 2, N'Banner2', N'/uploads/banner/be40ea2c-f4a3-408b-bc9b-31c18099cda5_snapedit_1742834806685.jpeg', 1, CAST(N'2025-03-24 23:51:58.103' AS DateTime), CAST(N'2025-06-22 16:37:39.440' AS DateTime), 3)
INSERT [dbo].[banner] ([id], [adminId], [title], [imageUrl], [status], [creationDate], [updationDate], [position]) VALUES (69, 2, N'Banner3', N'/uploads/banner/3c6e3a79-1c11-4e5f-af2a-1df5b0b80b99_snapedit_1742834828592.jpeg', 0, CAST(N'2025-03-24 23:52:23.630' AS DateTime), CAST(N'2025-06-29 23:23:19.913' AS DateTime), 1)
INSERT [dbo].[banner] ([id], [adminId], [title], [imageUrl], [status], [creationDate], [updationDate], [position]) VALUES (77, 2, N'Banner1', N'/uploads/banner/f3803f78-d965-4210-8cce-2367d76f126c_snapedit_1742834773018.jpeg', 1, CAST(N'2025-03-25 23:53:38.853' AS DateTime), CAST(N'2025-04-06 16:46:50.567' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[banner] OFF
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [adminId], [categoryName], [categoryDescription], [creationDate], [updationDate]) VALUES (1, 2, N'MACBOOK', N'Macbook Company', CAST(N'2025-02-26 21:20:19.623' AS DateTime), CAST(N'2025-02-28 16:22:45.117' AS DateTime))
INSERT [dbo].[category] ([id], [adminId], [categoryName], [categoryDescription], [creationDate], [updationDate]) VALUES (2, 2, N'ASUS', N'Asus Company', CAST(N'2025-02-27 13:59:53.097' AS DateTime), CAST(N'2025-02-28 15:16:02.290' AS DateTime))
INSERT [dbo].[category] ([id], [adminId], [categoryName], [categoryDescription], [creationDate], [updationDate]) VALUES (4, 2, N'DELL', N'Dell Company', CAST(N'2025-02-27 14:00:20.223' AS DateTime), CAST(N'2025-03-24 16:39:05.457' AS DateTime))
INSERT [dbo].[category] ([id], [adminId], [categoryName], [categoryDescription], [creationDate], [updationDate]) VALUES (5, 2, N'LENOVO', N'Lenovo Company', CAST(N'2025-02-27 14:00:32.673' AS DateTime), CAST(N'2025-02-28 15:15:52.137' AS DateTime))
INSERT [dbo].[category] ([id], [adminId], [categoryName], [categoryDescription], [creationDate], [updationDate]) VALUES (62, 2, N'HP', N'HP Company', CAST(N'2025-03-18 09:22:15.383' AS DateTime), CAST(N'2025-03-25 22:12:56.290' AS DateTime))
INSERT [dbo].[category] ([id], [adminId], [categoryName], [categoryDescription], [creationDate], [updationDate]) VALUES (73, 2, N'LG', N'LG Company', CAST(N'2025-03-26 20:50:58.657' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (1, 6, 45, 1, CAST(N'2025-03-25 09:18:06.693' AS DateTime), N'COD', N'Cancelled', CAST(35190000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (2, 6, 45, 1, CAST(N'2025-03-25 09:19:42.860' AS DateTime), N'Online', N'Cancelled', CAST(35190000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (3, 6, 42, 1, CAST(N'2025-03-25 09:49:12.273' AS DateTime), N'COD', N'Cancelled', CAST(34990000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (4, 6, 47, 1, CAST(N'2025-03-25 09:55:16.723' AS DateTime), N'COD', N'Cancelled', CAST(50690000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (5, 6, 46, 1, CAST(N'2025-03-25 09:56:38.537' AS DateTime), N'COD', N'Cancelled', CAST(44690000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (6, 6, 47, 1, CAST(N'2025-03-25 13:32:29.947' AS DateTime), N'COD', N'Cancelled', CAST(50690000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (7, 6, 45, 1, CAST(N'2025-03-25 14:06:56.017' AS DateTime), N'COD', N'Cancelled', CAST(35190000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (8, 6, 47, 6, CAST(N'2025-03-25 15:06:23.357' AS DateTime), N'COD', N'Delivered', CAST(304140000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (9, 6, 47, 40, CAST(N'2025-03-25 15:09:08.887' AS DateTime), N'COD', N'Cancelled', CAST(2027600000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (10, 6, 45, 3, CAST(N'2025-03-25 15:49:45.840' AS DateTime), N'COD', N'Cancelled', CAST(105570000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (11, 6, 45, 6, CAST(N'2025-03-25 17:31:39.467' AS DateTime), N'COD', N'Delivered', CAST(211140000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (12, 6, 45, 1, CAST(N'2025-03-25 17:31:39.487' AS DateTime), N'COD', N'Shipped', CAST(35190000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (13, 6, 47, 1, CAST(N'2025-03-26 04:07:41.973' AS DateTime), N'COD', N'Shipped', CAST(50690000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (14, 6, 43, 2, CAST(N'2025-03-26 05:31:32.313' AS DateTime), N'COD', N'Delivered', CAST(59998000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (16, 30, 42, 5, CAST(N'2025-03-26 13:27:29.867' AS DateTime), N'COD', N'Pending', CAST(174950000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (17, 30, 43, 1, CAST(N'2025-03-26 13:28:07.570' AS DateTime), N'COD', N'Shipped', CAST(29999000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (18, 31, 47, 2, CAST(N'2025-03-26 13:47:38.323' AS DateTime), N'Online', N'Cancelled', CAST(101380000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (19, 31, 47, 2, CAST(N'2025-03-26 13:48:11.440' AS DateTime), N'COD', N'Shipped', CAST(101380000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (20, 6, 43, 1, CAST(N'2025-04-06 09:45:53.550' AS DateTime), N'COD', N'Cancelled', CAST(29999000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (21, 6, 47, 1, CAST(N'2025-04-27 15:37:10.550' AS DateTime), N'COD', N'Shipped', CAST(50690000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (22, 6, 46, 35, CAST(N'2025-06-22 09:44:27.713' AS DateTime), N'COD', N'Cancelled', CAST(1564150000.00 AS Decimal(18, 2)))
INSERT [dbo].[orders] ([id], [userId], [productId], [quantity], [orderDate], [paymentMethod], [orderStatus], [TotalPrice]) VALUES (23, 6, 45, 4, CAST(N'2025-06-29 16:25:05.620' AS DateTime), N'COD', N'Cancelled', CAST(140760000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (23, 2, 2, 8, N'Laptop ASUS ROG Flow Z13 GZ302EA-RU080WS', NULL, CAST(77990000.00 AS Decimal(15, 2)), CAST(80990000.00 AS Decimal(15, 2)), N'ASUS ROG Flow Z13 GZ302EA-RU080WS là tablet gaming mạnh nhất thế giới, được trang bị CPU Strix Halo và iGPU tích hợp với hiệu năng tương đương GPU rời, cùng 32GB RAM hợp nhất hỗ trợ quad-channel. Sản phẩm sở hữu màn hình cảm ứng ROG Nebula 2.5K 180Hz, phủ Gorilla Glass 5 DXC và khung máy CNC với thiết kế mỏng nhẹ chỉ 1.2kg, mang đến trải nghiệm gaming di động đỉnh cao.', N'/uploads/productimages/1aff2f1c-86dd-4b22-8bd4-de4a98eaf1cb_rog_flow_z13_1.jpg', N'/uploads/productimages/09d12833-8883-465d-8fb6-f518705cf86a_rog_flow_z13_2.jpg', N'/uploads/productimages/8f70fb27-cf53-440d-89e5-2d7967a9c55d_rog_flow_z13_3.jpg', 0, CAST(N'2025-03-16 12:26:16.223' AS DateTime), CAST(N'2025-03-16 12:26:16.223' AS DateTime), N'ASUS', N'AMD Ryzen AI MAX+ 395', N'32GB LPDDR5X Onboard', N'1TB PCIe 4.0 NVMe M.2 SSD (2230)', N'AMD Radeon Graphics', N'20%', N'Độ sáng 500nits Độ phủ màu DCI-P3 100% ROG Nebula Display Support Dolby Vision HDR', 1, N'laptop-asus-rog-flow-z13-gz302ea-ru080ws')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (24, 2, 2, 8, N'Laptop ASUS ROG Strix G16 G614JU-N4450W', NULL, CAST(35490000.00 AS Decimal(15, 2)), CAST(40990000.00 AS Decimal(15, 2)), N'Laptop Asus ROG Strix G16 G614JU N4450W sở hữu bộ xử lý thế hệ thứ 13 của Intel mang tên Core i7-13650HX Processor 2.6GHz 14 lõi cùng VGA RTX 4050. Sản phẩm tích hợp RAM 16GB DDR5 mở rộng tối đa 32GB và bộ nhớ trong dung lượng 1TB chuẩn kết nối tốc độ cao M.2 PCIe. Màn hình lớn 16 inch tỷ lệ 16:10 mang đến chất lượng hiển thị đỉnh cao chuẩn QHD+ và siêu mượt mà với tốc độ làm tươi 240Hz. ', N'/uploads/productimages/c977bbf5-dee3-47c3-b979-46de237dd37c_asus_g16_1.png', N'/uploads/productimages/e8fc8a85-3cb1-47c8-a10e-8fe037ed3a1f_asus_g16_2.png', N'/uploads/productimages/4ac3a82f-f2d0-49f4-91f4-2d8865253796_asus_g16_3.png', 0, CAST(N'2025-03-16 12:30:23.487' AS DateTime), CAST(N'2025-03-16 12:30:23.487' AS DateTime), N'ASUS', N'Intel Core i7-13650HX (2.6 GHz 24M Cache, up to 4.9 GHz, 14 lõi: 6 P-cores and 8 E-cores)', N'DDR5-4800 SO-DIMM', N'1TB PCIe 4.0 NVMe M.2 SSD 2x DDR5 SO-DIMM slots 2x M.2 PCIe', N'NVIDIA GeForce RTX 4050 (194 AI TOPs) 6GB GDDR6', N'20%', N'Độ sáng 500nits Độ phủ màu DCI-P3 100% Màn hình chống chói G-Sync Dolby Vision HDR ROG intelligent cooling ROG Nebula Display', 1, N'laptop-asus-rog-strix-g16-g614ju-n4450w')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (25, 2, 2, 8, N'Laptop Asus Gaming ROG Zephyrus G16', NULL, CAST(61990000.00 AS Decimal(15, 2)), CAST(67990000.00 AS Decimal(15, 2)), N'Hãy quên đi những chiếc laptop gaming cồng kềnh truyền thống! Asus ROG Zephyrus G16 GA605WI-QR156WS mang đến phong cách hoàn toàn khác biệt với thiết kế sắc sảo, mỏng nhẹ và dải LED Slash Lightning tinh tế. Ngoài ra, sản phẩm còn sở hữu chip AMD Ryzen AI 9 HX 370, card đồ họa NVIDIA RTX 4070 và màn hình OLED 3K 240Hz, giúp bạn thống trị mọi trận đấu và nâng tầm trải nghiệm gaming.', N'/uploads/productimages/3b0dd604-58d5-4f06-835a-03800e70d429_rogzephyrus_g16_1.png', N'/uploads/productimages/4a8e60c5-8489-4a75-a63a-c8dda49577e6_rogzephyrus_g16_2.png', N'/uploads/productimages/9525a464-0307-402b-a0a2-301467ecbf8c_rogzephyrus_g16_3.png', 0, CAST(N'2025-03-16 12:37:51.977' AS DateTime), CAST(N'2025-06-07 21:48:23.757' AS DateTime), N'ASUS', N'AMD Ryzen AI 9 HX 370 2.0GHz (36MB Cache, up to 5.1GHz, 12 lõi, 24 luồng)', N'32GB LPDDR5X Onboard', N'1TB PCIe 4.0 NVMe M.2 SSD (2 Khe cắm M.2 hỗ trợ SATA hoặc NVMe, nâng cấp tối đa 2TB)', N'NVIDIA GeForce RTX 4070 8GB GDDR6 (321 AI TOPs) AMD Radeon Graphics', N'30%', N'AMD XDNA NPU up to 50TOPS', 1, N'laptop-asus-gaming-rog-zephyrus-g16')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (26, 2, 1, 3, N'Apple MacBook Pro 13 M2 2022 8GB 256GB ', NULL, CAST(39990000.00 AS Decimal(15, 2)), CAST(40990000.00 AS Decimal(15, 2)), N'Hiệu năng vượt trội - Chip M2, 10 nhân GPU xử lý tốt các Photoshop, Illustrator, Premiere, xử lý các video 4K
16GB Ram, 512GB - Đa nhiệm tốt, mở cùng lúc trên Safari hay nhiều ứng dụng
Thiết kế mỏng nhẹ tinh tế - Vỏ kim loại, trọng lượng chỉ 1.4kg
Trải nghiệm giải trí cực đã - Màn hình 13.3 inch, độ phân giải 2560 x 1600 cho chất lượng hiển thị cực rõ ràng', N'/uploads/productimages/47e8124b-e6ed-49af-954e-3ee9f393e9a2_macpro_m2_1.jpg', N'/uploads/productimages/bcd4620b-6815-4333-a3bd-87e28d24d8f7_macpro_m2_2.jpg', N'/uploads/productimages/4e520b06-f813-4cb7-90e9-11d8a095fd97_macpro_m2_3.jpg', 0, CAST(N'2025-03-16 12:42:51.867' AS DateTime), CAST(N'2025-03-16 12:42:51.867' AS DateTime), N'Apple', N'Apple M2 tám nhân CPU', N'16GB', N'512GB SSD', N'10 nhân GPU', N'10%', N'13 inches', 1, N'apple-macbook-pro-13-m2-2022-8gb-256gb-')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (27, 2, 1, 3, N'MacBook Pro 14 M4 10CPU 10GPU', NULL, CAST(39990000.00 AS Decimal(15, 2)), CAST(45990000.00 AS Decimal(15, 2)), N'MacBook Pro 14 inch M4 16GB 512GB mang nguồn sức mạnh ấn tượng với con chip M4 10 lõi, GPU 10 lõi Neural Engine 16 lõi khai phá tiềm năng AI kinh ngạc, nâng cấp hiệu năng vượt trội. MacBook sở hữu RAM 16GB mạnh mẽ với tốc độ băng thông 120GB/s cho mọi thao tác trơn tru và được xử lý tốc độ. Bộ nhớ 512GB với loại ổ cứng SSD đem đến không gian lưu trữ lớn cùng khả năng truy xuất dữ liệu tốc độ cao đồng thời bảo vệ dữ liệu an toàn.', N'/uploads/productimages/557f7d1a-1ade-49b4-9f52-bd3c323dbd22_mb_m4_1.jpg', N'/uploads/productimages/36d9179e-5b44-411e-9492-f267b97e6887_mb_m4_2.jpg', N'/uploads/productimages/3b4020c7-e085-43aa-9ae3-0e4e2233fee6_mb_m4_3.jpg', 0, CAST(N'2025-03-16 12:48:06.020' AS DateTime), CAST(N'2025-03-16 12:48:06.020' AS DateTime), N'Apple', N'Apple M4 10 lõi với 4 lõi hiệu năng và 6 lõi tiết kiệm điện', N'16GB', N'512GB', N'10 lõi Neural Engine 16 lõi', N'30%', N'Màn hình Liquid Retina XDR XDR (Extreme Dynamic Range) Độ sáng XDR: 1.000 nit ở chế độ toàn màn hình, độ sáng đỉnh 1.600 nit (chỉ nội dung HDR) 1 tỷ màu Dải màu rộng (P3) Công nghệ True Tone Hỗ trợ tối đa hai màn hình ngoài', 1, N'macbook-pro-14-m4-10cpu-10gpu')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (28, 2, 1, 3, N' Apple MacBook Pro 13 M2 2022 16GB 512GB', NULL, CAST(39990000.00 AS Decimal(15, 2)), CAST(50000000.00 AS Decimal(15, 2)), N'Hiệu năng vượt trội - Chip M2, 10 nhân GPU xử lý tốt các Photoshop, Illustrator, Premiere, xử lý các video 4K
16GB Ram, 512GB - Đa nhiệm tốt, mở cùng lúc trên Safari hay nhiều ứng dụng
Thiết kế mỏng nhẹ tinh tế - Vỏ kim loại, trọng lượng chỉ 1.4kg
Trải nghiệm giải trí cực đã - Màn hình 13.3 inch, độ phân giải 2560 x 1600 cho chất lượng hiển thị cực rõ ràng', N'/uploads/productimages/e7e768df-73ba-4827-8fa3-a51f60a82618_mac_pro_m2_1.jpg', N'/uploads/productimages/f8608ed4-63dc-4215-9168-ce02aead7a35_mac_pro_m2_2.jpg', N'/uploads/productimages/f85d7319-2ea0-4d3d-8d1b-5b6eda88d282_mac_pro_m2_3.jpg', 0, CAST(N'2025-03-16 12:54:33.577' AS DateTime), CAST(N'2025-03-25 22:43:01.657' AS DateTime), N'Apple', N'Apple M2 tám nhân CPU', N'16GB', N'512GB SSD', N'10 nhân GPU', N'30%', N'13 inches', 0, N'-apple-macbook-pro-13-m2-2022-16gb-512gb')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (35, 2, 5, 29, N'Laptop Lenovo ThinkPad E14 Gen 6 Ultra 7', NULL, CAST(27990000.00 AS Decimal(15, 2)), CAST(28990000.00 AS Decimal(15, 2)), N'Laptop Lenovo ThinkPad E14 Gen 6 Ultra 7 (21M7004UVN) một trong những sự lựa chọn hàng đầu cho những ai tìm kiếm một chiếc laptop văn phòng có hiệu năng mạnh mẽ nhờ chip AI Intel Core Ultra 7 cùng kiểu dáng hiện đại.
• Laptop Lenovo này sở hữu nét đặc trưng của dòng ThinkPad với vẻ ngoài cứng cáp với các đường nét tinh tế. Vỏ máy được làm từ kim loại - nhôm với màu đen bóng bẩy truyền thống, tạo nên vẻ ngoài thanh lịch và chuyên nghiệp. 

• Kích thước máy khá nhẹ 1.44 kg khiến cho việc di chuyển dễ dàng, thích hợp cho những bạn thường xuyên di chuyển nhiều ngoài đường. Máy còn được trang bị đèn bàn phím đơn sắc màu trắng, giúp bạn làm việc hiệu quả ngay cả trong điều kiện ánh sáng yếu.

• Máy đạt độ bền chuẩn quân đội MIL STD 810H đảm bảo máy có thể chịu đựng các điều kiện khắc nghiệt như va đập, nhiệt độ cao và độ ẩm. Ngoài ra, tính năng mở khóa khuôn mặt và bảo mật vân tay giúp bạn truy cập máy nhanh chóng và an toàn.

• Laptop có các cổng kết nối đa dạng, bao gồm: LAN (RJ45), HDMI, USB 3.2,... đảm bảo kết nối tiện lợi cho mọi nhu cầu công việc và giải trí.

• Được trang bị công nghệ CPU Intel Core Ultra 7 155U, phù hợp cho nhiều tác vụ khác nhau. Với 12 nhân và 14 luồng, máy xử lý tốt công việc văn phòng, thiết kế đồ họa 2D và render video ngắn. Ngoài ra, con chip này cũng hỗ trợ giải trí đa phương tiện, học tập trực tuyến và phân tích dữ liệu hiệu quả. 

• Đây là mẫu laptop RAM 16 GB DDR5 với tốc độ bus 5600 MHz, đảm bảo khả năng xử lý nhanh chóng và hiệu quả các ứng dụng đa nhiệm. Ổ cứng SSD NVMe PCIe 4.0 dung lượng 512 GB mang đến tốc độ đọc/ghi dữ liệu nhanh chóng. Ngoài ra, máy còn khả năng tháo ra và nâng cấp ổ cứng lên tối đa 1 TB, cung cấp không gian lưu trữ rộng rãi hơn.

• Laptop Lenovo ThinkPad được trang bị card đồ họa tích hợp Intel Graphics, mang lại hiệu suất đồ họa ổn định và tiết kiệm năng lượng. Card đồ họa tích hợp này phù hợp cho các tác vụ hàng ngày như lướt web, xem phim, và làm việc với các ứng dụng văn phòng.

• Thinkpad e14 gen 6 sở hữu màn hình 14 inch với độ phân giải WUXGA (1920 x 1200), mang đến hình ảnh sắc nét và chi tiết. Tấm nền IPS không chỉ cung cấp góc nhìn rộng mà còn giữ cho màu sắc và độ sáng ổn định từ mọi góc độ, tạo ra trải nghiệm xem tốt hơn.

• Ngoài ra, công nghệ chống chói Anti Glare giúp giảm thiểu hiện tượng chói mắt khi sử dụng laptop trong môi trường ánh sáng mạnh.

• Lenovo thinkpad e14 còn được trang bị công nghệ âm thanh cao cấp để nâng cao trải nghiệm giải trí và làm việc. Hệ thống loa được hiệu chỉnh bởi Harman/Kardon kết hợp công nghệ Dolby Atmos, mang lại chất lượng âm thanh rõ ràng và sống động.

Nếu bạn đang tìm kiếm sự mỏng nhẹ và cao cấp hơn trong dòng ThinkPad, ThinkPad T14s là một lựa chọn đáng chú ý, tuy nhiên, ThinkPad E14 Gen 6 vẫn là sự cân bằng lý tưởng giữa hiệu năng và giá cả, phù hợp với đa số người dùng văn phòng.', N'/uploads/productimages/2a2cd518-77a4-4228-a708-f099b5b2f792_thinkpad-e14-1.jpg', N'/uploads/productimages/1db04d41-eea9-4eec-a28a-f2a7d67a3889_thinkpad-e14-2.jpg', N'/uploads/productimages/18db5a78-2321-4d75-993e-b5a6a1814f78_thinkpad-e14-3.jpg', 0, CAST(N'2025-03-18 08:21:42.943' AS DateTime), CAST(N'2025-03-19 10:05:04.373' AS DateTime), N'Lenovo', N'Intel Core Ultra 7 Meteor Lake - 155U - 1.7GHz', N'16 GB - DDR5 2 khe (1 khe 16 GB + 1 khe rời)', N'512 GB SSD NVMe PCIe 4.0 (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'Card tích hợp - Intel Graphics', N'20%', N'Độ sáng 500nits Độ phủ màu DCI-P3 100% Màn hình chống chói G-Sync Dolby Vision HDR ROG intelligent cooling ROG Nebula Display', 1, N'laptop-lenovo-thinkpad-e14-gen-6-ultra-7')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (36, 2, 4, 12, N'Laptop Dell Inspiron 5625 99VP91', NULL, CAST(20490000.00 AS Decimal(15, 2)), CAST(24990000.00 AS Decimal(15, 2)), N'Laptop Dell Inspiron 5625 99VP91 - Tối ưu cho thao tác xử lý công việc tiện lợi
Nếu bạn đang chọn lựa một chiếc laptop có cấu hình chất lượng cùng kiểu dáng linh hoạt để làm việc từ xa thuận tiện hơn, laptop Dell Inspiron 5625 99VP91 - với vi xử lý Ryzen 7 mạnh mẽ, bộ nhớ lưu trữ 512 GB và thời lượng pin lâu dài chắc chắn sẽ đồng hành cùng bạn hoàn tất mọi công việc có trong ngày.

Phong cách màu bạc sang trọng cùng màn hình 16 inch sắc nét
Laptop Dell Inspiron 5625 99VP91 nhận được sự chú ý của rất nhiều người làm việc từ xa nhờ thiết kế di chuyển đầy tiện lợi. Kiểu dáng mỏng gọn với trọng lượng nhẹ là yếu tố giúp Dell Inspiron 5625 99VP91 “ghi điểm” lớn. Lớp vỏ được hoàn thiện tinh xảo với màu bạc tạo nên ngoại hình sang trọng cho máy. Laptop Dell Inspiron 5625 99VP91 cũng tích hợp bộ bàn phím full-size và touchpad chạm đa điểm cho thao tác sử dụng thêm linh hoạt.

Đánh giá thiết kế Dell Inspiron 5625 99VP91

Laptop Dell Inspiron 5625 99VP91 trang bị màn hình rộng tận 16 inch với độ phân giải Full HD (1920 x 1080) cung cấp hình ảnh góc rộng sắc nét. Nhằm hỗ trợ cho nhu cầu theo dõi nội dung ở môi trường ngoài trời, màn hình laptop Dell Inspiron 5625 99VP91 có tính năng chống chói sáng giúp ngăn phản chiếu để bạn dễ quan sát. Góc trên màn hình cũng tích hợp webcam chất lượng Full HD kèm màn che ống kính để bạn yên tâm họp online cũng như bảo vệ quyền riêng tư.

Sức mạnh ấn tượng với Ryzen 7 cùng thời lượng pin dài
Dell Inspiron 5625 99VP91 chứa đựng hiệu năng tuyệt vời cho các nhu cầu làm việc của bạn. Bên trong laptop 16 inch hiện diện bộ CPU AMD Ryzen 7 với 8 nhân xử lý, cùng đồ họa onboard AMD Radeon cung cấp hiệu suất xử lý ổn định bền lâu. Laptop Dell Inspiron 5625 99VP91 cũng trang bị RAM 8 GB chuẩn DDR4 và ổ cứng SSD dung lượng tận 512 GB tạo kho lưu trữ cực rộng.

Đánh giá hiệu năng Dell Inspiron 5625 99VP91

Laptop Dell Inspiron 5625 99VP91 cũng trang bị thêm hệ điều hành Windows đời mới. Ngoài ra, điểm nổi bật khác ở laptop Dell Inspiron 5625 99VP91 chính là viên pin 4 cell 54 Wh, giúp mang lại thời lượng sử dụng cực lâu dài để bạn thoải mái làm việc lẫn giải trí trong một lần sạc đầy.

', N'/uploads/productimages/b34b525d-c93f-4d3d-9a83-bdc987927593_dell_5625_1.jpg', N'/uploads/productimages/3245cc41-b946-447e-8e02-33941dd3e943_dell_5625_2.jpg', N'/uploads/productimages/97b463ad-bbe9-41ea-9496-c43af4b43563_dell_5625_3.jpg', 0, CAST(N'2025-03-19 10:47:14.823' AS DateTime), CAST(N'2025-03-19 10:47:14.823' AS DateTime), N'Dell', N' AMD Ryzen 7 5825U', N'8GB - DDR4/ 3200MHz', N'512GB SSD PCIe (M.2 2230) – combo M.2 2230 / 2280', N'AMD Radeon Graphics', N'30%', N'16 inches Công nghệ màn hình  Màn hình chống loá  -   1920 x 1080 pixels (FullHD)', 1, N'laptop-dell-inspiron-5625-99vp91')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (37, 2, 4, 12, N'Laptop Dell Inspiron 15 3515 G6GR72', NULL, CAST(10990000.00 AS Decimal(15, 2)), CAST(15990000.00 AS Decimal(15, 2)), N'Laptop Dell Inspiron 3515 được đánh giá làchiếc laptop có cấu hình chất lượng cùng kiểu dáng linh hoạt để làm việc từ xa thuận tiện hơn. Cùng với vi xử lý Ryzen 5 mạnh mẽ, bộ nhớ lưu trữ 256 GB và thời lượng pin khá lâu chắc chắn sẽ đồng hành cùng bạn hoàn tất mọi công việc có trong ngày. 

Phong cách màu Đen sang trọng cùng màn hình 15.6 inch sắc nét
Dell Inspiron 3515 nhận được sự chú ý của rất nhiều người dùng nhờ thiết kế di chuyển đầy tiện lợi. Cùng với đó chính là kiểu dáng mỏng gọn và lớp vỏ màu đen tinh xảo tạo nên ngoại hình sang trọng, tinh tế cho máy. 

Laptop Dell Inspiron 15 3515 G6GR72

Laptop Dell Inspiron 3515 được trang bị màn hình rộng tận 15.6 inch với độ phân giải Full HD (1920 x 1080) cung cấp hình ảnh góc rộng sắc nét. Nhằm hỗ trợ cho nhu cầu theo dõi nội dung ở môi trường ngoài trời, màn hình laptop Dell Inspiron này có tính năng chống chói sáng giúp đôi mắt bạn theo dõi nội dụng tốt hơn ở những điều kiện thừa sáng (ngoài sân, hướng đèn,...).

Sức mạnh ấn tượng với Ryzen 5 cùng thời lượng pin dài
Laptop Dell Inspiron 3515 chứa đựng hiệu năng tuyệt vời cho các nhu cầu làm việc của bạn. Bên trong máy hiện diện bộ CPU AMD Ryzen 5 với 4 nhân xử lý, cùng đồ họa onboard AMD Radeon cung cấp hiệu suất xử lý ổn định bền lâu. Laptop Dell Inspiron 15 3515 G6GR72 cũng trang bị RAM 8 GB chuẩn DDR4 và ổ cứng SSD dung lượng 256 GB tạo kho lưu trữ rộng.', N'/uploads/productimages/d7c9d30a-5053-44bc-bdd4-b80187c91d2c_dell_3515_1.jpg', N'/uploads/productimages/0445b73b-d8d0-44f3-a93a-651dea37b0b7_dell_3515_2.jpg', N'/uploads/productimages/4160bbac-8966-43d2-8596-87bac6f20ca6_dell_3515_3.jpg', 0, CAST(N'2025-03-19 10:49:32.667' AS DateTime), CAST(N'2025-03-25 22:42:53.790' AS DateTime), N'Dell', N'AMD Ryzen 5-3450U ( upto 3,5Ghz,4mb)', N'8GB - DDR4', N'256GB SSD M.2 PCIe', N'AMD Radeon Graphics', N'20%', N'15.6 inches -1920 x 1080 pixels (FullHD)', 0, N'laptop-dell-inspiron-15-3515-g6gr72')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (38, 2, 4, 12, N'Dell Inspiron 16 Plus 7640 | Ultra 7', NULL, CAST(21490000.00 AS Decimal(15, 2)), CAST(26790000.00 AS Decimal(15, 2)), N'Dell Inspiron 16 Plus 7640 được xem là chiếc laptop văn phòng sở hữu hiệu năng mạnh mẽ đi cùng với lối thiết kế đơn giản nhưng vẫn khoác lên mình vẻ đẹp hết sức hiện đại và sang trọng. Máy sở hữu bộ vi xử lý Intel Core Ultra 7 đời mới nhất mang đến khả năng xử lý nhanh chóng và mượt mà mọi tác vụ văn phòng, đồ họa hay các tựa game phổ biến. Hãy cùng T&T Center tìm hiểu kỹ hơn về các thông số của máy thông qua bài viết này nhé! 

Đánh giá Dell Inspiron 16 Plus 7640 - Laptop giá rẻ, bền bỉ, hiệu năng ổn định
Thiết kế cao cấp, bền bỉ 
Dell Inspiron 16 Plus 7640 sở hữu thiết kế với độ build máy chắc chắn giúp cho máy luôn được ổn định và chống được va đập tốt. Về thiết kế thì máy được thiết kế theo hướng tối giản nhưng lại sở hữu kiểu dáng vô cùng hiện đại và đẹp mắt. Nổi bật giữa chiếc máy là logo Dell giúp nhận diện thương hiệu.

Thiết kế cao cấp, bền bỉ 
Dell vẫn giữ lối thiết kế bản lề Elorift có góc nghiêng 3-5 độ giúp cho quá trình gõ phím được linh hoạt hơn. Trọng lượng của máy là 2.18kg một thông số cũng không quá nặng nên người dùng vẫn dễ dàng mang theo máy khi đi học hay đi làm.

Màn hình 16-inch FHD+ hiển thị cực sắc nét
Màn hình của Dell Inspiron 16 Plus 7640 có kích thước 16 inch với độ phân giải FHD+ (1920 x 1200) mang đến chất lượng hiển thị hình ảnh vô cùng sống động và sắc nét. Tỷ lệ khung hình 16:10 mang đến cho người dùng không gian hiển thị rộng lớn hơn theo chiều dọc.

Màn hình 16-inch FHD+ hiển thị cực sắc nét
Màn hình của máy hỗ trợ cảm ứng đa điểm hỗ trợ người dùng thao tác lướt web một cách dễ dàng. Với độ sáng màn hình đạt 300 nits, hỗ trợ người dùng có thể làm việc trong điều kiện ánh sáng mạnh.  

Hiệu năng mạnh mẽ, khả năng làm việc vượt trội
Đằng sau ngoại hình tối giản ấy là ẩn chứa một sức mạnh vượt trội đến từ bộ vi xử lý Intel Core Ultra 7-155H đời mới nhất mang đến hiệu năng mạnh mẽ, xử lý mọi tác vụ một cách nhanh chóng và mượt mà. 
Máy hỗ trợ Card đồ họa tích hợp Intel Arc Graphics cho phép người dùng có thể chơi mượt một số tựa game phổ biến như: Liên Minh Huyền Thoại ở độ phân giải 1080p với FPS duy trì ổn định từ 60 trở lên.

Hiệu năng mạnh mẽ, khả năng làm việc vượt trội
Với dung lượng RAM 32GB mang đến khả năng đa nhiệm mượt mà, người dùng có thể mở một lúc đồng thời một lúc nhiều tabs cũng không bị tình trạng giật lag. Ổ cứng SSD 1TB mang đến cho người dùng không gian lưu trữ thoải mái, có thể lưu trữ khối lượng lớn hình ảnh hay video trong quá trình sử dụng. 

Bảo mật tiên tiến, webcam chất lượng tốt
Dell Inspiron 16 Plus 7640 hỗ trợ bảo mật có thể nhận diện bằng khuôn mặt qua camera IR được tích hợp bằng tính năng Windows Hello cùng với camera FHD 1080p giúp mang lại hình ảnh rõ nét khi hội họp trực tuyến. Bên cạnh đó, máy còn trang bị thêm tính năng E-Shutter giúp bảo vệ quyền riêng tư cho người dùng. 

Bảo mật tiên tiến, webcam chất lượng tốt

Hệ thống cổng kết nối đầy đủ 
Dell Inspiron 16 Plus 7640 được trang bị đầy đủ các cổng kết nối hỗ trợ người dùng có thể dễ dàng kết nối với các thiết bị ngoại vi khác như: Bàn phím, chuột, HDMI,...

Hệ thống cổng kết nối đầy đủ 

2 x USB 3.2 Gen 1 Type-A ports
2 x Thunderbolt 4.0 ports
1 x Universal audio jack
1 x HDMI 1.4 port (The maximum resolution supported over HDMI is 1920×1080 @60Hz. No 4K/2K output)
1 x SD-card slot
Mua Dell Inspiron 16 Plus 7640 cũ giá rẻ tại T&T Center
Dell Inspiron 16 Plus 7640 chính là sự lựa chọn lý tưởng cho những ai đang muốn sở hữu một chiếc laptop có hiệu năng mạnh mẽ, thiết kế bền bỉ, màn hình cảm ứng sắc nét cùng với khả năng xử lý đồ họa chuyên nghiệp thì đây chính là sự lựa chọn hàng đầu mà người dùng đáng cân nhắc. 

Mua Dell Inspiron 16 Plus 7640 cũ giá rẻ tại T&T Center
Nếu bạn muốn sở hữu Dell Inspiron 16 Plus 7640 với mức giá tốt nhất đi kèm với nhiều chương trình ưu đãi hấp dẫn và chế độ bảo hành dài lâu thì có thể ghé ngay đến hệ thống chuỗi cửa hàng T&T Center trên toàn quốc trải nghiệm và mua sắm máy ngay nhé. Liên hệ ngay số Hotline: 0898.143.789 để được tư vấn và hỗ trợ thêm về máy. ', N'/uploads/productimages/b29e2549-27c2-4396-9d2b-d29bd194836f_dell_16plus_1.jpg', N'/uploads/productimages/d78ce84c-b04b-4807-b699-ec4733154d0e_dell_16plus_2.jpg', N'/uploads/productimages/1bbb3b3e-4537-4028-bbe2-592a1520ba7b_dell_16plus_3.jpg', 0, CAST(N'2025-03-19 10:52:33.087' AS DateTime), CAST(N'2025-03-19 10:52:33.087' AS DateTime), N'Dell', N'Intel® Core™ Ultra 7 processor 155H (24MB cache, 16 cores, 22 threads, up to 4.8 GHz)', N'32GB, 2x16GB, LPDDR5X, 6400MT/s', N'1TB M.2 PCIe NVMe Solid State Drive', N'Intel® Arc™ graphics', N'20%', N'16.0-inch 16:10 FHD+ (1920 x 1200) Touch 300nits WVA Display with ComfortView Plus Support', 1, N'dell-inspiron-16-plus-7640-|-ultra-7')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (39, 2, 4, 12, N'Dell Inspiron 5430', NULL, CAST(14890000.00 AS Decimal(15, 2)), CAST(16300000.00 AS Decimal(15, 2)), N'Chiếc laptop văn phòng Dell Inspiron 14 5430 với những cải tiến mới
Chắc chắn Dell Inspiron 5430 có thể là một chiếc laptop mà vừa có thể đáp ứng tốt các nhu cầu học tập và làm việc của người sử dụng, nhưng giá cả lại cực kỳ hợp lý phải chăng. Đây là dòng máy tính xách tay chạy chip Intel mới nhất của Dell trong năm 2023.

Dell Inspiron 5430

Về thiết kế
Dell Inspiron 5430 có thiết kế nhỏ gọn, bắt mắt và hiệu năng tốt với một mức giá vô cùng hấp dẫn. Với thiết kế phong cách chuyên nghiệp và tinh xảo, Dell Inspiron 5430 có thiết kế đẹp, mạnh mẽ và độ mỏng ấn tượng. 

Dell Inspiron 5430 được hoàn thiện từ vỏ nhôm cao cấp làm tăng độ sang trọng mà cũng tăng độ bền cho máy. Màn hình viền được thiết kế mỏng hơn ở cạnh trên và dưới. Với tỉ lệ màn 16:10 thì tổng thể máy nhìn vuông và thời thượng giống như Dell inspiron 5445 cùng phân khúc. 

Bản lề có thêm phần nhô ra và ổn định ở một số góc độ nhất định. Thiết kế vững chắc, có thể nâng được giúp tăng độ nghiêng bàn phím. Với thiết kế này sẽ tăng trải nghiệm thao tác phím, cũng như tăng hiệu quả tản nhiệt cho máy. 

Màn hình 
Dell Inspiron 5430 có màn hình 14’’ FHD WUXGA cùng tỉ lệ màn 16:10 cho góc rộng lên tới 170 độ. Màn hình viền mỏng tạo cảm giác thân trên máy lớn hơn, đem đến trải nghiệm chân thực với độ chính xác màu cao. Công nghệ Comfort View cho phép trải nghiệm hiển thị mượt mà, dịu mắt giúp người dùng sử dụng máy trong thời gian dài mà không bị mỏi mắt. 



Bàn phím và touchpad trên Dell Inspiron 14 5430
Không khác với tiền nhiệm là bao nhiêu, Dell Inspiron 5430 cho thấy được sự chắc chắn và cứng cáp và tạo cảm giác thoải mái khi nhập liệu trên chiếc laptop này. Máy có độ nảy phím cao, hành trình phím cũng đủ sâu với keycap mịn.

Điểm cộng của phần Touchpad là có kích thước lớn, giúp cho những thao tác đa điểm trở nên thoải mái và dễ dàng hơn. Mặt touchpad được phủ một lớp kính mịn, được hỗ trợ Driver Windows Precision nên có độ chính xác ổn định.

Cổng kết nối
Không hổ danh là chiếc laptop xứng tầm năm nửa đầu năm 2023, Dell Inspiron 5430 vẫn được trang bị đầy đủ hệ thống cổng kết nối. 

2x USB 3.2 Gen 1 Type A
1x USB Type-C Thunderbolt 4.0 port with DisplayPort and Power Delivery
1x HDMI 1.4 port
1x  SD-card slot
1x Jack tai nghe 3.5mm
1x Power-adapter port 4.5 mm x 2.9 mm DC-in

Cấu hình
Dell đã không ngần ngại trang bị cho Dell Inspiron 5430 con chip năm 2023 mới nhất của Intel. Với hiệu năng mạnh mẽ từ Core i5 1340P đem đến khả năng phản hồi đáng kinh ngạc và đa nhiệm mượt mà. Bộ đôi có 10 nhân 12 luồng, chắc chắn Dell Inspiron sẽ hoạt động ổn định, mạnh mẽ suốt thời gian dài một cách ổn định.

Việc tích hợp card đồ họa Intel Iris Xe Graphics để đảm bảo máy có thể đáp ứng đầy đủ mọi tác vụ học tập cơ bản đến phức tạp. Sở hữu RAM 16GB LPDDR5, 512GB PCIe NVMe SSD cho phép khả năng đa nhiệm mượt mà, cùng lúc xử lý nhiều tác vụ. 

Laptop Dell Inspiron 5430 là một chiếc laptop thiết kế sang trọng, gọn nhẹ, màn hình chất lượng đi kèm hiệu năng mạnh mẽ. Thật sự trong phân khúc giá tầm trung, Laptop Dell Inspiron 14 5430 là một mẫu sản phẩm rất đáng để người dùng đầu tư.', N'/uploads/productimages/90a3f298-f8b0-4f77-a239-ccbcd889cff6_dell_5430_2.jpg', N'/uploads/productimages/46092ad3-2de5-4a9d-a2f4-6e05daad31b6_dell_5430_3.jpg', N'/uploads/productimages/906c85c8-2082-4fe5-8352-8beb062b5c6d_dell_5430_1.jpg', 0, CAST(N'2025-03-19 10:56:26.663' AS DateTime), CAST(N'2025-03-19 10:56:26.663' AS DateTime), N'Dell', N'Intel Core i5-1340P (12MB cache, up to 4.6 GHz, 12 cores)', N'16GB LPDDR5, 4800 MT/s', N'SSD 512GB M.2 PCIe NVMe', N'Intel Iris Xe Graphics', N'20%', N'14'''' 16:10 FHD+ (1920 x 1200) Anti-glare 250nits WVA Display with ComfortView Support', 1, N'dell-inspiron-5430')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (40, 2, 5, 21, N'Lenovo Legion 5 Y7000 15IRX9 (2024)', NULL, CAST(29989998.00 AS Decimal(15, 2)), CAST(35989999.00 AS Decimal(15, 2)), N'Lenovo Legion Y7000P (2024) là chiếc trong những chiếc laptop gaming tốt nhất của Lenovo ở thời điểm hiện tại. Chiếc máy tính này có đầy đủ các yếu tố như ngoại hình hút ánh nhìn, chất lượng hoàn thiện cao, màn hình sắc nét. Đặc biệt hiệu năng được nâng cấp mạnh mẽ với CPU Intel 14th cùng Card RTX 40 series. Do đó các tựa game AAA chưa bao giờ làm khó được chiếc laptop này. Cùng LAPVIP tìm hiểu chi tiết về sản phẩm này trong bài viết dưới đây nhé.

lenovo-legion-y7000p-2024-1-1709723607.jpg

Ngoại hình cuốn hút, đậm chất gaming 
Xét về mặt thiết kế, Legion Y7000P (2024) vẫn giữ nguyên những điểm đặc trưng nhất của dòng Laptop Gaming Y với đường nét khoẻ khoẳn, vuông vắn, các góc cạnh được làm tỉ mỉ nhưng lại không quá hầm hố. 

Chiếc máy tính này có độ hoàn thiện cao với phần vỏ máy được làm từ nhôm chắc chắn. Phần mặt trên hay khu vực bàn phím cũng không có hiện tượng flex. Phần đáy của máy lại được làm bằng lớp nhựa cao cấp, giúp giảm trọng lượng. Do đó chiếc máy tính này chỉ nặng 2.3kg với kích thước 360 x 267 x 19.9~22.8 mm, nên bạn hoàn toàn có thể bỏ máy vào balo để mang theo khi đi làm. 

lenovo-legion-y7000p-2024-7-1709723600.jpg

Về màu sắc, Lenovo Legion Y7000P có màu Storm Grey đơn giản nhưng nam tính, lịch lãm. Chính giữa mặt A nổi bật với logo "chữ Y" được "cắt làm đôi" đem lại điểm nhấn ấn tượng. 

Màn hình Lenovo Legion Y7000P (2024) có độ phân giải cao 
Chiếc laptop Lenovo Legion mới này được trang bị màn hình 16 inch với độ phân giải cao WQXGA (2560x1600 pixels) cho chất lượng hiển thị sống động, sắc nét. Kết hợp với đó là tỷ lệ khung hình 16:10 cho chất lượng hiển thị nhiều hơn theo chiều dọc.

lenovo-legion-y7000p-2024-3-1709723594.jpg

Độ sáng màn hình ở mức vừa phải đạt 350 nits, đủ để nó hoạt động tốt trong nhà. Độ bao phủ màu đạt 100% sRGB,  dải màu rộng, màu sắc phong phú, sống động, phù hợp với các nhà thiết kế đồ hoạ. Màn hình có tần số quét 165Hz, mang lại cho người dùng những hình ảnh chuyển động một cách mượt mà và độ chính xác hoàn hảo đến từng điểm ảnh khi bạn trải nghiệm những tựa game cần tốc độ khung hình cao như: CSGO, Overwatch,.

Các cổng kết nối trên Lenovo Legion Y7000P (2024)
Cũng giống như người đàn anh của mình, chiếc laptop Lenovo Legion Y7000P được nhà sản xuất trang bị đầy đủ các cổng kết nối, giúp người dùng có thể dễ dàng kết nối với các thiết bị ngoại vi trong quá trình làm việc. Máy tính có hai cổng USB-C 3.2 Gen 2, hai cổng USB-A 3.2 Gen 2, một đầu đọc thẻ nhớ thông minh SD, cổng HDMI, cổng RJ-45,  và giắc cắm tai nghe 3.5mm.

Trải nghiệm bàn phím và touchpad 
Lenovo đã trang bị cho chiếc máy tính này dạng bàn phím TrueStrike với hành trình phím tương đối sâu, layout được bố trí hợp lý, các phím có độ nảy cao mang đến trải nghiệm tương tối tốt. Nhìn chung chất lượng bàn phím Legion Y7000P chẳng thua kém bất cứ chiếc bàn phím cơ nào. Đồng  thời bàn phím còn có đèn nền, hỗ trợ các game thủ chơi game dễ dàng hơn vào ban đêm. 

lenovo-legion-y7000p-2024-2-1709723617.jpg

Touchpad được thiết kế khá lớn và không bị rít khi mình rê chuột. Đồng thời bàn phím cũng cho khả năng tracking nhanh và chính xác khi thực hiện các thao tác đa nhiệm.

Thừa sức mạnh để cân mọi tựa game AAA hiện nay 
Chiếc máy tính xách tay chơi game này được trang bị một hiệu năng siêu khủng. Máy tính được trang bị bộ vi xử lý Intel thế hệ 14 Meteor Lake với nhiều tùy chọn đi kèm bao gồm: Core™ i7-14650HX và Core i7-14700HX. Cả hai con chip này đều mang đến sức mạnh vượt trội, giúp nó chạy mượt các ứng dụng văn phòng hay đồ họa nặng.

lenovo-legion-y7000p-2024-6-1709723571.jpg

Chưa hết, chiếc máy tính này còn có card đồ họa NVIDIA Geforce RTX 4060 8GB cho phép người dùng render video, chỉnh sửa hình ảnh hay chơi các tựa game hot như CSGO, FO4, Genshin Impact,... ở mức cài đặt medium đến high một cách mượt mà. Thêm vào đó là sự hỗ trợ của công nghệ Ray Tracing và thuật toán DLSS lên đến thế hệ 3 để tăng cường tối đa hiệu quả upscale, mang đến nhiều khung hình hơn trong khi vẫn đảm bảo chất lượng hình ảnh.

Đi kèm với hai tuỳ chọn CUP trên sẽ là 16GB RAM chuẩn DDR5, cho phép nó chạy mượt các ứng dụng văn phòng, đồ hoạ. Nhưng nếu thường xuyên chiến game hay làm đồ họa nặng thì bạn nên cân nhắc đến việc lắp thêm RAM. Ngoài ra, dung lượng ổ cứng SSD 1TB PCIe NVMe M.2, không chỉ giúp máy tính khởi động nhanh chóng mà còn mang đến không gian lưu trữ lớn trong quá trình làm việc.

Tổng kết 
Nói tóm lại, với ngoại hình cuốn hút, màn hình có độ phân giải cao, đa dạng cổng kết nối cùng hiệu năng mạnh mẽ thì Lenovo Legion Y7000P (2024) sẽ là một chiếc laptop gaming có “sức nặng" so với nhiều đối thủ trong cùng phân khúc. Cá nhân mình thấy chiếc laptop này hoàn toàn xứng đáng với giá tiền của nó. Còn bạn, bạn thấy chiếc laptop gaming này như thế nào. Hãy để lại bình luận xuống dưới bài viết này cho mình biết với nhé.

', N'/uploads/productimages/01a2be73-0d86-4ed6-b0f6-0a1780e833eb_lenovo_y7000_1.png', N'/uploads/productimages/0bbbea28-6204-4fd8-af48-56d832d44ecf_lenovo_y7000_2.png', N'/uploads/productimages/17e592ad-19b9-46a7-983d-ecc88e26717c_lenovo_y7000_3.png', 0, CAST(N'2025-03-19 10:59:57.840' AS DateTime), CAST(N'2025-06-23 23:45:34.243' AS DateTime), N'Lenovo', N'Core™ i7-14650HX, 16C (8P + 8E) / 24T, P-core up to 5.2GHz, E-core up to 3.7GHz, 30MB Cache', N'16GB DDR5 5600Mhz', N'1TB PCIe NVMe M.2 SSD Gen 4 SSD', N'NVIDIA Geforce RTX 4060 8GB GDDR6', N'20%', N'16" WQXGA (2560x1600) IPS, non-touch, 16:10, 350nits, 165Hz, 100% sRGB, Dolby Vision, AMD FreeSync Premium, NVidia G-Sync, DC dimmer', 1, N'lenovo-legion-5-y7000-15irx9-2024')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (42, 2, 5, 21, N'Laptop Lenovo Legion 5 15IRX9', NULL, CAST(34990000.00 AS Decimal(15, 2)), CAST(37990000.00 AS Decimal(15, 2)), N'Sở hữu bộ vi xử lý intel Core i7 13650HX đình đám, Lenovo Legion 5 15IRX9 i7 cung cấp hiệu năng cực kỳ ấn tượng, hỗ trợ chơi game tối ưu và mang lại trải nghiệm giải trí bùng nổ cho các game thủ. Ngoài ra, sản phẩm còn được trang bị card đồ họa rời RTX 4060 đi kèm màn hình 144Hz siêu mượt mà.

lenovo-gaming-legion-5-15irx9-i7-13650hx-0.jpg
Mang lại hiệu năng vượt ngoài mong đợi
Nhằm đem đến cho game thủ những trải nghiệm tốt nhất khi chơi game, Lenovo đã đưa lên sản phẩm Legion 5 15IRX9 con chip Intel Core i7 13650HX đặc biệt xuất sắc. Đạt mức xung nhịp cơ bản là 2.6 GHz và xung nhịp cực đại lên đến 4.9 GHz, bộ vi xử lý này cho phép laptop chơi tốt các tựa game AAA như Far Cry 6 hay Elden Ring, đồng thời hỗ trợ người dùng chỉnh sửa video hoặc dựng hình 3D hiệu quả.

Với 14 nhân và 20 luồng, trong đó gồm 6 nhân hiệu suất cao đi kèm 8 nhân tiết kiệm năng lượng, Intel Core i7 13650HX đáp ứng tốt trải nghiệm gaming mà vẫn duy trì mức tiêu thụ pin hiệu quả để kéo dài thời lượng sử dụng giữa mỗi lần sạc. 

lenovo-gaming-legion-5-15irx9-i7-13650hx-1.jpg
Lựa chọn lý tưởng cho game thủ và giới sáng tạo
Ngoài thế mạnh ở chip xử lý, Legion 5 15IRX9 còn gây ấn tượng với card đồ họa rời RTX 4060 với kiến trúc NVIDIA Ada Lovelace tối tân nhất hiện tại. Nhờ đó, bạn sẽ thỏa sức đắm chìm vào thế giới trò chơi hoành tráng với hiệu ứng dò tia Ray Tracing hiện đại. Bối cảnh chiến trường đã mắt trong game như hiện ra chân thật trước tầm mắt bạn, vừa sống động vừa chi tiết.

Thêm vào đó, GPU này còn giúp chiếc laptop quản lý năng lượng và hạn chế tỏa nhiệt hữu hiệu dù sở hữu thân máy gọn gàng. Công nghệ Max-Q góp phần tối ưu hiệu suất hệ thống cùng thời lượng pin, song song với việc tối ưu trải nghiệm âm thanh đạt hiệu quả cao nhất.

lenovo-gaming-legion-5-15irx9-i7-13650hx-3.jpg
Thoát nhiệt hiệu quả, thỏa sức chơi game
Trên sản phẩm Legion 5 15IRX9, Lenovo đã áp dụng kỹ nghệ tản nhiệt độc quyền của hãng là Legion ColdFront Hyper. Đây là thành quả sau nhiều năm nghiên cứu, tận dụng các quạt quay hướng vào trong hệ thống và liên tục đẩy khí nóng ra ngoài thông qua góc phía sau của thiết bị.

Lối thiết kế thông minh từ Lenovo giúp laptop Legion 5 15IRX9 vừa đạt được hiệu suất tản nhiệt tối ưu, vừa đẩy nhiệt ra hướng không gây ảnh hưởng đến người dùng, qua đó giúp người dùng gia tăng độ tập trung khi giải trí hoặc làm việc mà không bị làm phiền bởi nhiệt độ tỏa ra từ laptop. Lenovo cho biết hãng ứng dụng buồng kín chuyên dụng trong thân máy để chứa nhiệt, giúp giảm thêm 2 độ C và giảm tiếng ồn thêm 2dB.

lenovo-gaming-legion-5-15irx9-i7-13650hx-5.jpg
Chip AI đặc biệt giúp chơi game hiệu quả
Hệ thống trí tuệ nhân tạo AI Engine+ của Lenovo giúp vận hành hệ thống mượt mà hơn và hỗ trợ tốt cho trải nghiệm gaming của người dùng. Cụ thể, chip xử lý chuyên dụng AI LA1 bên trong Legion 5 15IRX9 sẽ tự động tinh chỉnh cấu hình tự động phù hợp cho từng tựa game mà bạn chơi, qua đó đạt được hiệu năng CPU và GPU tối ưu nhất. Nhờ đó, bạn sẽ dễ dàng khai phá tiềm năng ẩn giấu của chiếc laptop gaming mà không cần phải thực hiện bước tinh chỉnh thủ công phức tạp nào.

lenovo-gaming-legion-5-15irx9-i7-13650hx-8.jpg
Màn hình với tần số quét 144Hz siêu mượt
Để mang lại cho người dùng trải nghiệm gaming thật ấn tượng thì ngoài cấu hình xuất sắc, laptop cần phải sở hữu màn hình thật chất lượng. Ở khía cạnh này, Lenovo Legion 5 15IRX9 ghi điểm nhờ không gian hiển thị rộng 15,6 inch với tấm nền IPS chất lượng cao, đạt độ phân giải 1.920 x 1.080 pixels sắc nét.

Đặc biệt, tần số quét 144Hz giúp diễn đạt các tiết tấu chuyển động trong game cực mượt mà, cực kỳ phù hợp với những ai yêu thích dòng game FPS tốc độ cao, đòi hỏi phản xạ chớp nhoáng để giành chiến thắng trong các pha giao tranh. Khả năng diễn đạt màu sắc chính xác với độ phủ màu 100% sRGB hỗ trợ tốt cho các tác vụ thiết kế, chỉnh sửa ảnh và sáng tạo nội dung.

lenovo-gaming-legion-5-15irx9-i7-13650hx-6.jpg
Bàn phím linh hoạt, thoải mái làm việc và giải trí
Sở hữu Legion 5 15IRX9, bạn có thể làm chủ mọi trận chiến của mình thông qua bàn phím Legion TrueStrike của Lenovo. Với tốc độ phản hồi ấn tượng cùng hành trình phím 1.5mm, bàn phím này cho phép bạn thao tác rất hiệu quả, nhanh nhạy. Đây là lợi thế giúp ích nhiều cho cả tác vụ giải trí và công việc, để bạn soạn thảo văn bản nhanh, gõ code và nhập liệu hiệu quả.

Hệ thống đèn nền chạy dưới bàn phím cho phép người dùng quan sát rõ ràng trong đêm, đồng thời tạo nên nét nhấn nhá cần thiết về thẩm mỹ. Touchpad rộng mở hỗ trợ cảm ứng đa điểm rất tiện dụng, dễ dàng thao tác.
', N'/uploads/productimages/a2aadc18-512b-427b-8106-45261264d318_lenovo-legion-5-15irx9_1.jpg', N'/uploads/productimages/42d2ca06-444a-4f31-9716-534c8520c5e1_lenovo-legion-5-15irx9_2.jpg', N'/uploads/productimages/794ef9b2-36a1-4182-b67a-9674469485a4_lenovo-legion-5-15irx9_3.jpg', 0, CAST(N'2025-03-24 00:51:19.557' AS DateTime), CAST(N'2025-03-24 16:14:13.323' AS DateTime), N'Lenovo', N'Intel Core i7 Raptor Lake - 13650HX', N'24 GB -DDR5 2 khe (1 khe 12 GB + 1 khe 12 GB)', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'Card rời - NVIDIA GeForce RTX 4060, 8 GB', N'20%', N'G-Sync Tấm nền IPS Chống chói Anti Glare Độ sáng 300 nits', 1, N'laptop-lenovo-legion-5-15irx9')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (43, 2, 5, 19, N'Laptop Lenovo Yoga 7 2in1 14IML9 Ultra 5', NULL, CAST(29999000.00 AS Decimal(15, 2)), CAST(39990000.00 AS Decimal(15, 2)), N'Laptop Lenovo Yoga 7 2-in-1 14IML9 83DJ001FVN - Vẻ ngoài tinh tế, sức mạnh vượt trội
Laptop Lenovo Yoga 7 2-in-1 14IML9 83DJ001FVN đã thu hút đông đảo sự chú ý của giới công nghệ nhờ những ưu điểm tuyệt vời từ thiết kế đến hiệu năng. Chiếc laptop Lenovo Yoga này không những có tính thẩm mỹ cao mà còn mang sức mạnh vượt trội cùng tính năng linh hoạt.

RAM dung lượng lớn 16GB, thỏa sức lưu trữ với SSD 512GB
Laptop Lenovo Yoga 7 2-in-1 14IML9 83DJ001FVN được trang bị dung lượng RAM 16GB dễ dàng xử lý nhanh chóng các công việc đa nhiệm phức tạp. Tuy không có khả năng nâng cấp, dung lượng này vẫn đủ đáp ứng tốt cho những người làm việc với các ứng dụng đồ họa, video hay chơi game.

Cấu hình laptop Lenovo Yoga 7 2-in-1 14IML9 83DJ001FVN

Về lưu trữ, Lenovo Yoga 7 14IML9 83DJ001FVN sở hữu ổ cứng SSD M.2 2242 PCIe 4.0x4 NVMe với dung lượng 512GB. Dòng ổ cứng này vừa mang lại tốc độ truy xuất nhanh chóng vừa giúp tối ưu năng lượng điện tiêu thụ. Bên cạnh đó, laptop còn hỗ trợ nâng cấp lên tới 1TB, mang lại sự linh hoạt trong việc mở rộng không gian lưu trữ khi cần thiết.

Vẻ ngoài mỏng nhẹ thời trang, thiết kế 2-in-1 linh hoạt
Laptop Lenovo Yoga 7 2-in-1 14IML9 83DJ001FVN gây ấn tượng với vẻ ngoài sang trọng và kiểu dáng mỏng nhẹ. Với kích thước 317.72 x 222.13 x 16.64 mm và trọng lượng chỉ 1.49 kg, chiếc laptop là giải pháp tuyệt vời cho những người thường xuyên di chuyển. Về màu sắc, laptop chỉ có duy nhất phiên bản màu xám Storm Grey sang trọng, phù hợp với gu thẩm mỹ của nhiều người.

Thiết kế  laptop Lenovo Yoga 7 2-in-1 14IML9 83DJ001FVN

Vỏ máy Lenovo Yoga 7 14IML9 83DJ001FVN được hoàn thiện từ nhôm cao cấp, mang lại độ bền bỉ vượt thời gian. Với thiết kế 2-in-1, bản lề của máy cho phép xoay gập ấn tượng để có thể linh hoạt chuyển đổi giữa chế độ, đáp ứng tốt các nhu cầu sử dụng khác nhau.

Sức mạnh ấn tượng với CPU Ultra 7 155H và Intel Arc Graphics
Laptop Lenovo Yoga 7 2-in-1 14IML9 83DJ001FVN được trang bị bộ vi xử lý Intel Core Ultra 7 155H mạnh mẽ với 16 nhân (6P + 8E + 2LPE) và 22 luồng, xung nhịp tối đa lên tới 4.8GHz. Chiếc CPU Ultra 7 155H này không chỉ đáp ứng tốt các tác vụ văn phòng, học tập mà còn đủ mạnh để chạy các phần mềm yêu cầu cao.

Cấu hình  laptop Lenovo Yoga 7 2-in-1 14IML9 83DJ001FVN

Đi kèm với CPU Intel Core Ultra 7 155H là card đồ họa tích hợp Intel Arc Graphics. Mặc dù đây không phải card đồ họa rời chuyên dụng nhưng Intel Arc Graphics vẫn có thể đáp ứng tốt các nhu cầu đồ họa cơ bản, xem phim, chỉnh sửa ảnh hay chơi game nhẹ nhàng.

Pin Li-ion dung lượng 71Wh, màn hình WUXGA sống động
Laptop Lenovo Yoga 7 2-in-1 14IML9 83DJ001FVN được trang bị pin Li-ion dung lượng 71Wh cho thời gian sử dụng ấn tượng. Thời lượng pin thực tế sẽ phụ thuộc vào cách sử dụng, nhưng nhìn chung laptop có thể đáp ứng tốt nhu cầu trong một ngày mà không cần phải sạc nhiều lần. Đi kèm với đó là bộ sạc 65W USB-C, giúp người dùng nhanh chóng nạp đầy năng lượng cho máy.

Màn hình  laptop Lenovo Yoga 7 2-in-1 14IML9 83DJ001FVN

Màn hình của Lenovo Yoga 7 14IML9 83DJ001FVN độ phân giải WUXGA (1920 x 1200) đầy ấn tượng cùng kích thước 14 inch. Màn hình sử dụng tấm nền OLED cao cấp cho khả năng hiển thị màu sắc sống động đến 100% DCI-P3 cùng độ tương phản cao. Màn hình máy còn tích hợp công nghệ Dolby Vision, Display HDR True Black 500 nhằm mang lại chất lượng hiển thị đắm chìm.

Mua ngay laptop Lenovo Yoga 7 2-in-1 14IML9 83DJ001FVN chính hãng, giá ưu đãi tại CellphoneS
Laptop Lenovo Yoga 7 2-in-1 14IML9 83DJ001FVN là sự lựa chọn hoàn hảo cho những ai cần một thiết bị mạnh mẽ, linh hoạt và tinh tế. Hiện nay, chiếc laptop tuyệt vời này đã có mặt tại chuỗi cửa hàng bán lẻ CellphoneS. Hãy đến mua sắm ngay hôm nay để sở hữu Lenovo Yoga 7 2-in-1 14IML9 83DJ001FVN chính hãng với giá thành hấp dẫn.', N'/uploads/productimages/d3a84b12-4347-48e3-aad9-1ea2fa0be16a_lenovo-yoga-7-1.jpg', N'/uploads/productimages/121d260f-9d09-4d88-95f1-851a10f82c44_lenovo-yoga-7-2.jpg', N'/uploads/productimages/d71e8fc8-75f1-43d4-bdcd-5b1d29c15e12_lenovo-yoga-7-3.jpg', 0, CAST(N'2025-03-24 16:53:40.173' AS DateTime), CAST(N'2025-03-24 17:18:52.950' AS DateTime), N'Lenovo', N'Intel Core Ultra 5 Meteor Lake - 125H -1.2GHz', N'16 GB - LPDDR5X (Onboard)', N'512 GB SSD NVMe PCIe 4.0 (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'Card tích hợp - Intel Arc Graphics', N'30%', N'14" - WUXGA, OLED - 60Hz - 100% DCI-P3 - Chuẩn DisplayHDR True Black 500 Low Blue Light anti-fingerprint - OLED Dolby Vision 400 nits - Cảm ứng', 1, N'laptop-lenovo-yoga-7-2in1-14iml9-ultra-5')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (44, 2, 62, 31, N'Laptop HP Pavilion 15 eg3093TU', NULL, CAST(17990000.00 AS Decimal(15, 2)), CAST(21290000.00 AS Decimal(15, 2)), N'Laptop HP Pavilion 15-EG3093TU 8C5L4PA - Đáp ứng mọi tác vụ văn phòng 
Laptop HP Pavilion 15-EG3093TU 8C5L4PA là một thiết bị có hiệu năng mạnh mẽ, đáp ứng đa dạng nhu cầu sử dụng của người dùng. Đây là một lựa chọn hấp dẫn cho những người dùng đòi hỏi hiệu năng cao và khả năng làm việc hiệu quả trên máy tính xách tay.

Ram chuẩn DDR4, ổ cứng PCIe nhanh nhạy
Laptop HP Pavilion 15-EG3093TU 8C5L4PA được trang bị một hệ thống RAM 16B DDR4 với tốc độ Bus RAM lên đến 3200 MHz. Đặc biệt là khi làm việc với các ứng dụng đòi hỏi bộ nhớ cao hoặc xử lý tác vụ nặng.

Laptop HP Pavilion 15-EG3093TU 8C5L4PA

Với ổ cứng SSD NVMe PCIe dung lượng 512GB, laptop cung cấp khả năng truy xuất dữ liệu nhanh chóng. Từ đó giúp mở ứng dụng và tải dữ liệu một cách nhanh nhẹn hơn. 

Thiết kế mỏng nhẹ, sang trọng 
HP Pavilion 15-EG3093TU 8C5L4PA thuộc phân khúc laptop 20 triệu có thiết kế mỏng nhẹ với khối lượng chỉ 1.74 kg. Nhờ đó, bạn có thể thoải mái mang theo máy tính này khi bạn cần di chuyển hoặc làm việc bên ngoài.

Laptop HP Pavilion 15-EG3093TU 8C5L4PA

Vỏ của laptop được làm từ kim loại, tạo cảm giác chắc chắn và sang trọng. Nắp lưng của máy được làm từ chất liệu cao cấp, mang lại sự kết hợp hoàn hảo giữa độ bền và thiết kế hiện đại. Thiết kế này không chỉ đẹp mắt mà còn thể hiện tính năng và sự tiện dụng của máy tính.

Mua ngay laptop HP Pavilion 15-EG3093TU 8C5L4PA tại CellphoneS
Nếu bạn đang tìm kiếm một chiếc laptop mạnh mẽ và đẳng cấp như HP Pavilion 15-EG3093TU 8C5L4PA, thì CellphoneS là địa chỉ mua sắm lý tưởng. Tại CellphoneS, bạn sẽ được trải nghiệm mua sắm thuận tiện và đáng tin cậy. ', N'/uploads/productimages/6c59cb0c-8df3-463a-b45b-907e6c92ab8f_hp-pavilion-15-eg3093tu_1.jpg', N'/uploads/productimages/7999c9ec-9803-4128-97db-45fb297021dd_hp-pavilion-15-eg3093tu_2.jpg', N'/uploads/productimages/65353545-dbc2-4166-92b4-f2e9009065d1_hp-pavilion-15-eg3093tu_3.jpg', 0, CAST(N'2025-03-25 00:02:32.227' AS DateTime), CAST(N'2025-04-06 16:48:49.963' AS DateTime), N'HP', N'Intel Core i5 Raptor Lake - 1335U -1.3Ghz', N'16 GB - DDR4 2 khe (1 khe 8 GB + 1 khe 8 GB)', N'512 GB SSD NVMe PCIe', N'Card tích hợp - Intel Iris Xe Graphics', N'30%', N'15.6" - Full HD (1920 x 1080) - 60Hz - 45% - Tấm nền IPS Chống chói Anti Glare 250 nits', 1, N'laptop-hp-pavilion-15-eg3093tu')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (45, 2, 62, 32, N'Laptop HP Envy X360 14 fc0083TU Ultra 7', NULL, CAST(35190000.00 AS Decimal(15, 2)), CAST(36590000.00 AS Decimal(15, 2)), NULL, N'/uploads/productimages/6b240ae9-bea7-4234-97ef-de7f9deeed94_hp-envy-x360-1.jpg', N'/uploads/productimages/ed41edec-aafb-4540-920f-8fa6eef193fa_hp-envy-x360-2.jpg', N'/uploads/productimages/e5693fdc-dd94-466c-96b7-c05a9928075f_hp-envy-x360-3.jpg', 0, CAST(N'2025-03-25 00:06:32.607' AS DateTime), CAST(N'2025-06-07 21:56:48.127' AS DateTime), N'HP', N'Intel Core Ultra 7 Meteor Lake - 155U - 1.7GHz', N'32 GB - LPDDR5 (Onboard)', N'1 TB SSD NVMe PCIe Gen 4', N'Card tích hợp - Intel Graphics - HP Audio Boost DTS:X ULTRA', N'30%', N'14" - 2.8K (2880 x 1800) - OLED 16:10 -60Hz - 100% DCI-P3 Công nghệ màn hình: Thời gian phản hồi 0.2 ms Low Blue Light Màn hình OLED 500 nits (Khi bật HDR) 1.07 tỷ màu - Cảm ứng', 1, N'laptop-hp-envy-x360-14-fc0083tu-ultra-7')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (46, 2, 62, 33, N'Laptop HP Elitebook X360 830 G11 Ultra 7', NULL, CAST(44690000.00 AS Decimal(15, 2)), CAST(48990000.00 AS Decimal(15, 2)), NULL, N'/uploads/productimages/06713720-ad20-49ba-b330-9bca2dbe707c_hp-elitebook-x360-1.jpg', N'/uploads/productimages/384b157a-986e-4b64-94bf-c06f5325f92a_hp-elitebook-x360-2.jpg', N'/uploads/productimages/26afdfc6-d9d6-4e48-a299-54d94c4681d7_hp-elitebook-x360-3.jpg', 0, CAST(N'2025-03-25 00:15:15.327' AS DateTime), CAST(N'2025-06-22 16:43:50.027' AS DateTime), N'HP', N'ntel Core Ultra 7 Meteor Lake - 165U - 1.7GHz', N'16 GB - LPDDR5 (Onboard) - 7467 MHz - Không hỗ trợ nâng cấp', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1 TB)', N'Card tích hợp - Intel Graphics', N'30%', N'13.3" - WUXGA - 60Hz - 100% sRGB - Tấm nền IPS Chống chói Anti Glare 400 nits', 1, N'laptop-hp-elitebook-x360-830-g11-ultra-7')
INSERT [dbo].[products] ([id], [adminId], [category], [subCategory], [productName], [productCompany], [productPrice], [productPriceBeforeDiscount], [productDescription], [productImage1], [productImage2], [productImage3], [shippingCharge], [postingDate], [updationDate], [brand], [cpu], [ram], [storage], [gpu], [promotion], [VGA], [ProductAvailability], [Slug]) VALUES (47, 2, 62, 34, N'Laptop HP OMEN 16 xf0071AX ', NULL, CAST(50690000.00 AS Decimal(15, 2)), CAST(58890000.00 AS Decimal(15, 2)), N'Trong bất kỳ nơi nào bạn có mặt, Laptop Gaming HP Omen 16-xf0071AX 8W945PA sẽ cung cấp sức mạnh và hiệu suất tương đương với máy tính để bàn. Bạn sẽ có thể thỏa mãn mọi nhu cầu của các trò chơi đòi hỏi tài nguyên cao, không kể bạn đang ở đâu.

Với bộ xử lý mạnh mẽ Intel Core Ryzen 7 thế hệ mới nhất, card đồ họa RTX 4000 tối ưu và dung lượng bộ nhớ rộng rãi, Laptop Gaming HP Omen 16-xf0071AX 8W945PA mang lại trải nghiệm chơi game mượt mà và thú vị, đảm bảo rằng bạn sẽ không bao giờ phải lo lắng về việc liệu máy tính có đủ sức mạnh để đáp ứng mọi yêu cầu của trò chơi hay không, bất kể bạn đang ở đâu trên thế giới.', N'/uploads/productimages/13405f0b-0690-424e-b9b5-23b9f0700733_hp-omen-16-xf0071-1.jpg', N'/uploads/productimages/ba78a47c-a971-4bcc-ad8a-132b0cc24726_hp-omen-16-xf0071-2.jpg', N'/uploads/productimages/b5bbe7a8-00b5-45a7-b824-b8b1abcd3314_hp-omen-16-xf0071-3.jpg', 0, CAST(N'2025-03-25 00:19:02.200' AS DateTime), CAST(N'2025-06-23 23:45:23.657' AS DateTime), N'HP', N'AMD Ryzen 7 - 7840HS - 3.8GHz', N'32 GB - DDR5 2 khe (1 khe 16 GB + 1 khe 16 GB)', N'1 TB SSD M.2 PCIe Gen 4 (Có thể tháo ra, lắp thanh khác tối đa 2 TB)', N'Card rời - NVIDIA GeForce RTX 4060, 8 G- Realtek High Definition Audio HP Audio Boost Bang & Olufsen audio DTS:X ULTRA', N'30%', N'16.1" - QHD - 240Hz - 100% sRGB - Low Blue Light - 3 ms Tấm nền IPS Chống chói Anti Glare Độ sáng 300 nits', 1, N'laptop-hp-omen-16-xf0071ax-')
SET IDENTITY_INSERT [dbo].[products] OFF
SET IDENTITY_INSERT [dbo].[productreviews] ON 

INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (5, 39, NULL, N'ok', CAST(N'2025-03-24 12:58:51.577' AS DateTime), 5, N'6', N'Quý Đoàn', N'doanquy610@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (6, 39, NULL, N'Tôi thấy khá ổn đó vì nó  rẻ so với hiệu năng nó mang lại', CAST(N'2025-03-24 12:59:37.960' AS DateTime), 5, N'6', N'Quý Đoàn', N'doanquy610@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (7, 39, NULL, N'tệ', CAST(N'2025-03-24 13:09:01.110' AS DateTime), 1, N'6', N'Quý Đoàn', N'doanquy610@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (8, 39, NULL, N'Ổn', CAST(N'2025-03-24 13:12:10.010' AS DateTime), 5, N'6', N'Quý Đoàn', N'doanquy610@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (9, 39, NULL, N'ok', CAST(N'2025-03-24 13:12:25.787' AS DateTime), 5, N'6', N'Quý Đoàn', N'doanquy610@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (10, 39, NULL, N'ko', CAST(N'2025-03-24 13:13:02.743' AS DateTime), 1, N'6', N'Quý Đoàn', N'doanquy610@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (11, 39, NULL, N'ok', CAST(N'2025-03-24 13:13:16.333' AS DateTime), 3, N'6', N'Quý Đoàn', N'doanquy610@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (12, 39, NULL, N'ok', CAST(N'2025-03-24 14:30:46.753' AS DateTime), 5, N'6', N'Quý Đoàn', N'doanquy610@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (13, 39, NULL, N'ok', CAST(N'2025-03-24 14:45:24.557' AS DateTime), 5, N'6', N'Quý Đoàn', N'doanquy610@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (14, 39, NULL, N'ok', CAST(N'2025-03-24 15:20:09.790' AS DateTime), 5, N'6', N'Quý Đoàn', N'doanquy610@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (15, 42, NULL, N'Với mức giá phù hợp như thế này tôi tin chắc rằng sản phẩm sẽ cháy hàng !', CAST(N'2025-03-24 16:47:12.337' AS DateTime), 5, N'6', N'Quý Đoàn', N'doanquy610@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (16, 47, NULL, N'Tôi cực kỳ thích những dòng laptop gaming nhưng mỏng nhẹ, và đặc biệt hiệu năng cực kỳ cao nhưng mức giá lại cực kỳ hợp lý
', CAST(N'2025-03-25 00:20:44.360' AS DateTime), 5, N'6', N'Quý Đoàn', N'doanquy610@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (17, 47, NULL, N'Dòng Gaming là dòng máy khá đắt ! Nên tôi không đủ điều kiện để sỡ hữu em nó mặc dù tôi rất thích', CAST(N'2025-03-25 01:47:48.127' AS DateTime), 4, N'14', N'Trần Quốc Việt', N'viet123@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (18, 47, NULL, N'ol', CAST(N'2025-03-25 21:32:32.267' AS DateTime), 5, N'6', N'Quý Đoàn', N'doanquy610@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (19, 47, NULL, N'Sản phẩm rất tốt , giá hơi chát so với hiệu năng !', CAST(N'2025-03-26 12:06:08.743' AS DateTime), 4, N'6', N'Quý Đoàn', N'doanquy610@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (20, 47, NULL, N'Sản phẩm quá mắt', CAST(N'2025-03-26 19:05:34.257' AS DateTime), 2, N'27', N'Trần Văn A', N'quy123@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (21, 47, NULL, N'Giá mắc quá', CAST(N'2025-03-26 19:52:41.690' AS DateTime), 3, N'28', N'Trần Quốc Việt', N'quydoan610@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (22, 43, NULL, N'Giá cả rất vừa túi tiền .', CAST(N'2025-03-26 20:09:01.100' AS DateTime), 5, N'29', N'Văn A', N'quy114@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (23, 42, NULL, N'Giá quá chát so với hiệu năng!', CAST(N'2025-03-26 20:25:57.653' AS DateTime), 3, N'30', N'Trần A', N'quy123@gmail.com')
INSERT [dbo].[productreviews] ([id], [productId], [summary], [review], [reviewDate], [rating], [userid], [username], [email]) VALUES (24, 23, NULL, N'ok', CAST(N'2025-03-26 20:46:00.697' AS DateTime), 5, N'31', N'Trần Quốc Việt', N'admin123@gmail.com')
SET IDENTITY_INSERT [dbo].[productreviews] OFF
SET IDENTITY_INSERT [dbo].[subcategory] ON 

INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (3, 1, N'MacBook Pro', CAST(N'2025-03-01 21:30:01.003' AS DateTime), CAST(N'2025-03-26 20:31:59.387' AS DateTime))
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (5, 1, N'MacBook Air', CAST(N'2025-03-02 13:01:14.887' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (6, 2, N'Asus Vivobook', CAST(N'2025-03-02 13:01:48.220' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (7, 2, N'Asus ZenBook', CAST(N'2025-03-02 13:02:05.940' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (8, 2, N'Asus ROG', CAST(N'2025-03-02 13:02:31.047' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (9, 1, N'MacBook Retina', CAST(N'2025-03-02 13:06:29.807' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (10, 1, N'MacBook M1 Series', CAST(N'2025-03-02 13:07:00.480' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (11, 1, N'MacBook M2 Series', CAST(N'2025-03-02 13:07:09.210' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (12, 4, N'Dell Inspiron', CAST(N'2025-03-02 13:07:44.807' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (13, 4, N'Dell XPS', CAST(N'2025-03-02 13:08:01.837' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (14, 4, N'Dell Vostro', CAST(N'2025-03-02 13:08:16.403' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (15, 4, N'Dell Gaming G-series', CAST(N'2025-03-02 13:08:27.840' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (16, 4, N'Dell Latitude', CAST(N'2025-03-02 13:08:39.493' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (17, 4, N'Dell Precision', CAST(N'2025-03-02 13:08:51.377' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (18, 5, N'Lenovo Ideapad', CAST(N'2025-03-02 13:09:17.617' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (19, 5, N'Lenovo Yoga', CAST(N'2025-03-02 13:09:29.137' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (20, 5, N'Lenovo ThinkBook', CAST(N'2025-03-02 13:09:42.320' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (21, 5, N'Lenovo Gaming Legion', CAST(N'2025-03-02 13:09:51.847' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (27, 5, N'IdeaPad Gaming', CAST(N'2025-03-15 14:19:14.913' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (29, 5, N'Lenovo ThinkPad', CAST(N'2025-03-18 08:08:33.443' AS DateTime), CAST(N'2025-03-24 16:45:17.097' AS DateTime))
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (30, 62, N'HP 15s', CAST(N'2025-03-24 23:57:05.813' AS DateTime), CAST(N'2025-03-26 19:11:42.497' AS DateTime))
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (31, 62, N'HP Pavilion', CAST(N'2025-03-24 23:57:18.543' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (32, 62, N'HP Envy', CAST(N'2025-03-24 23:57:28.637' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (33, 62, N'Elite Book', CAST(N'2025-03-24 23:57:42.163' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (34, 62, N'HP Omen', CAST(N'2025-03-24 23:57:58.773' AS DateTime), NULL)
INSERT [dbo].[subcategory] ([id], [categoryid], [SubCategoryName], [creationDate], [updationDate]) VALUES (37, 73, N'LGBook', CAST(N'2025-03-26 20:51:43.137' AS DateTime), CAST(N'2025-03-26 20:52:23.617' AS DateTime))
SET IDENTITY_INSERT [dbo].[subcategory] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [email], [contactno], [password], [regDate], [updationDate], [city], [district], [ward], [address]) VALUES (6, N'Quý Đoàn', N'doanquy610@gmail.com', N'865510677', N'827ccb0eea8a706c4c34a16891f84e7b', CAST(N'2025-03-18 10:13:59.120' AS DateTime), CAST(N'2025-06-29 16:25:05.637' AS DateTime), N'Thuận An', N'Bình Dương', N'Thuận Giao', N'Thuận Giao 18, Phường Thuận Giao, Thành Phố Thuận An, Tỉnh Bình Dương')
INSERT [dbo].[users] ([id], [name], [email], [contactno], [password], [regDate], [updationDate], [city], [district], [ward], [address]) VALUES (24, N'Trần Quốc Việt', N'viet123@gmail.com', N'348402998', N'827ccb0eea8a706c4c34a16891f84e7b', CAST(N'2025-03-25 05:18:40.510' AS DateTime), NULL, N'N/A', N'N/A', N'N/A', N'N/A')
INSERT [dbo].[users] ([id], [name], [email], [contactno], [password], [regDate], [updationDate], [city], [district], [ward], [address]) VALUES (30, N'Trần A', N'quy123@gmail.com', N'0984446778', N'827ccb0eea8a706c4c34a16891f84e7b', CAST(N'2025-03-26 13:21:51.917' AS DateTime), CAST(N'2025-03-26 13:28:07.573' AS DateTime), N'Bình Dương', N'Thuận An', N'Thuận Giao', N'Thuận giao 18, Thuận giao, Thuận An, Bình Dương')
INSERT [dbo].[users] ([id], [name], [email], [contactno], [password], [regDate], [updationDate], [city], [district], [ward], [address]) VALUES (31, N'Trần Quốc Việt', N'admin123@gmail.com', N'0456789998', N'827ccb0eea8a706c4c34a16891f84e7b', CAST(N'2025-03-26 13:42:28.043' AS DateTime), CAST(N'2025-03-26 13:48:11.443' AS DateTime), N'Bình Dương', N'Thuận An', N'Thuận Giao', N'Thuận giao 18, Thuận giao, Thuận An, Bình Dương')
SET IDENTITY_INSERT [dbo].[users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__admin__F3DBC572191B22D2]    Script Date: 7/7/2025 12:23:03 AM ******/
ALTER TABLE [dbo].[admin] ADD  CONSTRAINT [UQ__admin__F3DBC572191B22D2] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__category__37077ABDA2C436E0]    Script Date: 7/7/2025 12:23:03 AM ******/
ALTER TABLE [dbo].[category] ADD UNIQUE NONCLUSTERED 
(
	[categoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__users__AB6E6164687798CE]    Script Date: 7/7/2025 12:23:03 AM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cartitems] ADD  DEFAULT (getdate()) FOR [addeddate]
GO
ALTER TABLE [dbo].[ordertrackhistory] ADD  DEFAULT (getdate()) FOR [postingDate]
GO
ALTER TABLE [dbo].[wishlist] ADD  DEFAULT (getdate()) FOR [postingDate]
GO
ALTER TABLE [dbo].[banner]  WITH CHECK ADD  CONSTRAINT [FK_banner_admin] FOREIGN KEY([adminId])
REFERENCES [dbo].[admin] ([id])
GO
ALTER TABLE [dbo].[banner] CHECK CONSTRAINT [FK_banner_admin]
GO
ALTER TABLE [dbo].[cartitems]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[cartitems]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[category]  WITH CHECK ADD  CONSTRAINT [FK_category_admin] FOREIGN KEY([adminId])
REFERENCES [dbo].[admin] ([id])
GO
ALTER TABLE [dbo].[category] CHECK CONSTRAINT [FK_category_admin]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_products]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[ordertrackhistory]  WITH CHECK ADD  CONSTRAINT [FK_ordertrackhistory_orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[orders] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ordertrackhistory] CHECK CONSTRAINT [FK_ordertrackhistory_orders]
GO
ALTER TABLE [dbo].[productreviews]  WITH CHECK ADD  CONSTRAINT [FK_productreviews_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[productreviews] CHECK CONSTRAINT [FK_productreviews_products]
GO
ALTER TABLE [dbo].[subcategory]  WITH CHECK ADD  CONSTRAINT [FK_subcategory_category] FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[subcategory] CHECK CONSTRAINT [FK_subcategory_category]
GO
ALTER TABLE [dbo].[wishlist]  WITH CHECK ADD  CONSTRAINT [FK_wishlist_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[wishlist] CHECK CONSTRAINT [FK_wishlist_products]
GO
ALTER TABLE [dbo].[wishlist]  WITH CHECK ADD  CONSTRAINT [FK_wishlist_users] FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[wishlist] CHECK CONSTRAINT [FK_wishlist_users]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD CHECK  (([quantity]>(0)))
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [CK__products__produc__20C1E124] CHECK  (([productPrice]>=(0)))
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [CK__products__produc__20C1E124]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [CK__products__produc__21B6055D] CHECK  (([productPriceBeforeDiscount]>=(0)))
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [CK__products__produc__21B6055D]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [CK__products__shippi__22AA2996] CHECK  (([shippingCharge]>=(0)))
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [CK__products__shippi__22AA2996]
GO
ALTER TABLE [dbo].[productreviews]  WITH CHECK ADD  CONSTRAINT [CHK_productreviews_rating] CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[productreviews] CHECK CONSTRAINT [CHK_productreviews_rating]
GO
