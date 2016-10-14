# ~/.zshrc zsh シェルの設定


# Language setting
export LANG=en_US.UTF-8

# neovim のファイル置き場
export XDG_CONFIG_HOME=~/.config

# 自動補完
autoload -Uz compinit; compinit

# alias
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

# コマンドのスペルミスを指摘
setopt correct

# 移動したディレクトリを記録 "cd -[Tab]" で一覧
setopt auto_pushd

# コマンドが履歴に含まれる場合,古い方を削除
setopt hist_ignore_all_dups

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

# 色
autoload colors
colors

export LSCOLORS=gxfxcxdxbxexexaxaxaxax
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'
zstyle ':completion:*' list-colors 'di=32'

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
