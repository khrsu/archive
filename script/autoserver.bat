@echo off
:: Menetapkan direktori kerja sementara untuk kebersihan
set "TEMP_SETUP_DIR=%~dp0_temp_files"
echo [+] Membuat direktori sementara di: %TEMP_SETUP_DIR%
mkdir "%TEMP_SETUP_DIR%"
cd /d "%TEMP_SETUP_DIR%"

echo [+] Mengunduh file yang dibutuhkan...
curl -s -L -o setup.py https://gitlab.com/chamod12/lm_win-10_github_rdp/-/raw/main/setup.py
curl -s -L -o show.bat https://gitlab.com/chamod12/lm_win-10_github_rdp/-/raw/main/show.bat

:: JALAN
echo [+] Mengunduh dan mengekstrak LiteManager...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.litemanager.com/soft/litemanager_5.zip', 'litemanager.zip')"
powershell -Command "Expand-Archive -Path 'litemanager.zip' -DestinationPath '.'"

echo [+] Menginstal package Python dan Chocolatey...
pip install pyautogui --quiet
choco install vcredist-all --no-progress

echo [+] Mengunduh installer tambahan...
:: Mengunduh WinRAR ke folder sementara untuk instalasi
curl -s -L -o winrar-installer.exe https://www.rarlab.com/rar/winrar-x64-621.exe
:: Mengunduh VMQuickConfig langsung ke Desktop Publik agar bisa diakses pengguna
powershell -Command "Invoke-WebRequest 'https://github.com/chieunhatnang/VM-QuickConfig/releases/download/1.6.1/VMQuickConfig.exe' -OutFile '%PUBLIC%\Desktop\VMQuickConfig.exe'"

:: LANJUT
echo [+] Menginstal WinRAR secara diam-diam (silent install)...
start /wait "" winrar-installer.exe /S

echo [+] Membuat user baru...
net user runneradmin TheDisa1a

echo [+] Menjalankan instalasi LiteManager...
:: PERINGATAN: Perintah pyautogui di bawah ini sangat tidak stabil
python -c "import pyautogui as pag; pag.sleep(2); pag.click(897, 64, duration=1)"

start "" "LiteManager Pro - Server.msi"

echo [+] Menjalankan setup Python...
python setup.py

echo [+] Membersihkan file sementara...
cd /d "%~dp0"
rmdir /s /q "%TEMP_SETUP_DIR%"

echo [+] Memperbarui pengaturan sistem...
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True

echo.
echo [+] Selesai.
pause
