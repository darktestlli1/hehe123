@echo off
cls
adb kill-server
adb start-server
adb.exe devices
adb root
adb logcat -c

:loop
adb logcat -d | findstr "OFES" | findstr "13G17GJG7173HYHYG" > nul 2>&1
if %errorlevel% equ 0 goto cleanup

timeout /t 2 > nul
goto loop

:cleanup
echo Detected target log inside HUNTER, performing cleanup...
adb shell rm -rf /data/data/com.rekoo.pubgm/lib/libGVoicePlugin.so
adb shell rm -rf /data/data/com.tencent.ig/lib/libCasa.so
adb shell rm -rf /data/data/com.vng.pubgmobile/lib/libGVoicePlugin.so
adb shell rm -rf /data/data/com.pubg.krmobile/lib/libGVoicePlugin.so
echo Cleanup done.
pause
