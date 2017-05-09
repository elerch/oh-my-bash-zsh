_homebrew-installed() {
  type brew &> /dev/null
}

_awscli-homebrew-installed() {
  brew list awscli &> /dev/null
}

export AWS_HOME=~/.aws

function agp {
  echo $AWS_DEFAULT_PROFILE
}

function asp {
  local rprompt=${RPROMPT/<aws:$(agp)>/}

  export AWS_DEFAULT_PROFILE=$1
  export AWS_PROFILE=$1

  export RPROMPT="<aws:$AWS_DEFAULT_PROFILE>$rprompt"
}

function aws_profiles {
  reply=($(grep profile $AWS_HOME/config|sed -e 's/.*profile \([a-zA-Z0-9_-]*\).*/\1/'))
}

compctl -K aws_profiles asp

# This is the default install location for homebrew. brew and
# brew list are very slow, so we'll check the default path first
if [ -r "/usr/local/opt/awscli/libexec/bin/aws_zsh_completer.sh" ]; then
   # Mac
  _aws_zsh_completer_path="/usr/local/opt/awscli/libexec/bin/aws_zsh_completer.sh"
elif [ -r "/usr/share/zsh/site-functions/aws_zsh_completer.sh" ]; then
  # Amazon linux
  _aws_zsh_completer_path="/usr/share/zsh/site-functions/aws_zsh_completer.sh"
elif hash aws_zsh_completer.sh 2> /dev/null; then
    _aws_zsh_completer_path=$(which aws_zsh_completer.sh)
elif _homebrew-installed && _awscli-homebrew-installed ; then
  _aws_zsh_completer_path=$(brew --prefix awscli)/libexec/bin/aws_zsh_completer.sh
fi

[ -x "$_aws_zsh_completer_path" ] && source $_aws_zsh_completer_path
[ ! -z "$_aws_zsh_completer_path" ] && unset _aws_zsh_completer_path
