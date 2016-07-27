#****************************************
cd ~
#****************************************
export GOPATH=~/dev
export PATH=$PATH:~/bin
export PATH=$PATH:~/dev/bin
export PATH=$PATH:/usr/local/go/bin
#****************************************
# Folder Echo: f <Folder Abbreviation> <Sub-Folder>
f(){
	local home=~

	case $1 in
		# ---------------------------------------------------
		j)	echo $DOCKER_SCRIPTS/dev/latest;;
		# ---------------------------------------------------
		/|root)		echo /$2;;
		tmp)		echo /tmp/$2;;
		etc)		echo /etc/$2;;
		app)		echo /Applications/$2;;
		desk)		echo ~/Desktop/$2;;
		doc)		echo ~/Documents/$2;;
		lib)		echo ~/Library/$2;;
		down)		echo ~/Downloads/$2;;
		bin)		echo ~/bin/$2;;
		hdev)		echo ~/dev/$2;;
		# ---------------------------------------------------
		hub|github)	echo ~/dev/src/github.com/$2;;
		fhub|fh)	echo $GITHUB_USER_PATH/$2;;
		local)	echo $GITHUB_USER_PATH/_local/$2;;
		# ---------------------------------------------------
		users)		echo ~/users/$2;;
		freiny|f)	echo ~/users/freiny/$2;;
		# ---------------------------------------------------
		scripts|s)	echo $DOCKER_SCRIPTS/$2;;
		launch|l)	echo $DOCKER_LAUNCH/$2;;
		images|i)	echo $DOCKER_IMAGES/$2;;
		cluster)	echo $DOCKER_SCRIPTS/cluster/$2;;
		# ---------------------------------------------------
		conf)		echo $GITHUB_USER_PATH/config/$2;;
		bash)		echo $GITHUB_USER_PATH/config/bash-host/$2;;
		nano)		echo $GITHUB_USER_PATH/config/nano/$2;;
		alpine)		echo $DOCKER_SCRIPTS/alpine/$2;;
		f-alpine)	echo $DOCKER_SCRIPTS/f-alpine/$2;;
		f-go)		echo $DOCKER_SCRIPTS/f-go/$2;;
		dev)		echo $DOCKER_SCRIPTS/dev/latest/$2;;
		# ---------------------------------------------------
		-help|--help|-h|--h)	echo "Folder Echo: f <Folder Abbreviation> <Sub-Folder>";;
		# ---------------------------------------------------
		""|~|home)	echo ~/$2;;
		.)			echo $2;;
		*)			echo $1
	esac
}
# ================================
# Jump To Folder: j <Folder Abbreviation> <Sub-Folder>
j(){
	case $1 in
		-help|--help|-h|--h)	echo "Jump To Folder: j <Folder Abbreviation> <Sub-Folder>";;
		*)						cd "$(f $1 $2)";
	esac
}

# ================================
# Custom Command Executor: k <Command>
k(){
	case $1 in
		# ---------------------------------------------------
		link)			ln $2 $3/$2;;
		killAll|ka)		killall -v -u $(whoami) -c $2;;
		killAll|ka)		killall -v -u $(whoami) -c $2;;
		rmAll)			rm -rf $2;;
		clear)			printf "\033c";;
		cm)				chmod 744 $2;;
		ps)				ps -a;;
		findFile)		find . -name $2 -type f;;
		sudoFindFile) 	sudo find . -name $2 -type f;;
		findWord)		grep -rn $2 *;;
		sudoFindWord)	sudo grep -rn $2 *;;
		sha256)			shasum -a 256 $2;;
		nanobash)		nano ~/.bash_profile;;
		nanorc)			nano ~/.nanorc;;
		run|r)			go clean; go build -o main; chmod 744 main; ./main;;
		test|t)			go test;;
		rmds)			find . -name ‘*.DS_Store’ -type f -delete;;
		# ---------------------------------------------------
		serve)			 python -m SimpleHTTPServer;;
		clearCmdHistory) cat /dev/null > ~/.bash_history && history -c && exit;;
		colors)
		    export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
		    export CLICOLOR=1
		    export LSCOLORS=ExFxBxDxCxegedabagacad
		;;
		gitEditor)	git config --global core.editor "nano";;
		# ---------------------------------------------------
		new-sh)	touch $2; echo "#!/bin/bash" >> $2; chmod 744 $2; nano $2;;
		# ---------------------------------------------------
		*|"")	echo "Custom Command Executor: k <Command>"
	esac
}
#****************************************
new(){
	case $1 in
		# ---------------------------------------------------
		bash)
			# New Bash Script
			touch $2; echo "#!/bin/bash" >> $2; chmod 744 $2; nano $2
		;;
		# ---------------------------------------------------
		*|"")	echo "New File Creator: new <Command>"
	esac
}
#****************************************
g(){
	local home=~

	case $1 in
		# ---------------------------------------------------
		s)		git status $2;;
		a)		git add $2;;
		c)		git commit $2;;
		d)		git diff $2;;
		l)		git log;;
		pom)	git push origin master;;
		# ---------------------------------------------------
		*|"")	echo "Git Custom Command Executor: g <Command>"
	esac
}

#****************************************
source ~/fdockerutil
#****************************************
/()				{ cd /; }
.()				{ cd ./..; }
..()			{ cd ./../..; }
...()			{ cd ./../../..; }
l()				{ ls -a; }
ll()			{ ls -l; }
#****************************************
# INIT
k clear
k colors
k gitEditor
#****************************************
