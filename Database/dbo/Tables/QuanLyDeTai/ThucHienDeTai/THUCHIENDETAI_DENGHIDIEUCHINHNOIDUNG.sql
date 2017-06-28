﻿CREATE TABLE THUCHIENDETAI_DENGHIDIEUCHINHNOIDUNG
(
	DeNghiDieuChinhNoiDungID int NOT NULL IDENTITY,
	GhiChu nvarchar(1000) NULL,
	DeTaiID int NULL,--ref DANGKYDETAI
	CONSTRAINT PK_THUCHIENDETAI_DENGHIDIEUCHINHNOIDUNG_DeNghiDieuChinhNoiDungID PRIMARY KEY CLUSTERED (DeNghiDieuChinhNoiDungID ASC),
	CONSTRAINT FK_THUCHIENDETAI_DENGHIDIEUCHINHNOIDUNG_DeTaiID FOREIGN KEY (DeTaiID) REFERENCES DANGKYDETAI(DeTaiID)
)
GO

CREATE NONCLUSTERED INDEX IX_THUCHIENDETAI_DENGHIDIEUCHINHNOIDUNG_DeTaiID ON THUCHIENDETAI_DENGHIDIEUCHINHNOIDUNG
( 
	DeTaiID         ASC
)
go