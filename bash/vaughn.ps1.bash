#### PS1 customization ####
NONE="\[\033[0m\]"    # unsets color to term fg color

# regular colors
K="\[\033[0;30m\]"    # black
R="\[\033[0;31m\]"    # red
G="\[\033[0;32m\]"    # green
Y="\[\033[0;33m\]"    # yellow
B="\[\033[0;34m\]"    # blue
M="\[\033[0;35m\]"    # magenta
C="\[\033[0;36m\]"    # cyan
W="\[\033[0;37m\]"    # white

# emphasized (bolded) colors
EMK="\[\033[1;30m\]"
EMR="\[\033[1;31m\]"
EMG="\[\033[1;32m\]"
EMY="\[\033[1;33m\]"
EMB="\[\033[1;34m\]"
EMM="\[\033[1;35m\]"
EMC="\[\033[1;36m\]"
EMW="\[\033[1;37m\]"

# background colors
BGK="\[\033[40m\]"
BGR="\[\033[41m\]"
BGG="\[\033[42m\]"
BGY="\[\033[43m\]"
BGB="\[\033[44m\]"
BGM="\[\033[45m\]"
BGC="\[\033[46m\]"
BGW="\[\033[47m\]"

# displays only the last 40 characters of pwd
set_new_pwd() {
    # How many characters of the $PWD should be kept
    local pwdmaxlen=40
    # Indicate that there has been dir truncation
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}

# the name of the git branch in the current directory
set_git_branch() {
    unset GIT_BRANCH
    local branch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'`;

    if test "$branch"
        then
            GIT_BRANCH="${EMG}git:${NONE}$branch"
    fi
}


# the name of the activated virtual env
set_virtual_env_base() {
    unset VIRTUAL_ENV_BASE
    local venv=`basename "$VIRTUAL_ENV"`

    if test $venv
        then
            VIRTUAL_ENV_BASE="($venv) "
    fi
}


# hostname
set_hostname() {
  unset HOST_FOR_PROMPT

  # Default to current host's prompt
  local current_host=`hostname`
  local color=${EMR}
  
  # Get hostname for mac and replace it with something shorter
  if [ `uname -s` = "Darwin" ] 
    then
      current_host=Sol
      color=${EMG}
  fi

  HOST_FOR_PROMPT="${color}$current_host${NONE}"

}


set_exit_status() {

  if [ $EXITSTATUS -eq 0 ]
  then
    EXIT_STATUS_PROMPT=""
    # If you want to show exit code 0, re-enable this:
    # EXIT_STATUS_PROMPT=" ${G}${EXITSTATUS}${NONE}"
  else
    EXIT_STATUS_PROMPT=" ${R}${EXITSTATUS}${NONE}"
  fi
}


update_prompt() {
    # This needs to be at the beginning so it doesn't capture things from other commands in this function.
    EXITSTATUS=$?

    # Cool unicode herbal symbol
    HERB_SYMBOL=$(echo -e "\xf0\x9f\x8c\xbf")
    GOOGLY_EYES=$(echo -e "\xf0\x9f\x91\x80")
    LOCKED=$(echo -e "\xf0\x9f\x94\x92")
    UNLOCKED=$(echo -e "\xf0\x9f\x94\x93")
    ROCKET=$(echo -e "\xf0\x9f\x9a\x80")

    set_new_pwd
    set_git_branch
    set_virtual_env_base
    set_hostname
    set_exit_status

#    PS1="${HOST_FOR_PROMPT} ${VIRTUAL_ENV_BASE}${GIT_BRANCH}${EMB}${NEW_PWD}${EXIT_STATUS_PROMPT}${NONE} ${ROCKET}  "
#    PS1="${HOST_FOR_PROMPT} ${VIRTUAL_ENV_BASE}${GIT_BRANCH}${EMB}${NEW_PWD}${EXIT_STATUS_PROMPT}${NONE} \$ "
    PS1="${HOST_FOR_PROMPT} ${VIRTUAL_ENV_BASE}${GIT_BRANCH}${EMC}${NEW_PWD}${NONE} \$ "

}

PROMPT_COMMAND=update_prompt
