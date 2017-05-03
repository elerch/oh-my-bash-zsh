# ls colors
autoload -U colors && colors

setopt auto_cd
setopt multios
setopt prompt_subst

# Take advantage of $LS_COLORS for completion as well.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
