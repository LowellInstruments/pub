#!/usr/bin/env bash


FOL_LI=/home/pi/li
FOL_DDH=$FOL_LI/ddh


clear
echo "BACKUP DDH YELLOW VERSION"
cd "$FOL_LI" || (echo "error: bad working directory"; exit 1)


echo "detecting old yellow_boat DDH version"
[ -f $FOL_DDH/settings/ddh.json ]
rv=$?
if [ $rv -eq 0 ]; then
    echo "creating old yellow_boat DDH folder backup: $FOL_LI/ddh_yellow"
    mv "$FOL_DDH" "$FOL_LI"/ddh_yellow
fi


echo "killing any currently running DDH software"
killall main_ddh_controller
killall main_ddh
killall main_dds_controller
killall main_dds


echo "backup_yellow done, now proceed to next step in the README.md"
