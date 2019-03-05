# A wrapper function to keep colors from polluting global space
# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=`parse_git_dirty`
        echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}
# get current status of git repo
function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}
# Main prompt
function _set_prompt () {
    # SYMBOL
    local BR_SYMBOL=$'\xee\x82\xa0'
    local NEXT_LINE_SYMBOL=$'\xe1\x96\xa4\x20'
    local  EMOJI=$'\xe2\x9b\x85'

    # COLOR
    local R="\[\033[0m\]" #reset
    local B="\[\033[1m\]" #bold
    local D="\[\033[2m\]" #dim
    local U="\[\033[4m\]" #underline

    local        BLUE="\[\033[0;34m\]"
    local   BLUE_BOLD="\[$(tput bold)\]\[\033[38;5;39m\]"
    local         RED="\[\033[0;31m\]"
    local   LIGHT_RED="\[$(tput bold)\]\[\033[38;5;222m\]"
    local       GREEN="\[\033[0;32m\]"
    local LIGHT_GREEN="\[\033[1;32m\]"
    local       WHITE="\[\033[0;37m\]"
    local  WHITE_BOLD="\[\033[1;37m\]"
    local  LIGHT_GRAY="\[\033[0;37m\]"
    local     DEFAULT="\[\033[39m\]"
    local         RED="\[\033[91m\]"
    local       GREEN="\[\033[32m\]"
    local      YELLOW="\[\e[33m\]"
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

    #make that damn PS1
    #split in lines to easy readability
    #-- Test:
    #\$(__git_ps1 \" ${LIGHT_RED}${BR_SYMBOL} %s\")\
    #\${R}${LIGHT_RED}\`parse_git_branch\`\
    export PS1="${EMOJI}${debian_chroot:+($debian_chroot)}\
${R}${WHITE_BOLD}[\t]${R}${WHITE_BOLD}[\h]${R}${BLUE_BOLD}[\w]\
#\${R}${LIGHT_RED}\`parse_git_branch\`\
\n${BLUE}${R}"${NEXT_LINE_SYMBOL}

    export PS2="${R}${BLUE}||${R}  "
}
#set the prompt by calling the wrapper
_set_prompt

