@shift /0
@shift /0
@Echo Off
Title Unlock Bootloader
emmcdl     -l  > comport.txt        
findstr   "COM"  comport.txt   > usb_comport.txt      
If %errorlevel%==0 (
del comport.txt       > nul 2>&1
Ping -n 3 127.0.0.1 > nul
for /F "tokens=5 delims=() " %%i in (usb_comport.txt) do (
echo.Qualcomm HS-USB QDLoader 9008 %%i
echo.
Ping -n 3 127.0.0.1 > nul
emmcdl -p %%i -f loader.mbn -b aboot 1
emmcdl -p %%i -f loader.mbn -b devinfo 2
echo.

pause
)
)
echo Device Not Found!
echo. 
pause