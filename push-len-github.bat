@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ============================================
echo   Day trang sinh nhat len GitHub
echo ============================================
echo.

if exist "_to_delete" rmdir /s /q "_to_delete"

if not exist ".git" (
  echo [1/6] Khoi tao git ...
  git init -b main
  if errorlevel 1 goto :loi
) else (
  echo [1/6] Da co .git roi.
)

echo [2/6] Khai bao ten va email cho repo nay ...
git config --local user.name "Son Jpro"
git config --local user.email "son@margick.com"

echo [3/6] Them file ...
git add -A
if errorlevel 1 goto :loi

echo [4/6] Tao commit ...
git rev-parse --verify HEAD >nul 2>&1
if errorlevel 1 (
  rem chua co commit nao - bat buoc phai tao duoc
  git commit -m "Trang sinh nhat tuoi 20"
  if errorlevel 1 goto :loi
) else (
  rem da co commit - lan nay co the khong co gi moi, khong sao
  git commit -m "Cap nhat trang sinh nhat"
)

echo [5/6] Gan remote ...
git remote get-url origin >nul 2>&1
if errorlevel 1 (
  git remote add origin https://github.com/jprosun/BirdDay.git
) else (
  git remote set-url origin https://github.com/jprosun/BirdDay.git
)

echo [6/6] Dam bao dang o nhanh main roi push ...
git branch -M main
echo       (neu hien cua so dang nhap GitHub thi bam dong y)
git push -u origin main
if errorlevel 1 goto :loi

echo.
echo ============================================
echo   XONG! Da day len GitHub.
echo.
echo   Con mot buoc tren web:
echo   1. Vao https://github.com/jprosun/BirdDay/settings/pages
echo   2. Source: Deploy from a branch
echo   3. Branch: main  /  thu muc: / (root)  -^> Save
echo.
echo   Vai phut sau trang se live o:
echo   https://jprosun.github.io/BirdDay/
echo   Kem bang chan doan:
echo   https://jprosun.github.io/BirdDay/?nhac
echo ============================================
echo.
pause
exit /b 0

:loi
echo.
echo ********************************************
echo   CO LOI. Doc dong bao loi mau do o tren.
echo   Chup lai het man hinh nay gui lai nhe.
echo ********************************************
pause
exit /b 1
