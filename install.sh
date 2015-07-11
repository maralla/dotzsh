set -e

date=$(date "+%Y-%m-%dT%H:%M:%S")

if [ ! -n "$ZSH" ]; then
  ZSH=~/.dotzsh
fi

if [ -d "$ZSH" ]; then
  bak=$ZSH.bak-$date
  echo "\033[0;33mAlready installed.\033[0m Backing up to $bak"
  mv $ZSH $bak
fi

echo "\033[0;34mCloning...\033[0m"
hash git > /dev/null && git clone https://github.com/maralla/dotzsh.git $ZSH || {
  echo "git not installed"
  exit
}

echo "\033[0;34mLooking for an existing zsh config...\033[0m"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  link=$(readlink ~/.zshrc)
  if [ "$link" == "$ZSH/zshrc" ]; then
    unlink ~/.zshrc
  else
    echo "\033[0;33mFound ~/.zshrc.\033[0m \033[0;32mBacking up to ~/.zshrc.bak-$date.\033[0m"
    mv ~/.zshrc ~/.zshrc.bak-$date
  fi
fi

echo "\033[0;34mLinking zshrc to ~/.zshrc\033[0m"
ln -s $ZSH/zshrc ~/.zshrc
