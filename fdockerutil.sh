#!/bin/bash
# ***********************************************************************
dPath(){
	# Docker Path returns a path given a path parameter
	# Usage: dPath <Path Parameter>
	# $ dPath scripts

	if [[ "$DOCKER_IMAGES" == "" ]]; then
		DOCKER_IMAGES=$(f local)/docker/images
	fi

	if [[ "$DOCKER_SCRIPTS" == "" ]]; then
		DOCKER_SCRIPTS=$(f freiny)/docker-scripts
	fi

	case $1 in
    	images)		echo $DOCKER_IMAGES;;
    	scripts)	echo $DOCKER_SCRIPTS;;
    	*)			echo "[ERROR: In function dPath() : Unknown path parameter : $1 ]"
	esac
}

# ***********************************************************************
dRun(){
	#!/bin/bash
	local imgName=$1
	local imgVer=$2
	local baseName=$3
	local baseVer=$4

	echo "[START] dRun $imgName $imgVer $baseName $baseVer"

	# does dRun have no parameters
	if [[ "$imgName" == "" ]]; then
		# check for config file
		if [ -e "./cfg" ]; then
			# load parameters from config file and re-run dRun
			source ./cfg
			if [[ "$imgName" != "" && "$imgVer" != "" ]]; then
				# check if image file exists, if so load it
				imgFile=$(dPath images)/$imgName-$imgVer.tgz
				if [ -e "$imgFile" ]; then
					gunzip -c $imgFile | docker load
				else
					dRun $imgName $imgVer $baseName $baseVer
				fi
			else
				echo "[ERROR] dRun $imgName $imgVer $baseName $baseVer : cfg file found : missing parameters"
				return 0
			fi
		else
			echo "[ERROR] dRun $imgName $imgVer $baseName $baseVer : cfg file not found"
			return 0
		fi

	# does dRun have all four parameters
	elif [[ "$imgName" != "" && "$imgVer" != "" && "$baseName" != "" && "$baseVer" != "" ]]; then
		echo "DEBUG A" $imgName $imgVer $baseName $baseVer
		dRun $baseName $baseVer
		echo "DEBUG B" $imgName $imgVer $baseName $baseVer
		dSave $imgName $imgVer $baseName $baseVer

	# does dRun have at least first two parameters
	elif [[ "$imgName" != "" && "$imgVer" != "" ]]; then
		# check if image file exists, if so load it
		imgFile=$(dPath images)/$imgName-$imgVer.tgz
		if [ -e "$imgFile" ]; then
			gunzip -c $imgFile | docker load
		else
			# check config file for base image
			source $(dPath scripts)/$imgName/$imgVer/cfg
			if [[ "$baseName" == "" ]]; then
				# config file has no base image, so this is the base image, save it
				echo "  $imgFile not found. Running Save"
				dSave $imgName $imgVer $baseName $baseVer
			else
				# config file had all four parameters re-run dRun with all parameters
				dRun $imgName $imgVer $baseName $baseVer
			fi
		fi

	fi
	echo "[END] dRun $imgName $imgVer $baseName $baseVer"
}
# ***********************************************************************
dSave(){
	imgName=$1
	imgVer=$2
	imgId=$imgName:$imgVer
	imgFile=$(dPath images)/$imgName-$imgVer.tgz
	baseName=$3
	baseVer=$4
	baseId=$baseName:$baseVer

	echo "[START] dSave $imgName $imgVer $baseName $baseVer"
	# source $(dPath scripts)/$imgName/$imgVer/save $imgName $imgVer $baseName $baseVer
	source $(dPath scripts)/$imgName/$imgVer/save
	docker save $imgId | gzip -c > $imgFile
	echo "[END] dSave $imgName $imgVer $baseName $baseVer"
}

# ***********************************************************************
rmi(){
	# Remove Image from list of loaded docker images
	# Usage: rmi <imageName> <imageVer>
	# $ rmi alpine 3.4

	case $1 in
	"")
		docker rmi $(docker images -a -q);
		;;
    *)
		local imgName=$1
		local imgVer=$2
		docker rmi $imgName:$imgVer
	esac
}

# ***********************************************************************
RMI(){
	# Remove Image from docker images folder
	# Usage: RMI <imageName> <imageVer>
	# $ rmi alpine 3.4

	local curPath=$PWD
	cd $(dPath images)

	case $1 in
	"")
		rm -- *.*
		;;
    *)
		local imgName=$1
		local imgVer=$2
		rm $imgName-$imgVer.tgz
	esac

	cd $curPath
}

# ***********************************************************************
rmia(){ rmi $1 $2; RMI $1 $2; }
