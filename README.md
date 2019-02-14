# Free Pascal Version Manager

Simple bash script to manage multiple active Free Pascal Compiler versions

## Install

### Using curl 

`curl https://raw.githubusercontent.com/megahertz/fvm/master/install.sh | bash`

### Manual

1. Download
  [fvm script](https://raw.githubusercontent.com/megahertz/fvm/master/fvm)

2. Set exec flag `chmod +x fvm`

3. (Optional) `./fvm install-fvm` installs fvm and makes alias for you shell

``

## Usage

### Install FPC

Syntax

`fvm install [branch or tag[@revision]]`

Install the latest stable version

`fvm install`

Install the latest trunk version

`fvm install trunk`

Install the specific revision

`fvm install trunk@39496`

### Set active version

Show installed versions

`fvm ls`

Set active version (you can spcecify a full version, or the first part)

`fvm use 3.1`

### Make symlink

`fvm use` just sets shell alias for FPC. In some situations (e.g. Makefile) you want to have symlink to FPC instead of alias. To make symlink run:

`sudo ln -s "$(./fvm which)" /usr/local/bin/fpc`
