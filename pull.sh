
if ! pwd | grep -q '/chronica'
then
  echo 'Please run from chronica app directory e.g. cd ~/chronica'
  exit 1
fi

  git pull
  [ -f util/.git ] || git submodule init
  git submodule update

  npm install

  cd util
  git checkout master
  git pull

