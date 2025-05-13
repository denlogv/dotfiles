# fino-time.zsh-theme

# Use with a dark background and 256-color terminal!
# Meant for people with RVM and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '⠠⠵' && return
    echo '○'
}

function box_name {
  local box="${SHORT_HOST:-$HOST}"
  [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
  echo "${box:gs/%/%%}"
}

PROMPT="╭─%{$FG[041]%}(\$CONDA_DEFAULT_ENV)%{$reset_color%} %{$FG[255]%}at%{$reset_color%} %{$FG[033]%}[$(box_name)]%{$reset_color%} %{$FG[255]%}in%{$reset_color%} %{$terminfo[regular]$FG[129]%}[%~]%{$reset_color%}\$(git_prompt_info)\$(ruby_prompt_info) %{$FG[255]%}at%{$reset_color%} %{$fg[yellow][%*]%}%{$reset_color%}
╰─\$(prompt_char) "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[255]%}on%{$FG[202]%} %{$fg[255]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[202]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="" #"%{$FG[202]%}✘✘✘" # 202
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"
ZSH_THEME_RUBY_PROMPT_PREFIX=" %{$FG[239]%}using%{$FG[243]%} ‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"
