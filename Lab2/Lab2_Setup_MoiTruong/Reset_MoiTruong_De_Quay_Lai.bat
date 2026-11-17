@echo off
chcp 65001 >nul
echo ========================================================
echo   RESET THU MUC MOI TRUONG VE TRANG THAI TRONG DE QUAY LAI
echo ========================================================
echo.
echo Thao tac nay se xoa sach cac file code .java trong week_02
echo va cac file text sinh ra khi chay test, dua ve trang thai setup ban dau.
echo.
choice /c YN /n /m "Ban co chac muon reset khong? (Y/N): "
if errorlevel 2 (
    echo Da huy reset.
    pause
    exit /b
)

del /Q "%~dp0LAB2_MaHoaHienDai\src\main\java\week_02\*.java" 2>nul
del /Q "%~dp0*.txt" 2>nul
del /Q "%~dp0LAB2_MaHoaHienDai\*.txt" 2>nul

echo.
echo [DA RESET] Thu muc week_02 da trong, moi truong da san sang de quay lai tu dau!
echo.
pause
