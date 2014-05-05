#!/usr/bin/env zsh
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

setopt promptsubst

autoload -U add-zsh-hook

GIT_DIRTY_COLOR=$fg_bold[red]
GIT_CLEAN_COLOR=$fg_bold[green]

FRAME_COLOR=$FG[109]
FONT_COLOR=$FG[172]
HOST_COLOR=$FG[108]
USER_COLOR=$FG[109]
DARK=$FG[242]
#╰ᐳ
#PROMPT='%{$FRAME_COLOR%}╭─[%{$DARK%}%n%{$reset_color%}%{$DARK%}@%{$DARK%}%M%{$reset_color%}%{$FRAME_COLOR%}]%{$FONT_COLOR%}-%{$FRAME_COLOR%}(%{$FONT_COLOR%}%~%{$reset_color%}%{$FRAME_COLOR%})$(git_prompt_info)
#╰>%b % %{$reset_color%}'
PROMPT='%{$FRAME_COLOR%}[%{$USER_COLOR%}%n%{$reset_color%}%{$DARK%}@%{$HOST_COLOR%}%M%{$reset_color%}%{$FRAME_COLOR%}]%{$FONT_COLOR%}-%{$FRAME_COLOR%}(%{$FONT_COLOR%}%~%{$reset_color%}%{$FRAME_COLOR%})$(git_prompt_info)
➤ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="-‹%{$reset_color%}%{$fg[white]%}%{$FG[244]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$FRAME_COLOR%}›$(git_prompt_status)"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$GIT_DIRTY_COLOR%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$GIT_CLEAN_COLOR%}✓"

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg_bold[magenta]%}↓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg_bold[magenta]%}↑%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg_bold[magenta]%}⑃%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_UNTRACKED=''
ZSH_THEME_GIT_PROMPT_ADDED=''
ZSH_THEME_GIT_PROMPT_MODIFIED=''
ZSH_THEME_GIT_PROMPT_RENAMED=''
ZSH_THEME_GIT_PROMPT_DELETED=''
ZSH_THEME_GIT_PROMPT_STASHED=''
ZSH_THEME_GIT_PROMPT_UNMERGED=''
