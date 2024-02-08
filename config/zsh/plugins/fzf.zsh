# Setup fzf
# ---------
if [[ ! "$PATH" == */home/lbartoletti/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/home/lbartoletti/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/lbartoletti/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/lbartoletti/.fzf/shell/key-bindings.zsh"
