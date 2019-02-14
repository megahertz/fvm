#!/usr/bin/env bash

set -e

curl -sL "https://raw.githubusercontent.com/megahertz/fvm/master/fvm" -o /tmp/fvm
chmod +x /tmp/fvm
/tmp/fvm install-fvm
rm /tmp/fvm
