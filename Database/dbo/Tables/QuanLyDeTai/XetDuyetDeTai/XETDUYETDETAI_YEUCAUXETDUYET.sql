﻿CREATE TABLE XETDUYETDETAI_YEUCAUXETDUYET
(
	YeuCauXetDuyetID int NOT NULL IDENTITY,
	ThoiGianXetDuyet date NULL,
	PhuongThucXetDuyet int NULL,--Enum
	DeTaiID int NULL,--ref DANGKYDETAI
	LoaiHoiDong int NULL,--Enum
	CONSTRAINT PK_XETDUYETDETAI_YEUCAUXETDUYET_YeuCauXetDuyetID PRIMARY KEY CLUSTERED (YeuCauXetDuyetID ASC),
	CONSTRAINT FK_XETDUYETDETAI_YEUCAUXETDUYET_DeTaiID FOREIGN KEY (DeTaiID) REFERENCES DANGKYDETAI(DeTaiID)
)
GO

CREATE NONCLUSTERED INDEX IX_XETDUYETDETAI_YEUCAUXETDUYET_DeTaiID ON XETDUYETDETAI_YEUCAUXETDUYET
( 
	DeTaiID         ASC
)
go