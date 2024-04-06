@echo off
title Zone 12 - Dynamis, Abyssea
cd ..\..
:onCrash
echo [%date% %time%] Restarting Dynamis, Abyssea...
xi_map.exe --ip 108.44.45.69 --port 54341 --log log\Zones_12.txt
echo ...
GOTO onCrash