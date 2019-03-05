Add it in ~/.bashrc:
...
if [[ $PROMPT_COMMAND != *"${PROMPT_SH}"* ]]; then
    export PROMPT_COMMAND="source $PROMPT_SH; ${PROMPT_COMMAND}"
fi
...
...
if [[ $PROMPT_COMMAND != *"history -a; history -n;"* ]]; then
    export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
fi


