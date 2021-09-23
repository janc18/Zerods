#!/bin/bash
. db_device.config
#add all of the packages into a new db
#mount usb 
#cp all the files
#sync
#unmount usb

#sudo umount $name_of_mount

#############
green=`tput setaf 2`
echo "${green}Updating database..."
rm -r ${name_of_db}**				#delete actual db files
repo-add ${name_of_db}.db.tar.gz *.pkg.tar.xz	
#############

#############
echo "Making directory for moinnting point"	#making directory for mounting poin
mkdir $name_of_mount				
echo "Mountig USB"
sudo mount $device $name_of_mount 		#mounting USB in a directory
echo "Deleting all the files of the usb"
sudo rm ${name_of_mount}/**
#############

#############
echo "Copying packages to the USB"
echo "Copying files of the db"
sudo cp -a ${name_of_db}** $name_of_mount	#Copying files of the database
echo "Copying all the packages" 
sudo cp -a *.pkg.tar.xz $name_of_mount		#Copyng all the packages un the actual directory
#############

#############
echo "Sync cache"
sync
echo "Unmount USB"
sudo umount $name_of_mount
