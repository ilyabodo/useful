#!/bin/bash
STR="ID="
OS_ID=$(egrep '^ID=' /etc/os-release)
OS_ID=${OS_ID#"ID="}
OS_LIKE=$(egrep '^ID_LIKE=' /etc/os-release)
OS_LIKE=${OS_LIKE#"ID="}
#echo $OS_ID
#echo $OS_LIKE
INSTALLS="python3.8 python-pip git"
PYTHON_PKGS="bs4 lxml discord praw numpy"

main() {
	if [[ "$OS_ID" == *"fedora"* ]]; then
		echo "HELLO"
		fedora_setup
	elif [[ "$OS_ID" == *"opensuse"* ]]; then
		opensuse_setup
	elif [[ "$OS_LIKE" == "debian" ]]; then
		debian_setup
	else
		echo $OS_ID " - Not supported"
	fi
}
debian_setup() {
	for APP in $INSTALLS; do
                sudo apt install -y $APP
        python_packages
        done
}
fedora_setup() {
	for APP in $INSTALLS; do
		sudo dnf install -y $APP
	python_packages
	done
}

opensuse_setup() {
	for APP in $INSTALLS; do
		sudo zypper install -y $APP
	python_packages
	sudo zypper dup
	done
}
python_packages() {
	for PKG in $PYTHON_PKGS; do
                pip install $PKG
	done
}

main "$@"
