# Initializes Oh My Zsh

# add a function path
fpath=($ZSH/completion $fpath)

# Load all of the config files in ~/oh-my-zsh that end in .zsh
# TIP: Add files you don't want in git to .gitignore
for config_file ($ZSH/customize/*.zsh); do
  source $config_file
done

is_plugin() {
  local base_dir=$1
  local name=$2
  test -f $base_dir/plugins/$name.plugin.zsh \
    || test -f $base_dir/plugins/_$name \
}

# Figure out the SHORT hostname
if [ -n "$commands[scutil]" ]; then
  # OS X
  SHORT_HOST=$(scutil --get ComputerName)
else
  SHORT_HOST=${HOST/.*/}
fi

# Save the location of the current completion dump file.
ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

# Load and run compinit
autoload -U compinit
compinit -i -d "${ZSH_COMPDUMP}"

# Load all of the plugins that were defined in ~/.zshrc
for plugin ($plugins); do
  if [ -f $ZSH/plugins/$plugin.plugin.zsh ]; then
    source $ZSH/plugins/$plugin.plugin.zsh
  fi
done

# Load the theme
if [ ! "$ZSH_THEME" = ""  ]; then
    source "$ZSH/themes/$ZSH_THEME.zsh-theme"
fi
