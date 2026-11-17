@echo off
chcp 65001 >nul
echo ========================================================
echo   KHOI CHAY UNG DUNG LAB 2 - MA HOA DOI XUNG HIEN DAI
echo ========================================================
echo.
cd /d "%~dp0LAB2_MaHoaHienDai"
mvn compile exec:java
pause
