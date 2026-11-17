@echo off
chcp 65001 >nul
echo ========================================================
echo   DEMO BAI NANG CAO 02: AES-256-CBC BANG PYTHON (TKINTER)
echo ========================================================
echo.
echo 1. Chay tu kiem thu (Self-test)
echo 2. Chay giao dien do hoa (GUI Tkinter)
echo 3. Thoat
echo.
set /p choice="Chon (1/2/3): "

if "%choice%"=="1" (
    echo.
    echo Dang chay self-test: py aes_cbc_gui.py --self-test
    py aes_cbc_gui.py --self-test
    pause
) else if "%choice%"=="2" (
    echo.
    echo Dang khoi dong GUI: py aes_cbc_gui.py
    py aes_cbc_gui.py
)
