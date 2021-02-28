@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Azure VM" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
curl -o https://raw.githubusercontent.com/cudsav/WindowsRDP/main/Files/DisablePasswordComplexity.ps1 > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\FCFV.exe" https://raw.githubusercontent.com/cudsav/WindowsRDP/main/Files/FCFV.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\EVKey.exe" https://raw.githubusercontent.com/cudsav/WindowsRDP/main/Files/EVKey.exe > out.txt 2>&1
net user Nagato Pain123 /add >nul
net localgroup administrators Nagato /add >nul
net user Nagato /active:yes >nul
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant Nagato:F >nul
ICACLS C:\Windows\installer /grant Nagato:F >nul
echo Success!
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Please add NGROK_AUTH_TOKEN." 
echo User: Nagato
echo Pass: Pain123
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DisablePasswordComplexity.ps1'" > out.txt 2>&1
ping -n 10 127.0.0.1 >nul
