#!/bin/bash

arkmanager start

nohup ./autoserverdown.sh > /dev/null 2>&1 &
