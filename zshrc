# Path to your Oh My Zsh installation

export ZSH="$HOME/.oh-my-zsh"

# Theme (switch to something lightweight if still slow)

ZSH_THEME="robbyrussell"

# Keep plugins minimal for speed

plugins=(git z)

source $ZSH/oh-my-zsh.sh

# ----------------------------

# Basic environment

# ----------------------------

export EDITOR='vim'
export HISTTIMEFORMAT="%d/%m/%y %T "

# ----------------------------

# PATH (consolidated)

# ----------------------------

export PATH="$HOME/.local/bin:/usr/local/bin:/usr/local/opt/ruby/bin:/usr/local/opt/bison/bin:/opt/homebrew/opt/openjdk/bin:$HOME/.cargo/bin:$HOME/.mozbuild/arcanist/bin:$HOME/.mozbuild/moz-phab:$HOME/.rvm/bin:$HOME/Work/.wasmtime/bin:$HOME/Work/cool/bin:$PATH"

# ----------------------------

# Node (use ONE manager only)

# Keeping "n" (fast). Removed nvm entirely.

# ----------------------------

export N_PREFIX="$HOME/n"
[[ ":$PATH:" != *":$N_PREFIX/bin:"* ]] && export PATH="$N_PREFIX/bin:$PATH"

# ----------------------------

# Lazy-load Conda (huge speed win)

# ----------------------------

function conda() {
unset -f conda
source "$HOME/miniconda3/etc/profile.d/conda.sh"
conda "$@"
}

# ----------------------------

# Aliases

# ----------------------------

alias v="vim"
alias la='ll -a'
alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}'
alias t='tail -f'

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L='| less'
alias -g M='| most'
alias -g LL='2>&1 | less'
alias -g CA='2>&1 | cat -A'
alias -g NE='2> /dev/null'
alias -g NUL='> /dev/null 2>&1'
alias -g P='2>&1| pygmentize -l pytb'

alias dud='du -d 1 -h' # 1 level deep, human readable
alias duf='du -sh *' # size of everything in current directory
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias p='ps -f'
alias psaux='ps aux'
alias sortnr='sort -n -r'
alias unexport='unset'

# ----------------------------

# Optional: faster prompt (disable git dirty checks)

# ----------------------------

DISABLE_UNTRACKED_FILES_DIRTY="true"
precmd() { print "" }
PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f $(git_prompt_info)
❯ '
