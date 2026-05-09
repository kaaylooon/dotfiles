#!/usr/bin/env bash
#
# shinzui/alacritty ellipsis package

pkg.link() {
  fs.link_file alacritty.yml ~/.config/alacritty/alacritty.yml 
}

pkg.install() {
  git clone https://github.com/jwilm/alacritty.git /tmp/alacritty
  cd /tmp/alacritty
  cargo build --release
  make app
  cp -r target/release/osx/Alacritty.app /Applications/Alacritty.app

  if [ -d "~/.config/alacritty" ]; then
    mkdir ~/.config/alacritty
  fi
}

# pkg.push() {
#     git.push
# }

# pkg.pull() {
#     git.pull
# }

# pkg.installed() {
#     git.status
# }
#
# pkg.status() {
#     git.diffstat
# }