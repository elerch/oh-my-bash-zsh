# Current directory
[ -n "$BASH_VERSION" ] && DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
[ -n "$ZSH_VERSION" ] && DIR=$0:a:h

# Figure out the SHORT hostname
if [[ "$OSTYPE" = darwin* ]]; then
  # macOS's $HOST changes with dhcp, etc. Use ComputerName if possible.
  SHORT_HOST=$(scutil --get ComputerName 2>/dev/null) || SHORT_HOST=${HOST/.*/}
else
  SHORT_HOST=${HOST/.*/}
fi

# Load all of the config files in lib/ that end in .sh (ZSH specific stuff later)
# TIP: Add files you don't want in git to .gitignore
for config_file in $DIR/lib/*.sh; do
  custom_config_file="${CUSTOM}/lib/${config_file:t}"
  [ -f "${custom_config_file}" ] && config_file=${custom_config_file}
  source $config_file
done

# BASH-specific config
# Load all of the config files in lib/ that end in .bash
[ -n "$BASH_VERSION" ] && for config_file in $DIR/lib/*.bash; do
  custom_config_file="${CUSTOM}/lib/${config_file:t}"
  [ -f "${custom_config_file}" ] && config_file=${custom_config_file}
  source $config_file
done

########################################################################
# ZSH Specific stuff (mostly completion) below
########################################################################
[ -n "$BASH_VERSION" ] && return
# add a function path
fpath=($DIR/functions $DIR/completions $fpath)

# Load all stock functions (from $fpath files) called below.
autoload -U compaudit compinit

: ${ZSH_DISABLE_COMPFIX:=true}

# Set ZSH_CACHE_DIR to the path where cache files should be created
# or else we will use the default cache/
if [[ -z "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="$DIR/cache"
fi

# Load all of the config files in lib/ that end in .zsh
for config_file in $DIR/lib/*.zsh; do
  custom_config_file="${CUSTOM}/lib/${config_file:t}"
  [ -f "${custom_config_file}" ] && config_file=${custom_config_file}
  source $config_file
done

# Save the location of the current completion dump file.
if [ -z "$ZSH_COMPDUMP" ]; then
  ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
fi

if [[ $ZSH_DISABLE_COMPFIX != true ]]; then
  # If completion insecurities exist, warn the user without enabling completions.
  if ! compaudit &>/dev/null; then
    # This function resides in the "lib/compfix.zsh" script sourced above.
    handle_completion_insecurities
  # Else, enable and cache completions to the desired file.
  else
    compinit -d "${ZSH_COMPDUMP}"
  fi
else
  compinit -i -d "${ZSH_COMPDUMP}"
fi

# AWS is special and needs to be run at the very end, no matter what
# see: https://github.com/aws/aws-cli/issues/1819
source $DIR/lib-postcomp/aws.zsh
