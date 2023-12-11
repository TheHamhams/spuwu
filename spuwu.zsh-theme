right_triangle() {
   echo $'\ue0b0'
}

prompt_indicator() {
   echo $'%B\u276f%b'
}

arrow_start() {
   echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_end() {
   echo "%b%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_triangle)%{$reset_color%}"
}

ok_username() {
  ARROW_FG="016"
  ARROW_BG="172"
  NEXT_ARROW_BG="013"
  NEXT_ARROW_FG="172"
  echo "$(arrow_start) %n $(arrow_end)"
}

err_username() {
   ARROW_FG="016"
   ARROW_BG="160"
   NEXT_ARROW_BG="013"
   NEXT_ARROW_FG="160"
   echo "$(arrow_start) %n $(arrow_end)"
}

# return err_username if there are errors, ok_username otherwise
username() {
   echo "%(?.$(ok_username).$(err_username))"
}

directory() {
  ARROW_FG="016"
  ARROW_BG="013"
  NEXT_ARROW_BG="036"
  NEXT_ARROW_FG="013"
  echo "$(arrow_start) %2~ $(arrow_end)"
}

current_time() {
  echo "%{\e[0;35m%}%B[%b%{\e[0;33m%} %D{%a %b %d, %H:%M}%{\e[0;33m%} %b%{\e[0;35m%}%B]%b%{\e[0m%}" 
}

git_prompt() {
  ARROW_FG="016"
  ARROW_BG="036"
  NEXT_ARROW_BG=""
  NEXT_ARROW_FG="036"
  echo "$(arrow_start) $(git_prompt_info) $(arrow_end)"
}

# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} ✱%{$reset_color%}"

PROMPT='$(username)$(directory)$(git_prompt)
$(prompt_indicator) '
RPROMPT='$(git_prompt_status) $(current_time)'
