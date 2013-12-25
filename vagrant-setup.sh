#!/usr/bin/env bash

update_apt() {
  sudo apt-get update > /dev/null
}

install_with_apt() {
  update_apt
  sudo DEBIAN_FRONTEND=noninteractive apt-get -y install $1
}

installed_with_apt() {
  sudo dpkg -s $1 | grep "Status: install ok" > /dev/null
}

new_install_with_apt() {
  if installed_with_apt $1; then
    echo "$1 is already installed"
  else
    install_with_apt $1
  fi
}

write_file() {
  sudo cat > $1
}

download_to_file() {
  if [ -f $2 ]; then
    echo "skipping download, the file already exists"
  else
    curl $1 > $2
  fi
}

update_apt

new_install_with_apt "php5-cli git htop php5-json php5-curl php5-intl"
