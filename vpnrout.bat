@echo off
cd %systemroot%\system32 
start rasdial WorkVPN name password
timeout /t 5 /nobreak >nul 2>nul
ipconfig | find "10.100.0.%" > ip.txt
for /f "tokens=1,2 delims=:" %%i in (ip.txt) do (
echo %%j >> ip.log
route add 172.19.0.0 mask 255.255.0.0 %%j
)

