#!/usr/bin/env bash

set -e

readonly FVM_URL="https://raw.githubusercontent.com/megahertz/fvm/master/fvm"

main() {
  local fvm_data="$(get_fvm_dir)/.data"
  local fvm_bin="${fvm_data}/fvm"

  mkdir -p "${fvm_data}"
  curl -sL "${FVM_URL}" -o "${fvm_bin}"
  chmod +x "${fvm_bin}"

  "${fvm_bin}" install-fvm
}

get_fvm_dir() {
  if [ -n "${FVM_PATH}" ]; then
    echo "${FVM_PATH}"
  elif [ -n "${XDG_DATA_HOME}" ]; then
    echo "${XDG_DATA_HOME}/fvm"
  elif [ -d "${HOME}/.local/share" ]; then
    echo "${HOME}/.local/share/fvm"
  else
    echo "${HOME}/.fvm"
  fi
}

update_bashrc() {
  local fvm="$1"
  local saved=false
  local alias_code="alias fvm='${fvm}'"

  for rc in '.bashrc' '.profile' '.zshrc' '.bash_profile'; do
    local f="${HOME}/${rc}"

    [ ! -f "${f}" ] && continue

    saved=true

    sed -i '/alias fvm/d' "${f}"
    echo "${alias_code}" >> "${f}"
  done

  if [ "${saved}" = false ]; then
    echo "${alias_code}" >> ~/.bashrc
  fi

  eval "${alias_code}"
}

update_fish() {
  local fvm="$1"

  if [ -d ~/.config/fish/functions ]; then
    echo "function fvm; ${fvm} \$argv; end" > ~/.config/fish/functions/fvm.fish
  fi
}

main
