@echo off
title Zone 6 - Argoneau, LiTelor, Kolshushu, Sarutabaruta
cd ..\..
:onCrash
echo [%date% %time%] Restarting Argoneau, LiTelor, Kolshushu, Sarutabaruta...
xi_map.exe --ip 108.44.45.69 --port 54335 --log log\Zones_6.txt
echo ...
GOTO onCrash