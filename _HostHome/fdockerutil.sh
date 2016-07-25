#!/bin/bash
# ***********************************************************************
dLoad(){
	#!/bin/bash
	local imgName=$1
	local imgVer=$2
	local baseName=$3
	local baseVer=$4

	echo "[START] dLoad $imgName $imgVer $baseName $baseVer"

	# does dLoad have no parameters
	if [[ "$imgName" == "" ]]; then
		# check for config file
		if [ -e "./cfg" ]; then
			# load parameters from config file and re-run dLoad
			source ./cfg
			if [[ "$imgName" != "" && "$imgVer" != "" ]]; then
				# check if image file exists, if so load it
				imgFile=$DOCKER_IMAGES/$imgName-$imgVer.tgz
				if [ -e "$imgFile" ]; then
					gunzip -c $imgFile | docker load
				else
					dLoad $imgName $imgVer $baseName $baseVer
				fi
			else
				echo "[ERROR] dLoad $imgName $imgVer $baseName $baseVer : cfg file found : missing parameters"
				return 0
			fi
		else
			echo "[ERROR] dLoad $imgName $imgVer $baseName $baseVer : cfg file not found"
			return 0
		fi

	# does dLoad have all four parameters
	elif [[ "$imgName" != "" && "$imgVer" != "" && "$baseName" != "" && "$baseVer" != "" ]]; then
		dLoad $baseName $baseVer
		dBuild $imgName $imgVer $baseName $baseVer

	# does dLoad have at least first two parameters
	elif [[ "$imgName" != "" && "$imgVer" != "" ]]; then
		# check if image file exists, if so load it
		imgFile=$DOCKER_IMAGES/$imgName-$imgVer.tgz
		if [ -e "$imgFile" ]; then
			gunzip -c $imgFile | docker load
		else
			# check config file for base image
			source $DOCKER_IMAGES/$imgName/$imgVer/cfg
			if [[ "$baseName" == "" ]]; then
				# config file has no base image, so this is the base image, build it
				echo "  $imgFile not found. Running dBuild"
				dBuild $imgName $imgVer $baseName $baseVer
			else
				# config file had all four parameters re-run dLoad with all parameters
				dLoad $imgName $imgVer $baseName $baseVer
			fi
		fi

	fi
	echo "[END] dLoad $imgName $imgVer $baseName $baseVer"
}
# ***********************************************************************
dBuild(){
	imgName=$1
	imgVer=$2
	imgId=$imgName:$imgVer
	imgFile=$DOCKER_IMAGES/$imgName-$imgVer.tgz
	baseName=$3
	baseVer=$4
	baseId=$baseName:$baseVer

	echo "[START] dBuild $imgName $imgVer $baseName $baseVer"
	source $DOCKER_SCRIPTS/$imgName/$imgVer/build
	docker save $imgId | gzip -c > $imgFile
	echo "[END] dBuild $imgName $imgVer $baseName $baseVer"
}
# ***********************************************************************
