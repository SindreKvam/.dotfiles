# Prompt styling
#PROMPT="%F{cyan}%n %1~ >> %f"

# Parse git branch
#parse_git_branch() {
#    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
#}
#COLOR_GIT="%F{red}"
#PROMPT+="${COLOR_GIT}$(parse_git_branch)"


# Parse git to find branch name
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

setopt PROMPT_SUBST
export PROMPT='%F{166}%n%f %F{blue}%1~ %f%F{red}$(parse_git_branch)%f %F{normal}>> %f'
# 166 is orange


# Enable colours in the terminal
export CLICOLOR=1
