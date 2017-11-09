#!/bin/bash

ephemeral_list=`wget -qO- http://169.254.169.254/latest/meta-data/block-device-mapping`
arr_disk=( )

for item_disk in ${ephemeral_list[@]}
do
   if [[ "$item_disk" == "ephemeral"* ]]; then
    arr_disk+=($item_disk)
  fi
done

#echo ${arr_disk[@]}
disk_num=${#arr_disk[@]}
#$echo $disk_num

lists=(
xvdb
xvdc
xvdd
xvde
xvdf
xvdg
xvdh
xvdi
xvdj
xvdk
xvdl
xvdm
xvdn
xvdo
xvdp
xvdq
xvdr
xvds
xvdt
xvdu
xvdv
xvdw
xvdx
xvdy
)

arr_mount=( )

for item in ${lists[@]}
do
  #echo "$item"
  if grep -qs $item /proc/mounts; then
         #echo "Volume $item already mounted."
         arr_mount+=(0)
    else
         echo "Volume $item not mounted." > /dev/null
    fi
done

disk_num_mount=${#arr_mount[@]}

if [ $disk_num_mount -lt $disk_num ];
then
  echo 1
 else
  echo 0
fi