# ============ #
# Zsh settings #
# ~/.zshrc     #
# ============ #


# export
export LANG=en_US.UTF-8
export EDITOR=nvim
export XDG_CONFIG_HOME=~/.config

# 自動補完
autoload -Uz compinit; compinit

# コマンドのスペルミスを指摘
setopt correct

# 移動したディレクトリを記録 "cd -[Tab]" で一覧
setopt auto_pushd

# コマンドが履歴に含まれる場合,古い方を削除
setopt hist_ignore_all_dups

# Path
path=($HOME/.local/bin(N-/) $path)

# 小文字で大文字を補完
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ディレクトリ名の入力で cd
setopt auto_cd

# 補完候補を一覧で表示
setopt auto_list
setopt nonomatch

# 補完時,8ビットを通す
setopt print_eight_bit

# 隠しファイルをマッチ
setopt globdots

# alias
# {{{
alias vim='nvim'

alias -g ...='../..'
alias -g ....='../../..'
alias -g G='| grep'

alias ls='ls -G'
alias mv='mv -i'
alias cp='cp -i'
alias mkdir='mkdir -p'

alias pacupg="sudo pacman -Syu"
alias pacin="sudo pacman -S"
alias pacins="sudo pacman -U"
alias pacrem="sudo pacman -Rns"
alias pacrep="pacman -Si"
alias pacreps="pacman -Ss"

alias yaoin="yaourt -S"
alias yaodl="yaourt -G"
alias yaorep="yaourt -Si"
alias yaoreps="yaourt -Ss"

alias sysstr="sudo systemctl start"
alias sysenb="sudo systemctl enable"

function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -d $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

function runcpp(){ g++ -O2 $1; ./a.out }
alias -s {c,cpp}=runcpp
# }}}

# 色
autoload colors
colors

export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'

case "${OSTYPE}" in
linux*)
	alias ls='ls -F --color'
	;;
esac

# tmux 自動起動
if [ -z $TMUX ]; then
	tmux -2
fi

# プロンプト
PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%B%n%b%# "
RPROMPT="[%~]"

zle -N zle-keymap-select
