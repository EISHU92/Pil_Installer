#!/bin/bash
# PIL installer/remover
init() {
$1 $2 $3 $4
}
if [ "$1" ]; then
case $1 in
  install)
  if [ -f /bin/wget ]; then
  export PWDLATER=$PWD
  cd /tmp/pilinstall
  mkdir -p /tmp/pilinstall
  wget https://github.com/EISHU92/pil/releases/download/Pil_7/pil3.tar
  tar -xf $PWD/pil.tar
  chmod 777 *
  sudo bash $PWD/install install
  mkdir -p $HOME/.pil
  cp -r remove.list $HOME/.pil/remove.list
  cp -r install $HOME/.pil/install
  cp -r install__ $HOME/.pil/install__
  echo "Dont remove this directory while you had pil." >> $HOME/.pil/readme.txt
  cd $PWDLATER
  fi
  ;;
  remove)
  if [ -f $HOME/.pil/remove.list ]; then
  if [ -f $HOME/.pil/install__ ]; then
  if [ -f $HOME/.pil/install ]; then
  export PWDLATERA=$PWD
  cd $HOME/.pil
  init $PWD/install remove
  cd $PWDLATERA
  else
  echo "We dint found the <remove> file on $HOME/.pil/install."
  exit 1
  fi
  else
  echo "We dint found the <remove> file on $HOME/.pil/install__."
  exit 1
  fi
  else
  echo "Remove list not found. On $HOME/.pil/remove.list"
  exit 1
  fi
  ;;
esac
else
  if [ -f /bin/wget ]; then
  export PWDLATER=$PWD
  cd /tmp/pilinstall
  mkdir -p /tmp/pilinstall
  wget https://github.com/EISHU92/pil/releases/download/Pil_7/pil1.tar
  tar -xf $PWD/pil.tar
  chmod 777 *
  sudo bash $PWD/install install
  mkdir -p $HOME/.pil
  cp -r remove.list $HOME/.pil/remove.list
  cp -r install $HOME/.pil/install
  cp -r install__ $HOME/.pil/install__
  echo "Dont remove this directory while you had pil." >> $HOME/.pil/readme.txt
  cd $PWDLATER
  fi
fi
