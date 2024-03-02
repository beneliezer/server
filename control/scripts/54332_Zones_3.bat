@echo off
title Zone 3 - Ronfaure, Zulkheim
cd ..\..
:onCrash
echo [%date% %time%] Restarting Ronfaure, Zulkheim...
xi_map.exe --ip 108.44.45.69 --port 54332 --log log\Zones_3.txt
echo ...
GOTO onCrash