-- T?o b?ng t?m ?? l?u tr? các giá tr? ng?u nhiên
DECLARE @temp TABLE (
    DisplayName NVARCHAR(50),
    UserName NVARCHAR(50),
    Password NVARCHAR(50),
    Role NVARCHAR(20)
)

-- Bi?n ??m
DECLARE @i INT = 1
DECLARE @FirstName NVARCHAR(50)
DECLARE @LastName NVARCHAR(50)
DECLARE @DisplayName NVARCHAR(50)
DECLARE @UserName NVARCHAR(50)
DECLARE @Role NVARCHAR(20)

-- Danh sách các tên ti?ng Anh
DECLARE @FirstNames TABLE (Name NVARCHAR(50))
INSERT INTO @FirstNames VALUES (N'Alex'), (N'John'), (N'James'), (N'Robert'), (N'Michael'), (N'William'), (N'David'), (N'Richard'), (N'Joseph'), (N'Charles')

DECLARE @LastNames TABLE (Name NVARCHAR(50))
INSERT INTO @LastNames VALUES (N'Smith'), (N'Johnson'), (N'Williams'), (N'Brown'), (N'Jones'), (N'Garcia'), (N'Miller'), (N'Davis'), (N'Rodriguez'), (N'Martinez')

-- Vòng l?p ?? t?o 50 tài kho?n
WHILE @i <= 50
BEGIN
    -- L?y tên ng?u nhiên t? b?ng t?m
    SELECT TOP 1 @FirstName = Name FROM @FirstNames ORDER BY NEWID()
    SELECT TOP 1 @LastName = Name FROM @LastNames ORDER BY NEWID()
    
    -- T?o DisplayName b?ng cách k?t h?p các tên
    SET @DisplayName = @FirstName + N' ' + @LastName
    
    -- T?o UserName t? DisplayName
    SET @UserName = @DisplayName
    
    -- T?o Role ng?u nhiên
    SET @Role = CASE WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN N'Qu?n tr? viên' ELSE N'Nhân viên' END
    
    -- Ki?m tra xem UserName ?ã t?n t?i trong b?ng t?m ch?a
    IF NOT EXISTS (SELECT 1 FROM @temp WHERE UserName = @UserName)
    BEGIN
        -- Chèn DisplayName, UserName, Password và Role vào b?ng t?m
        INSERT INTO @temp (DisplayName, UserName, Password, Role)
        VALUES (@DisplayName, @UserName, N'12345', @Role)
        
        -- T?ng bi?n ??m
        SET @i = @i + 1
    END
END

-- Chèn các giá tr? t? b?ng t?m vào b?ng dbo.Account
INSERT INTO dbo.Account (DisplayName, UserName, Password, Role)
SELECT DisplayName, UserName, Password, Role FROM @temp

-- Ki?m tra k?t qu?
SELECT * FROM dbo.Account
