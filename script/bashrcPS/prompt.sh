# A wrapper function to keep colors from polluting global space
function parse_git_branch() {
#    TAGS=`git describe --tags 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    local local_dir=`pwd`
    local SYMBOL_SUN=$'\xf0\x9f\x94\x85'
    local INPUT_FILE_PREFIX='LA.UM.6.2'

    if [[ $local_dir == *"${INPUT_FILE_PREFIX}"* ]] || [ $(ls $local_dir/${INPUT_FILE_PREFIX}* 2>/dev/null | wc -l) == 1 ]; then
        while [[ $local_dir == *${INPUT_FILE_PREFIX}* ]]
        do
            local_dir=`dirname $local_dir`
        done
        TAGS=`git --git-dir=${local_dir}/.git --work-tree=${local_dir} describe --tags`
        if [ ! "${TAGS}" == "" ]
        then
            echo -e "${SYMBOL_SUN}[${TAGS}]"
        else
            echo ""
        fi
    fi
}

function parse_dir() {
    local local_dir=`pwd`
    local SYMBOL_Four_leaf_clover=$'\xf0\x9f\x8d\x80'
    if [ $local_dir == $HOME ]; then
        echo "\W"
    fi
}

# Main prompt
function _set_prompt () {
    # SYMBOL
    local SYMBOL_BR=$'\xee\x82\xa0'
    local NEXT_LINE_SYMBOL=$'\xe1\x96\xa4\x20'
    local SYMBOL_Four_leaf_clover=$'\xf0\x9f\x8d\x80'
    local SYMBOL_MEAT_ON_BONE=$'\xf0\x9f\x8d\x96'
    local SYMBOL_Paperclip=$'\xf0\x9f\x93\x8e'
    local SYMBOL_Clock_face_nine=$'\xf0\x9f\x95\x98'
    local SYMBOL_Bust_in_silhouette=$'\xf0\x9f\x91\xa4'
    local SYMBOL_START=$'\xf0\x9f\x92\xab'
    local SYMBOL_Four_leaf_clover=$'\xf0\x9f\x8d\x80'
    local SYMBOL_SUN=$'\xf0\x9f\x94\x85'

    # COLOR
    local R="\[\033[0m\]" #reset
    local B='\e[1m' #bold
    local D="\[\033[2m\]" #dim
    local U="\[\033[4m\]" #underline
    local UNDER='\e[4m'  #Underline

    local        BLUE="\[\033[0;34m\]"
    local   BLUE_BOLD="\[$(tput bold)\]\[\033[38;5;39m\]"
    local   BLUE_BOLD_UNDERLINE="\[$(tput bold)\]\[\033[38;5;39m\]"
    local         RED="\[\033[0;31m\]"
    local   LIGHT_RED="\[$(tput bold)\]\[\033[38;5;222m\]"
    local   LIGHT_ORANGE="\[$(tput bold)\]\[\033[38;5;202m\]"
    local       GREEN="\[\033[0;32m\]"
    local LIGHT_GREEN="\[$(tput bold)\]\[\033[38;5;10m\]"
    local       WHITE="\[\033[0;37m\]"
    local  WHITE_BOLD="\[\033[1;37m\]"
    local  LIGHT_GRAY="\[\033[0;37m\]"
    local     DEFAULT="\[\033[39m\]"
    local         RED="\[\033[91m\]"
    local       GREEN="\[\033[32m\]"
    local      YELLOW="\[\e[33m\]"
    local      LIGHT_YELLOW="\[$(tput bold)\]\[\033[38;5;11m\]"
    local        BLUE="\[\033[34m\]"
    local     MAGENTA="\[\033[95m\]"
    local        CYAN="\[\033[96m\]"
    local       WHITE="\[\033[97m\]"
    local        GREY="\[\033[90m\]"
    # * == unstages
    # + == staged changes
    export GIT_PS1_SHOWDIRTYSTATE="1"
    # $ next to branch named if stashed state
    export GIT_PS1_SHOWSTASHSTATE="1"
    # % next to branch name of untracked files
    export GIT_PS1_SHOWUNTRACKEDFILES="1"
    # will show state compared to upstream
    # < you are behind upstream
    # > you are ahead of upstream
    # <> you have diverged from upstream
    # = matches upstream
    export GIT_PS1_SHOWUPSTREAM="auto"

    local FULL_DIR=`dirs +0`
    local DIRNAME_DIR=`dirname $FULL_DIR`
    #make that damn PS1
    #split in lines to easy readability
    if [ $PWD == $HOME ]; then
        export PS1="${debian_chroot:+($debian_chroot)}\
${SYMBOL_SUN}${R}${BLUE_BOLD}[\u]\
 ${R}${WHITE}\W${R} \\$\[$(tput sgr0)\]\
\n${BLUE}${R}"${NEXT_LINE_SYMBOL}${R}
    else
        export PS1="${debian_chroot:+($debian_chroot)}\
${SYMBOL_SUN}${R}${BLUE_BOLD}[\u]\
${R}${LIGHT_RED}\`parse_git_branch\`${R}\
 ${R}${WHITE}${DIRNAME_DIR}/${R}${LIGHT_RED}${U}\W${R} ${WHITE}\\$\[$(tput sgr0)\]${R}\
\n${BLUE}${R}"${NEXT_LINE_SYMBOL}${R}
    fi

    export PS2="${R}${BLUE}||${R} "
}
#set the prompt by calling the wrapper
_set_prompt



