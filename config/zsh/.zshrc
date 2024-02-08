# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' menu select=long-list select=1 select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/lbartoletti/.config/zsh/autocomplete/zshrc.completion'

autoload -Uz compinit
compinit
autoload bashcompinit
bashcompinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob notify
unsetopt beep
bindkey -v

export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=foot

# End of lines configured by zsh-newuser-install
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[ShiftTab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        history-substring-search-up
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      history-substring-search-down
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[ShiftTab]}"  ]] && bindkey -- "${key[ShiftTab]}"  reverse-menu-complete

# Plugins
ZSH_PLUGINS_DIR=$HOME/.config/zsh/plugins
ADOTDIR=$ZSH_PLUGINS_DIR/antigen

source /usr/local/share/zsh-antigen/antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle nviennot/zsh-vim-plugin # open file with (n)vi(m):line_number
antigen bundle lbartoletti/gpg-crypt

antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi


antigen bundle zsh-users/zsh-syntax-highlighting

# nim / nimble
export PATH=~/.nimble/bin:$PATH
# rust / cargo
export PATH=~/.cargo/bin:$PATH
# my shells scripts
export PATH=~/.local/scripts:$PATH
# python et autres
export PATH=~/.local/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
if zmodload zsh/terminfo && (( terminfo[colors] >= 256 ))
then
  [[ ! -f "$XDG_CONFIG_HOME/zsh/.p10k.zsh" ]] || {
    source "$XDG_CONFIG_HOME/zsh/.p10k.zsh"
  }
else
  [[ ! -f "$XDG_CONFIG_HOME/zsh/.p10k-portable.zsh" ]] || {
    source "$XDG_CONFIG_HOME/zsh/.p10k-portable.zsh"
  }
fi

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

# https://github.com/shannonmoeller/up
[ -f "${ZSH_PLUGINS_DIR}"/up.sh ] && source "${ZSH_PLUGINS_DIR}"/up.sh

# Commands

# Aliases

# shell
alias h='history 25'
alias j='jobs -l'
alias la='ls -aF'
alias lf='ls -FA'
alias ll='ls -lAF'
alias miodisation='rm -rf'

alias l='exa --icons'
alias ltree='exa --icons --tree -L 1'
export BAT_THEME="base16"

#alias git
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gdst='git diff --staged'
alias lg='GIT_PAGER=less git'
alias cdr='cd $(git root)'
grmb() {
  git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
}

window_capture() {
  local a
  a=$(xwininfo -id $(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}') | awk '{if (NR==4 || NR==5 || NR==8 || NR==9) print $NF}' | tr '\n' ' ')
  a=($(echo $a | tr '\n' ' '))
  flameshot gui --region ${a[3]}x${a[4]}+${a[1]}+${a[2]}
}
# goodies
alias meteo='curl http://fr.wttr.in/Sallanches'

# alias tmux='tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf'
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true


export XDG_RUNTIME_DIR=/tmp/`id -u`-runtime-dir
test -d "$XDG_RUNTIME_DIR" || \
  { mkdir "$XDG_RUNTIME_DIR" ; chmod 700 "$XDG_RUNTIME_DIR" ; }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
