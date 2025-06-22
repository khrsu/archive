@echo off

curl -s -L -o setup.py https://gitlab.com/chamod12/lm_win-10_github_rdp/-/raw/main/setup.py

curl -s -L -o show.bat https://gitlab.com/chamod12/lm_win-10_github_rdp/-/raw/main/show.bat

:: JALAN

powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.litemanager.com/soft/litemanager_5.zip', 'litemanager.zip')"

powershell -Command "Expand-Archive -Path 'litemanager.zip' -DestinationPath '%cd%'"

pip install pyautogui --quiet
choco install vcredist-all --no-progress

curl -s -L -o C:\Users\Public\Desktop\Winrar.exe https://www.rarlab.com/rar/winrar-x64-621.exe

powershell -Command "Invoke-WebRequest 'https://github.com/chieunhatnang/VM-QuickConfig/releases/download/1.6.1/VMQuickConfig.exe' -OutFile 'C:\Users\Public\Desktop\VMQuickConfig.exe'"

:: LANJUT

C:\Users\Public\Desktop\Winrar.exe /S

del C:\Users\Public\Desktop\Winrar.exe

net user runneradmin TheDisa1a

python -c "import pyautogui as pag; pag.click(897, 64, duration=2)"

start "" "LiteManager Pro - Server.msi"

python setup.py

RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True
