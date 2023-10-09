#!/usr/bin/env bash

dotfilesDir=$(pwd)

function linkDotfile {
	dest="${1}/${2}"
	dateStr=$(date +%Y-%m-%d-%H%M)

	if [ -h ~/${2} ]; then
		# Existing symlink
		echo "Removing existing symlink: ${dest}"
		sudo rm ${dest}

	elif [ -f "${dest}" ]; then
		# Existing file
		echo "Backing up existing file: ${dest}"
		sudo mv ${dest}{,.${dateStr}}

	elif [ -d "${dest}" ]; then
		# Existing dir
		echo "Backing up existing dir: ${dest}"
		sudo mv ${dest}{,.${dateStr}}
	fi

	echo "Creating new symlink: ${dest}"
	sudo ln -s ${dotfilesDir}/${2} ${dest}
}

# Create config folder if it does not exists, below symlinks fail otherwise
mkdir -p ~/.config

# Create symlink for a file/folder on a right in the folder on the left
linkDotfile /home/$USER .config/alacritty
linkDotfile /home/$USER .ssh
linkDotfile /home/$USER .gitconfig
#linkDotfile /home/$USER .tmux.conf
linkDotfile /home/$USER .zshrc
