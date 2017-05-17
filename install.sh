#!/bin/zsh

if [ -f ~/.zshenv ] || [ -h ~/.zshenv ]; then
  printf "Found zshenv, making backup to ~/.zshenv.pre-jkprezto"
  mv ~/.zshenv ~/.zshenv.pre-jkprezto
fi

cat << EOF > ~/.zshenv
ZDOTDIR=\$HOME/.zhome
. \$ZDOTDIR/.zshenv
EOF

ZDOTDIR=$HOME/.zhome

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/prezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

