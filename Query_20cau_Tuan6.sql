-- 1:
SELECT DISTINCT nh.TenNH
FROM NganHang nh
JOIN ChiNhanh cn ON nh.MaNH = cn.MaNH
WHERE cn.ThanhPhoCN = 'Da Lat';

-- 2:
SELECT DISTINCT cn.ThanhPhoCN
FROM ChiNhanh cn
JOIN NganHang nh ON cn.MaNH = nh.MaNH
WHERE nh.TenNH = 'Ngan Hang Cong Thuong';

-- 3:
SELECT cn.*
FROM ChiNhanh cn
JOIN NganHang nh ON cn.MaNH = nh.MaNH
WHERE nh.TenNH = 'Ngan Hang Cong Thuong'
  AND cn.ThanhPhoCN = 'TP HCM';

-- 4:
SELECT nh.TenNH, cn.MaCN, cn.ThanhPhoCN, cn.TaiSan
FROM NganHang nh
JOIN ChiNhanh cn ON nh.MaNH = cn.MaNH;

-- 5:
SELECT *
FROM KhachHang
WHERE DiaChi LIKE '%Ha Noi%';

-- 6:
SELECT *
FROM KhachHang
WHERE TenKH LIKE '%Son%';

-- 7:
SELECT *
FROM KhachHang
WHERE DiaChi LIKE '%Tran Hung Dao%';

-- 8:
SELECT *
FROM KhachHang
WHERE TenKH LIKE '%Thao%';

-- 9:
SELECT *
FROM KhachHang
WHERE MaKH LIKE '11%'
  AND DiaChi LIKE '%TP HCM%';

-- 10:
SELECT nh.TenNH, cn.ThanhPhoCN, cn.TaiSan
FROM NganHang nh
JOIN ChiNhanh cn ON nh.MaNH = cn.MaNH
ORDER BY cn.TaiSan ASC, cn.ThanhPhoCN ASC;

-- 11:
SELECT nh.TenNH, cn.*
FROM NganHang nh
JOIN ChiNhanh cn ON nh.MaNH = cn.MaNH
WHERE cn.TaiSan > 3000000000
  AND cn.TaiSan < 5000000000;

-- 12:
SELECT nh.TenNH, AVG(cn.TaiSan) AS TaiSanTrungBinh
FROM NganHang nh
JOIN ChiNhanh cn ON nh.MaNH = cn.MaNH
GROUP BY nh.TenNH;

-- 13:
SELECT DISTINCT kh.*
FROM KhachHang kh
JOIN TaiKhoanVay tv ON kh.MaKH = tv.MaKH
JOIN ChiNhanh cn ON tv.MaCN = cn.MaCN
JOIN NganHang nh ON cn.MaNH = nh.MaNH
WHERE nh.TenNH = 'Ngan Hang Cong Thuong'
  AND kh.TenKH LIKE '%Thao%';

-- 14:
SELECT nh.TenNH, SUM(cn.TaiSan) AS TongTaiSan
FROM NganHang nh
JOIN ChiNhanh cn ON nh.MaNH = cn.MaNH
GROUP BY nh.TenNH;

-- 15:
SELECT MaCN, TaiSan
FROM ChiNhanh
WHERE TaiSan = (SELECT MAX(TaiSan) FROM ChiNhanh);

-- 16:
SELECT DISTINCT kh.*
FROM KhachHang kh
JOIN TaiKhoanGoi tg ON kh.MaKH = tg.MaKH
JOIN ChiNhanh cn ON tg.MaCN = cn.MaCN
JOIN NganHang nh ON cn.MaNH = nh.MaNH
WHERE nh.TenNH = 'Ngan Hang A Chau';

-- 17:
SELECT tv.SoTKV
FROM TaiKhoanVay tv
JOIN ChiNhanh cn ON tv.MaCN = cn.MaCN
JOIN NganHang nh ON cn.MaNH = nh.MaNH
WHERE nh.TenNH = 'Ngan Hang Ngoai Thuong'
  AND tv.SoTienVay > 1200000;

-- 18:
SELECT MaCN, SUM(SoTienGoi) AS TongTienGoi
FROM TaiKhoanGoi
GROUP BY MaCN;

-- 19:
SELECT kh.TenKH, tv.SoTKV, tg.SoTKG
FROM KhachHang kh
LEFT JOIN TaiKhoanVay tv ON kh.MaKH = tv.MaKH
LEFT JOIN TaiKhoanGoi tg ON kh.MaKH = tg.MaKH
WHERE kh.TenKH LIKE '%Son%';

-- 20: 
SELECT kh.MaKH, kh.TenKH, kh.DiaChi, SUM(tv.SoTienVay) AS TongTienVay
FROM KhachHang kh
JOIN TaiKhoanVay tv ON kh.MaKH = tv.MaKH
GROUP BY kh.MaKH, kh.TenKH, kh.DiaChi
HAVING SUM(tv.SoTienVay) > 30000000;
