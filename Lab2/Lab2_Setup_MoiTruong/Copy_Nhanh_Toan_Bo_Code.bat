@echo off
chcp 65001 >nul
echo ========================================================
echo   COPY NHANH CODE TU HOAN CHINH SANG MOI TRUONG DEMO
echo ========================================================
echo.
set "SRC=%~dp0..\Lab2_Code_HoanChinh\LAB2_MaHoaHienDai\src\main\java\week_02"
set "DST=%~dp0LAB2_MaHoaHienDai\src\main\java\week_02"

if not exist "%SRC%" (
    echo [LOI] Khong tim thay thu muc: %SRC%
    pause
    exit /b
)

echo Dang copy cac file .java tu Code Hoan Chinh sang...
xcopy "%SRC%\*.java" "%DST%\" /Y /Q

echo.
echo [THANH CONG] Da copy day du cac file .java vao week_02!
echo Bay gio ban co the mo NetBeans hoac chay Chay_Project_Ngay.bat de demo.
echo.
pause
