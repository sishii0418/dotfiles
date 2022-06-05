# ============ #
# Zsh settings #
# ~/.zshrc     #
# ============ #

# メモ: ファイル分割しろ!

# export
export LANG=en_US.UTF-8
export EDITOR=nvim
export XDG_CONFIG_HOME=~/.config
export GOROOT=/usr/lib/go
export GOPATH=~/go
export CARGO=~/.cargo
export PATH=$PATH:$GOROOT/bin:$CARGO/bin:~/.local/bin:~/.local/lib
# export DISPLAY=localhost:0.0 # WSL1
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0 # WSL2用

# --雑多--
# {{{
# 自動補完
autoload -Uz compinit; compinit

# '='以降も補完
setopt magic_equal_subst

# emacs mode
bindkey -e

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

# 補完候補をカーソルキーで選択
zstyle ':completion:*:default' menu select true

# 補完時, 8ビットを通す
setopt print_eight_bit

# 隠しファイルをマッチ
setopt globdots

# 同時に起動したzshの間でヒストリを共有
setopt share_history

# ワイルドカード展開
setopt hist_reduce_blanks
# }}}

# --alias--
# {{{
alias vim='nvim'
alias sml='rlwrap sml'

alias pbcopy='clip.exe'
alias pbpaste='powershell.exe /c Get-Clipboard'

alias -g ...='../..'
alias -g ....='../../..'
alias -g A='| awk'
alias -g G='| grep'
alias -g H='| head'
alias -g L='| less'
alias -g S='| sed'
alias -g T='| tail'
alias -g W='| wc'
alias -g X='| xargs'
alias -g SJIS='| iconv -f SJIS'
alias -g Y='| pbcopy'

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'

alias mv='mv -iv'
alias cp='cp -ivr'
alias mkdir='mkdir -pv'
alias rm='rm -rv'
alias catn='cat -n'
alias rename='rename --filename --verbose'

alias langja='LANG=ja_JP.UTF_8'
alias langc='LANG=C'

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

alias pkgin="sudo pkg install"
alias pkgse="pkg search"

alias dnfin="sudo dnf install"
alias dnfse="dnf search"
alias dnfrm="sudo dnf remove"
alias dnfupg="sudo dnf upgrade"
alias dnfif="dnf info"

alias aptin="sudo apt install"
alias aptse="sudo apt search"
alias aptrm="sudo apt remove"
alias aptautorm="sudo apt autoremove"
alias aptup="sudo apt update"
alias aptug="sudo apt upgrade"

alias ヴぃm="vim"
alias cむs="cmus"

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

alias -s hs=runghc
alias -s py=python3
alias -s rb=ruby
# }}}

# 色
autoload colors
colors

export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'


# tmux 自動起動
# if [ -z $TMUX ]; then
#   tmux -2
# fi

# Prompt
PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%B%n%b%# "
RPROMPT="[%~]"

zle -N zle-keymap-select

# Compile
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi
