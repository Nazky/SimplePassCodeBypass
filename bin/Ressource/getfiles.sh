#!/bin/bash

FG1=$(find /private/var/containers/Data/System -name activation_record.plist)

FG2=$(find /private/var/containers/Data/System -name data_ark.plist)

mkdir Ressource

cp "$FG1" Ressource/
cp "$FG2" Ressource/
cp -r /private/var/wireless/Library Ressource/
