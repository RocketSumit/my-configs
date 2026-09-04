# Autostart / attach tmux before p10k instant prompt
if [[ -z "$TMUX" && -t 0 ]]; then
  UNATTACHED=$(tmux list-sessions -F "#{session_name}:#{session_attached}" 2>/dev/null | awk -F: '$2 == 0 {print $1; exit}')

  if [[ -n "$UNATTACHED" ]]; then
    exec tmux attach-session -t "$UNATTACHED"
  else
    exec tmux new-session
  fi
fi
# Only run this file when the current shell is zsh. If it's accidentally sourced
# by bash (or another shell), stop processing here to avoid syntax errors and
# zsh-only commands being run.
if [ -z "${ZSH_VERSION-}" ]; then
    # If this file is sourced, `return` will stop processing. If it's executed
    # as a script, `return` will fail, so fall back to exiting the script.
    return 2>/dev/null || exit 0
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.3/bin:$PATH"
  export PATH="$HOME/.gem/ruby/3.0.3/bin:$PATH"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
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
# zstyle ':omz:update' mode auto      # update automatically without asking
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
plugins=(git git-flow colored-man-pages zsh-syntax-highlighting zsh-autosuggestions pip python vi-mode colorize autojump tmux docker web-search sudo history zsh-history-substring-search)

if [ -f "$ZSH/oh-my-zsh.sh" ]; then
    source "$ZSH/oh-my-zsh.sh"
else
    # oh-my-zsh not installed or ZSH path incorrect; skip sourcing to avoid errors
    true
fi

# autocomplete key
bindkey '^[ ' autosuggest-accept
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# OS specific aliases
if [[ "$OSTYPE" == "linux"* ]]; then
  alias vim="~/Applications/nvim.appimage";
else
  alias vim="~/Applications/nvim-macos-arm64/bin/nvim";
fi

alias zshconfig="vim ~/.zshrc"
alias sauce="source ~/.zshrc"
alias close="tmux kill-server"
alias ld='$HOME/.local/bin/lazydocker'
alias lg='lazygit'
alias t="tree -L" 
alias d='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# curser change for vi mode
function zle-keymap-select () {
    case $KEYMAP in
    vicmd) echo -ne '\e[1 q';; # block
    viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

compress_video() {
  local delete_flag=0
  local args=()
  
  # Argument filtering
  for arg in "$@"; do
    if [ "$arg" = "-d" ]; then
      delete_flag=1
    else
      args+=("$arg")
    fi
  done

  # Reset positional parameters ($1, $2, $3) to our filtered arguments
  set -- "${args[@]}"

  local input_file="$1"
  
  # Ensure an input file was passed
  if [ -z "$input_file" ]; then
    echo "Usage: compress_video [-d] <input_file> [crf] [speed]"
    return 1
  fi

  # Set parameters (defaulting to crf=28 and speed=1)
  local crf="${2:-28}"
  local speed="${3:-1}"
  local output_file="${input_file%.*}_comp.${input_file##*.}"

  # Run ffmpeg. Added -af "atempo" to match audio speed with video speed
  if ffmpeg -i "$input_file" \
            -vf "setpts=PTS/$speed,drawtext=text='${}x':x=10:y=10:fontsize=24:fontcolor=white" \
            -af "atempo=$speed" \
            -vcodec libx264 -crf "$crf" "$output_file"; then
            
    # ONLY delete original if ffmpeg succeeds
    if [ "$delete_flag" -eq 1 ]; then
      rm -- "$input_file"
      echo "Original file deleted: $input_file"
    fi
  else
    echo "Compression failed. Original file kept safely."
    return 1
  fi
}

compress_video_an() {
  local delete_flag=0
  local args=()
  
  # Argument filtering
  for arg in "$@"; do
    if [ "$arg" = "-d" ]; then
      delete_flag=1
    else
      args+=("$arg")
    fi
  done

  # Reset positional parameters ($1, $2, $3) to our filtered arguments
  set -- "${args[@]}"

  local input_file="$1"
  
  # Ensure an input file was passed
  if [ -z "$input_file" ]; then
    echo "Usage: compress_video_an [-d] <input_file> [crf] [speed]"
    return 1
  fi

  # Set parameters
  local crf="${2:-28}"
  local speed="${3:-1}"
  local output_file="${input_file%.*}_comp.${input_file##*.}"

  # Run ffmpeg with -an (no audio)
  if ffmpeg -i "$input_file" \
            -vf "setpts=PTS/$speed,drawtext=text='${}x':x=10:y=10:fontsize=24:fontcolor=white" \
            -vcodec libx264 -crf "$crf" -an "$output_file"; then
            
    # ONLY delete original if ffmpeg succeeds
    if [ "$delete_flag" -eq 1 ]; then
      rm -- "$input_file"
      echo "Original file deleted: $input_file"
    fi
  else
    echo "Compression failed. Original file kept safely."
    return 1
  fi
}


