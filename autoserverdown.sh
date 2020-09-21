#!/bin/bash

readonly ServerDownCount=5
readonly FirstLoginServerDownCount=30

FirstLoginFlg=0
NonPlayersCount=0
Players=0

# 終了判定関数
CheckServerDown () {
    if [ $FirstLoginFlg -eq 1 ]; then
        # 初回ログインあり
        if [ $NonPlayersCount -gt $ServerDownCount ]; then
            return 1
        fi
    else
        # 初回ログインなし
        if [ $NonPlayersCount -gt $FirstLoginServerDownCount ]; then
            return 1
        fi
    fi
    
    return 0
}

while :
do
    Players=$( arkmanager status | grep "Active Players" | sed -e "s/.*: //" )
    echo "Players = $Players"
    if [ -z "$Players" ]; then
        echo "Not Connected Server"
        NonPlayersCount=`expr $NonPlayersCount + 1`
    elif [ $Players -eq 0 ]; then
        echo "Non Player"
        NonPlayersCount=`expr $NonPlayersCount + 1`
    else
        echo "Status Reset"
        NonPlayersCount=0
        FirstLoginFlg=1
    fi

    CheckServerDown
    if [ $? -ne 0 ]; then
        arkmanager stop
        echo "exit"
        exit
    fi

    sleep 1m
done
