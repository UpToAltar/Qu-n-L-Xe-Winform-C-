-- T?o b?ng t?m ?? l?u tr? c�c gi� tr? ng?u nhi�n
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

-- Danh s�ch c�c t�n ti?ng Anh
DECLARE @FirstNames TABLE (Name NVARCHAR(50))
INSERT INTO @FirstNames VALUES (N'Alex'), (N'John'), (N'James'), (N'Robert'), (N'Michael'), (N'William'), (N'David'), (N'Richard'), (N'Joseph'), (N'Charles')

DECLARE @LastNames TABLE (Name NVARCHAR(50))
INSERT INTO @LastNames VALUES (N'Smith'), (N'Johnson'), (N'Williams'), (N'Brown'), (N'Jones'), (N'Garcia'), (N'Miller'), (N'Davis'), (N'Rodriguez'), (N'Martinez')

-- V�ng l?p ?? t?o 50 t�i kho?n
WHILE @i <= 50
BEGIN
    -- L?y t�n ng?u nhi�n t? b?ng t?m
    SELECT TOP 1 @FirstName = Name FROM @FirstNames ORDER BY NEWID()
    SELECT TOP 1 @LastName = Name FROM @LastNames ORDER BY NEWID()
    
    -- T?o DisplayName b?ng c�ch k?t h?p c�c t�n
    SET @DisplayName = @FirstName + N' ' + @LastName
    
    -- T?o UserName t? DisplayName
    SET @UserName = @DisplayName
    
    -- T?o Role ng?u nhi�n
    SET @Role = CASE WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN N'Qu?n tr? vi�n' ELSE N'Nh�n vi�n' END
    
    -- Ki?m tra xem UserName ?� t?n t?i trong b?ng t?m ch?a
    IF NOT EXISTS (SELECT 1 FROM @temp WHERE UserName = @UserName)
    BEGIN
        -- Ch�n DisplayName, UserName, Password v� Role v�o b?ng t?m
        INSERT INTO @temp (DisplayName, UserName, Password, Role)
        VALUES (@DisplayName, @UserName, N'12345', @Role)
        
        -- T?ng bi?n ??m
        SET @i = @i + 1
    END
END

-- Ch�n c�c gi� tr? t? b?ng t?m v�o b?ng dbo.Account
INSERT INTO dbo.Account (DisplayName, UserName, Password, Role)
SELECT DisplayName, UserName, Password, Role FROM @temp

-- Ki?m tra k?t qu?
SELECT * FROM dbo.Account
