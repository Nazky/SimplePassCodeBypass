#!/bin/bash

ACT1=$(find /private/var/containers/Data/System -name internal)

ACT2=$(find /private/var/containers/Data/System -name activation_records)

echo "$ACT1"

ACT2=${ACT1%????????????????}

echo "$ACT2"

cp Ressource/*.plist /"$ACT2"/

cp -r Ressource/Library/ /private/var/wireless/


