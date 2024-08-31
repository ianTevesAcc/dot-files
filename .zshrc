# IMPORTANT LOADS ---
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load ZINIT
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Paths
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"                        # path to brew bin
export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"                       # path to brew sbin
export PATH="/usr/bin:$PATH"                                              # path to usr bin
export PATH="/usr/bin:$PATH"                                              # path to usr sbin
export PATH="/usr/local/bin:$PATH"                                        # path to usr local bin
export PATH="/usr/local/sbin:$PATH"                                       # path to usr local sbin
export RBENV_ROOT="$HOME/.rbenv"                                          # path to rbenv
export PATH="$RBENV_ROOT/shims:/versions:$PATH"                           # path to rbenv versions
export PATH="/home/linuxbrew/.linuxbrew/share/emacs/site-lisp/ruby:$PATH" # path to ruby
export PATH="/home/linuxbrew/.linuxbrew/lib/ruby/gems/3.3.0/bin:$PATH"    # path to ruby bin


# ZINIT CONFIG ---
# Download Zinit if not found
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# ZSH Plugins
zinit ice depth=1; zinit light romkatv/Powerlevel10k  # add PowerLevel10k 
zinit light zsh-users/zsh-syntax-highlighting         # add ZSH Syntax Highlighting
zinit light zsh-users/zsh-completions                 # add ZSH Completions
zinit light zsh-users/zsh-autosuggestions             # add ZSH Syntax Highlighting
zinit light Aloxaf/fzf-tab                            # add FZF

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey "^r" fzf-history-widget
#bindkey "^I" fzf-completion
#bindkey "^T" fzf-file-widget
#bindkey "^[c" fzf-cd-widget

# History
HISTSIZE=9999
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias R='reset'
alias C='clear'
alias E='exit'
alias N='nvim'
alias Sz='source ~/.zshrc'
alias Nz='nvim ~/.zshrc'
alias F='fzf'
alias Fc='fzf --preview="bat --color=always {}"'
alias Nfc='nvim $(fzf -m --preview="bat --color=always {}")'

# Shell Instegrations
eval "$(fzf --zsh)"
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"


# MY CONFIG ---
# Aliases
alias lc="colorls --dark"

# Options
ZLE_RPROMPT_INDENT=0  # take off zsh line right prompt padding
unsetopt BEEP         # turn off error sounds


# DEFAULT CONFIG & OPTIONS ---
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/user/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set ZSH Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# FZF Styling
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

# To source oh-my-zsh ~ I haven't done this in this case for faster terminal loading
#plugins=(git)  # to load plugins through the oh-my-zsh ~ I use OMZP instead
#source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"