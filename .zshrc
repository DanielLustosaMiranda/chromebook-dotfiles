# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

if [ "$TERM" = "linux" ]; then
    # Cores Padrão (0-7)
    echo -en "\e]P0000000" # 0: Black
    echo -en "\e]P1aa0000" # 1: Red (Dull Red)
    echo -en "\e]P200aa00" # 2: Green (Dark Green)
    echo -en "\e]P3aa5500" # 3: Yellow (Brownish)
    echo -en "\e]P40000aa" # 4: Blue (Dark Blue)
    echo -en "\e]P5aa00aa" # 5: Magenta (Purple)
    echo -en "\e]P600aaaa" # 6: Cyan (Teal)
    echo -en "\e]P7aaaaaa" # 7: White (Light Gray)

    # Cores Brilhantes (8-15)
    echo -en "\e]P8555555" # 8: Bright Black (Dark Gray - Comments)
    echo -en "\e]P9ff5555" # 9: Bright Red (Vivid Red)
    echo -en "\e]PA55ff55" # 10: Bright Green (Lime Green)
    echo -en "\e]PBffff55" # 11: Bright Yellow
    echo -en "\e]PC5555ff" # 12: Bright Blue (Sky Blue)
    echo -en "\e]PDff55ff" # 13: Bright Magenta (Pink/Purple)
    echo -en "\e]PE55ffff" # 14: Bright Cyan (Aqua)
    echo -en "\e]PFffffff" # 15: Bright White (Pure White)
    
    clear # Limpa a tela para aplicar a nova paleta ao texto existente
fi

function build(){
    mkdir -p build
    cd build || return
    cmake .. || return
    make || return

}

function build_run() {
  mkdir -p build
  cd build || return
  cmake .. || return
  make -j$(nproc) || return

  exe=$(find . -maxdepth 1 -type f -executable | head -n 1)

  if [ -n "$exe" ]; then
    "$exe"
  else
    echo "Nenhum executável encontrado."
  fi
}

function build_clean() {
  if [ -d build ]; then
    rm -rf build
    echo "Build removido."
  else
    echo "Pasta build não existe."
  fi
}
function build_clean_soft() {
  if [ -d build ]; then
    rm -f build/CMakeCache.txt
    rm -rf build/CMakeFiles
    rm -f build/cmake_install.cmake build/Makefile
    echo "Cache do CMake limpo (soft clean)."
  else
    echo "Pasta build não existe."
  fi
}

extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xvjf "$1" ;;
      *.tar.gz)    tar xvzf "$1" ;;
      *.tar.xz)    tar xvJf "$1" ;;
      *.lzma)      unlzma "$1" ;;
      *.bz2)       bunzip2 "$1" ;;
      *.rar)       unrar x "$1" ;;
      *.gz)        gunzip "$1" ;;
      *.tar)       tar xvf "$1" ;;
      *.tbz2)      tar xvjf "$1" ;;
      *.tgz)       tar xvzf "$1" ;;
      *.zip)       unzip "$1" ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1" ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

mkcd() {
  mkdir -p "$1" && cd "$1"
}

venv() {
    source venv/bin/activate
}

venv_here() {
  local VENV_DIR="venv"

  if [ -d "$VENV_DIR" ]; then
    echo "%F{yellow}[!] Virtual environment already exists at $VENV_DIR%f"
  else
    echo "%F{cyan}[+] Creating virtual environment in $VENV_DIR...%f"
    python3 -m venv "$VENV_DIR"
    echo "%F{green}[✔] Created virtual environment.%f"
  fi

  echo "%F{cyan}[+] Activating virtual environment...%f"
  source "$VENV_DIR/bin/activate"
}

venv_clean() {
  echo "%F{red}[-] Removing virtual environment .venv...%f"
  rm -rf .venv && echo "%F{green}[✔] Removed.%f"
}

clean_build() {
  echo "[~] Cleaning project...%f"

  if [ -f Makefile ] || [ -f makefile ]; then
    echo "[*] Running make clean...%f"
    make clean && echo "[✔] Cleaned with make%f" || echo "[✘] Clean failed%f"
  fi

  [ -d build ] && rm -rf build && echo "[✔] Removed ./build%f"

  find . -type f \( -name '*.o' -o -name '*.pyc' -o -name '*.pyo' \) -delete && \
  echo "[✔] Deleted object/bytecode files%f"

  find . -type d -name '__pycache__' -exec rm -rf {} + && \
  echo "[✔] Removed __pycache__ directories%f"
}

# Smart function to build a CMake project
build_all() {
    # Define the standard name for the build directory
    local build_dir="build"

    # Check if the build directory does NOT exist
    if [ ! -d "$build_dir" ]; then
        echo "==> Build directory not found. Configuring with CMake..."
        mkdir "$build_dir"
        
        # Configure the project. Exit with an error if cmake fails.
        cmake -S . -B "$build_dir" || return 1
    fi

    echo "==> Building project..."
    # Run the actual build command inside the build directory.
    # "$@" passes all arguments from your 'build' command directly to 'make'.
    # e.g., 'build clean' becomes 'make clean'
    make -C "$build_dir" "$@"

    # Check the exit status of the 'make' command to report success or failure.
    if [ $? -eq 0 ]; then
        echo "==> Build successful!"
    else
        echo "==> Build failed. "
    fi
}
export SUDO_EDITOR="nvim"


export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export MANROFFOPT="-c"

export LESS_TERMCAP_mb=$'\e[1;31m'      # Begins blinking
export LESS_TERMCAP_md=$'\e[1;33m'      # Begins bold (headers)
export LESS_TERMCAP_me=$'\e[0m'         # Ends mode
export LESS_TERMCAP_se=$'\e[0m'         # Ends standout-mode
export LESS_TERMCAP_so=$'\e[01;44;33m'  # Begins standout-mode (search results)
export LESS_TERMCAP_ue=$'\e[0m'         # Ends underline
export LESS_TERMCAP_us=$'\e[1;4;32m'    # Begins underline (variables)
