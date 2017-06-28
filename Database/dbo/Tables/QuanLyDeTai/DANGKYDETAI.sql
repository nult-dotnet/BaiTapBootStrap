﻿CREATE TABLE [dbo].[DANGKYDETAI]
(
	DeTaiID int NOT NULL IDENTITY,
	MaDeTai nvarchar(1000) NULL,
	TenDeTai nvarchar(1000)  NULL,
	ThucHienTuNgay date  NULL,
	ThucHienDenNgay date  NULL,
	KinhPhiThucHien money  NULL,
	NguonKinhPhiID int  NULL,--DM NGUON KINH  PHI
	CapQuanLy int  NULL,--Enum
	ThuocChuongTrinh nvarchar(1000)  NULL,
	ChuNhiemDeTaiID int  NULL,--ref CANBOTHUCHIEN
	DongChuNhiemDeTaiID int  NULL,--ref CANBOTHUCHIEN
	DiaDiemTrienKhai nvarchar(1000) NULL,
	CoQuanChuTri nvarchar(1000) NUll,
	KhoaPhongID int NULL,--ref DM KHOAPHONG
	TinhTrangDeTaiID int NULL,--ref DM TINHTRANGDETAI
	TrangThaiDeTai int NULL,--Enum
	MucTieuDeTai nvarchar(1000) NULL,
	NoiDungNghienCuu nvarchar(1000) NULL,
	PhuongPhapNghienCuu nvarchar(1000) NULL,
	MucDoBaoMat int NULL,--Enum
	LoaiDeTai int NULL,-- Enum
	UserID int NULL,
	DeTaiNhanh bit NOT NULL CONSTRAINT DF_DANGKYDETAI_DeTaiNhanh DEFAULT 1,
	CONSTRAINT PK_DANGKYDETAI_DeTaiID PRIMARY KEY CLUSTERED (DeTaiID ASC),
	CONSTRAINT FK_DANGKYDETAI_NguonKinhPhiID FOREIGN KEY (NguonKinhPhiID) REFERENCES DANHMUC_NGUONKINHPHI(DMNguonKinhPhiID),
	CONSTRAINT FK_DANGKYDETAI_KhoaPhongID FOREIGN KEY (KhoaPhongID) REFERENCES DANHMUC_KHOAPHONG(DMKhoaPhongID),
	CONSTRAINT FK_DANGKYDETAI_TinhTrangDeTaiID FOREIGN KEY (TinhTrangDeTaiID) REFERENCES DANHMUC_TINHTRANGDETAI(DMTinhTrangDeTaiID),
	CONSTRAINT FK_DANGKYDETAI_ChuNhiemDeTaiID FOREIGN KEY (ChuNhiemDeTaiID) REFERENCES DANHMUC_CANBOTHUCHIEN(CanBoThucHienID),
	CONSTRAINT FK_DANGKYDETAI_DongChuNhiemDeTaiID FOREIGN KEY (DongChuNhiemDeTaiID) REFERENCES DANHMUC_CANBOTHUCHIEN(CanBoThucHienID)
)
GO

CREATE NONCLUSTERED INDEX IX_DANGKYDETAI_NguonKinhPhiID ON DANGKYDETAI
( 
	NguonKinhPhiID         ASC
)
go

CREATE NONCLUSTERED INDEX IX_DANGKYDETAI_KhoaPhongID ON DANGKYDETAI
( 
	KhoaPhongID         ASC
)
go

CREATE NONCLUSTERED INDEX IX_DANGKYDETAI_TinhTrangDeTaiID ON DANGKYDETAI
( 
	TinhTrangDeTaiID         ASC
)
go

CREATE NONCLUSTERED INDEX IX_DANGKYDETAI_ChuNhiemDeTaiID ON DANGKYDETAI
( 
	ChuNhiemDeTaiID         ASC
)
go

CREATE NONCLUSTERED INDEX IX_DANGKYDETAI_DongChuNhiemDeTaiID ON DANGKYDETAI
( 
	DongChuNhiemDeTaiID         ASC
)
go

CREATE FULLTEXT CATALOG [FTC_DANGKYDETAI_TenDeTai]
GO

CREATE FULLTEXT INDEX ON [dbo].[DANGKYDETAI] ([TenDeTai]) KEY INDEX [PK_DANGKYDETAI_DeTaiID] ON [FTC_DANGKYDETAI_TenDeTai] WITH CHANGE_TRACKING AUTO