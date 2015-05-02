#!/bin/sh

# コマンドラインツール
# license agreements が表示されるので agree を入力してEnter
xcode-select --install
sudo xcodebuild -license

# Homebrew-file
# homebrewとbrew-caskはBrew-fileと同時にインストールされる
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
curl -fsSL https://raw.github.com/rcmdnk/homebrew-file/install/install.sh |sh
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"

# 最新のバージョンに更新
brew update
brew upgrade
brew cleanup
 
# エラーがないか確認
brew doctor

# Homebrew-Cask
# 通常のアプリをHomebrewで入れられるようになる
# brew install caskroom/cask/brew-cask

# Homebrew-file
# brewで入れたアプリの管理がとても楽になる
# brew tap rcmdnk/file
# brew install brew-file

# zsh
brew install zsh
brew install zsh-completions

# git
$ brew install git
$ brew install git-flow

# openssh
brew install openssl

# anyenvのインストール
git clone https://github.com/riywo/anyenv ~/.anyenv

# bashにanyenvのpathを通す
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(anyenv init -)"' >> ~/.bashrc

# zshにanyenvのpathを通す
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(anyenv init -)"' >> ~/.zshrc

# shell再起動 
exec $SHELL

# anyenvのアップデートを入れる
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

# anyenvをアップデートする
anyenv update

# anyenvでrbenvを入れる
anyenv install rbenv

# ruby のインストール
rbenv install 2.2.2
rbenv rehash

# update_rubygems
# gem update
# gem clean

# node.js のインストール
anyenv install ndenv
ndenv install v0.12.2
ndenv rehash

# npm update -g
# npm update -g npm

# デフォルトのruby,npmのversionを指定する
rbenv global 2.2.2
ndenv global v0.12.2

# ruby-gems, node-npm, brewfile は
# 別途インストールスクリプトを走らせる
