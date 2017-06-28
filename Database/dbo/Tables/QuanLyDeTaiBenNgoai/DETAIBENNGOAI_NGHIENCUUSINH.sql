﻿CREATE TABLE [dbo].[DETAIBENNGOAI_NGHIENCUUSINH]
(
	NghienCuuSinhID INT NOT NULL IDENTITY 
	,MaNghienCuuSinh NVARCHAR(1000)
	,TenMaNghienCuuSinh NVARCHAR(1000)
	,NamSinh DATE
	,TrinhDo NVARCHAR(1000)
	,SoDT NVARCHAR(1000)
	,Email NVARCHAR(1000)
	,CoQuanCongTac NVARCHAR(1000) 
	,CoQuanGioiThieu NVARCHAR(1000)
	,ChuyenNganh NVARCHAR(1000)
	,DeTaiBenNgoaiID INT
	,CONSTRAINT PK_DETAIBENNGOAI_NGHIENCUUSINH_NghienCuuSinhID PRIMARY KEY  CLUSTERED (NghienCuuSinhID ASC), 
    CONSTRAINT [FK_DETAIBENNGOAI_NGHIENCUUSINH_DETAIBENNGOAI_NHANYEUCAU] FOREIGN KEY (DeTaiBenNgoaiID) REFERENCES DETAIBENNGOAI_NHANYEUCAU(DeTaiBenNgoaiID)
)

GO

CREATE NONCLUSTERED INDEX [IX_DETAIBENNGOAI_NGHIENCUUSINH_DeTaiBenNgoaiID] ON [dbo].[DETAIBENNGOAI_NGHIENCUUSINH] (DeTaiBenNgoaiID ASC)