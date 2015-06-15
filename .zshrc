export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH=/usr/local/bin/redis-cli:$PATH
export PATH=/usr/local/bin/redis-server:$PATH

HISTFILE=~/.zsh_history      # ヒストリファイルを指定
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

bindkey ^R history-incremental-search-backward

setopt correct
setopt list_packed

# LS_COLORSを設定しておく
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#
# # ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#タブで選べる
zstyle ':completion:*:default' menu select
#漢のzsh第五回まで設定しました！
#
alias ls="ls -G"
alias gls="gls --color"

alias dir_nginx_log="cd /var/log/nginx" 
alias dir_fluentd_log="cd /var/log/td-agent"
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias zsh_restart="exec $SHELL -l"
alias phpenv_buidoption="vim ~/.phpenv/plugins/php-build/share/php-build/default_configure_options";
alias dir_snippet="cd .vim/bundle/neosnippet-snippets/neosnippets"; #デフォルトペットフォルダ
alias dir_svlog="cd /private/var/log/supervisor/";
alias dir_wanodocs="cd /Volumes/wanodocs"
alias gco="git checkout"
alias gss="git status"
alias gad="git add"
alias gct="git commit"
alias grn="grep -r -n "

alias ssh="/bin/ssh-host-color"
alias history_r="bindkey ^R history-incremental-search-backward"; 

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

setopt re_match_pcre
function rprompt-git-current-branch {
    local name st color gitdir action

    if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
            return
    fi
    name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
    if [[ -z $name ]]; then
            return
    fi
    
    gitdir=`git rev-parse --git-dir 2> /dev/null`
    action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"
    
    st=`git status 2> /dev/null`
    if [[ "$st" =~ "(?m)^nothing to" ]]; then
            color=%F{green}
    elif [[ "$st" =~ "(?m)^nothing added" ]]; then
            color=%F{yellow}
    elif [[ "$st" =~ "(?m)^# Untracked" ]]; then
            color=%B%F{red}
    else
             color=%F{red}
    fi
    
    echo "$color$name$action%f%b "
}

setopt prompt_subst
RPROMPT=' [ `rprompt-git-current-branch`]'
PROMPT='[ %F{green}%W %f`cat /etc/hostname` %~] '

#zsh で補完候補が表示されている状態で、カーソル(カーソルキー、もしくは、C-f, C-b など) で選択する
autoload -U compinit
compinit -u
zstyle ':completion:*:default' menu select=1


export PATH=/usr/local/bin:$PATH

export LC_MESSAGES=ja_JP.UTF-8
export LC_IDENTIFICATION=ja_JP.UTF-8
export LC_COLLATE=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export LC_MEASUREMENT=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_TIME=ja_JP.UTF-8
export LC_NAME=ja_JP.UTF-8

