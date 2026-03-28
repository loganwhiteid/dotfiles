function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -F --color=auto
}
function ga() {
    git add $1
}
function repos() {
    if [[ $1 == '' ]]
    then
        cl ~/repos
    else
        cl ~/repos/$1
    fi
} 