combine_videos(){
  file_name="$1"
  ls | grep -v 'filelist.txt' | awk '{print "file "$0""}' > filelist.txt
  ffmpeg -f concat -safe 0 -i filelist.txt -c copy -an "$file_name"
  rm filelist.txt
}

compress_pdf() {
    local dpi=150
    local files=()

    # Check Ghostscript
    if ! command -v gs >/dev/null 2>&1; then
        echo "Error: Ghostscript (gs) is not installed."

        if [[ "$OSTYPE" == "darwin"* ]]; then
            echo "Install with: brew install ghostscript"
        else
            echo "Install with: sudo apt install ghostscript"
        fi
        return 1
    fi

    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --dpi)
                shift
                if [[ "$1" =~ ^[0-9]+$ ]]; then
                    dpi="$1"
                else
                    echo "Error: --dpi requires a numeric value"
                    return 1
                fi
                ;;
            *)
                files+=("$1")
                ;;
        esac
        shift
    done

    # Validate input
    if [[ ${#files[@]} -eq 0 ]]; then
        echo "Usage:"
        echo "  compress_pdf [--dpi 150] file1.pdf file2.pdf ..."
        return 1
    fi

    # Process files
    for input in "${files[@]}"; do

        if [[ ! -f "$input" ]]; then
            echo "Skipping '$input' (file not found)"
            continue
        fi

        if [[ "${input##*.}" != "pdf" ]]; then
            echo "Skipping '$input' (not a PDF)"
            continue
        fi

        local base="${input%.pdf}"
        local output="${base}_comp.pdf"

        echo "Compressing: $input -> $output (DPI: $dpi)"

        gs -sDEVICE=pdfwrite \
           -dCompatibilityLevel=1.4 \
           -dNOPAUSE \
           -dQUIET \
           -dBATCH \
           -dDownsampleColorImages=true \
           -dDownsampleGrayImages=true \
           -dDownsampleMonoImages=true \
           -dColorImageResolution="$dpi" \
           -dGrayImageResolution="$dpi" \
           -dMonoImageResolution="$dpi" \
           -sOutputFile="$output" \
           "$input"

        if [[ $? -eq 0 ]]; then
            echo "Done: $output"
        else
            echo "Failed: $input"
        fi
    done
}

mp4_to_gif() {
    # Check if an argument is given
    if [ -z "$1" ]; then
        echo "Usage: mp4_to_gif input.mp4"
        return 1
    fi

    input="$1"
    base="${input%.*}"
    gif="${base}.gif"
    palette="palette_${base}.png"

    # Generate palette
    ffmpeg -y -i "$input" -vf "fps=10,scale=320:-1:flags=lanczos,palettegen" "$palette"

    # Use palette to generate GIF
    ffmpeg -y -i "$input" -i "$palette" -filter_complex "fps=10,scale=320:-1:flags=lanczos[x];[x][1:v]paletteuse" "$gif"

    # Remove palette file after conversion
    rm -f "$palette"

    echo "GIF saved as $gif"
}

tmux_split_n() {
    local n=$1
    if [[ -z "$n" ]] || (( n < 1 )) || (( n > 10 )); then
        echo "Usage: tmux_split_n <number_of_panes: 1-10>"
        return 1
    fi

    # Get grid size: rows x cols
    local rows cols
    cols=$(awk -v n="$n" 'BEGIN{print int(sqrt(n)+0.9999)}')
    rows=$(( (n + cols - 1) / cols ))

    # Start in a clean window if desired
    # tmux new-window  # Optional: Uncomment to always start in a new window

    # Function works inside tmux only
    if [[ -z "$TMUX" ]]; then
        echo "Please run this inside a tmux session."
        return 1
    fi

    # Close other panes, keep only one
    tmux select-pane -t 0
    tmux kill-pane -a

    # Split to get the first row
    for ((i=1; i<cols; i++)); do
        tmux split-window -h
        tmux select-pane -R
    done

    tmux select-layout tiled

    # For additional rows
    local total_panes=$cols
    for ((r=1; r<rows; r++)); do
        # Select first pane of previous row
        tmux select-pane -t $(( (r-1)*cols ))
        tmux split-window -v
        # For all but the first column in this row, split further
        for ((c=1; c<cols; c++)); do
            tmux select-pane -t $(( r*cols + c - 1 ))
            tmux split-window -h
        done
        tmux select-layout tiled
        total_panes=$((total_panes+cols))
    done

    # If we created more panes than requested, kill the extras
    while (( total_panes > n )); do
        tmux kill-pane -t $((total_panes-1))
        total_panes=$((total_panes-1))
    done

    tmux select-layout tiled
}

fix_cuda(){
  sudo rmmod nvidia_uvm
  sudo modprobe nvidia_uvm
}

# Define where history is stored and its size
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Core settings for sharing history
setopt noincappendhistory
setopt nosharehistory

# Substring history search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6

# Add this to the end of ~/.zshrc
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
fpath+=${ZDOTDIR:-~}/.zsh_functions

export PATH="$HOME/.local/bin:$PATH"
