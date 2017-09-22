## PROMPT
# vcs_infoロード
autoload -Uz vcs_info

# PROMPT変数内で変数参照する
setopt prompt_subst

# vcsの表示
zstyle ':vcs_info:*' formats '%b'
zstyle ':vcs_info:*' actionformats '%b|%a'

setopt nonomatch

# vcs_info呼び出し
precmd () {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

PROMPT="%n:%~ %1(v|(%F{green}%1v%f) |)$ "

## Alias
# ls
# lsでのディレクトリの表示色を変更
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -aG'
alias ll='ls -la'
alias la='ls -lahF'

# global
alias -g G='| grep'
alias -g C='| cat'

# nvimをvimに
alias vim=nvim

# cd
alias ...='cd ../'
alias ....='cd ../../'

## 補完
# 補完を有効にする
autoload -U compinit
compinit

# カーソル位置で補完する
setopt complete_in_word

# ビープ音を鳴らさない
setopt no_beep

# ディレクトリ名だけでcdする
setopt auto_cd

## PATH
path=(
	/usr/local/Homebrew/bin(N-/)
	/usr/local/bin(N-/)
    /usr/local/texlive/2016basic/bin/x86_64-darwin(N-/)
	$path
)

# anyenv
if [[ -d "$HOME/.anyenv" ]] then
	path=($HOME/.anyenv/bin $path)
	eval "$(anyenv init - zsh)"
fi

# cargo
if [[ -d "$HOME/.cargo" ]] then
    path=($HOME/.cargo/bin $path)
    export RUSTFLAGS="-C target-cpu=native"
fi
