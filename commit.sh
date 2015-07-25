
pwd | grep -q '/chronica' || exit 1

c0http() {
  cd util
  pwd
  git remote set-url origin https://github.com/evanx/redexutil
  git remote -v 
  cd ../scripts
  pwd
  git remote set-url origin https://github.com/evanx/chronica-scripts
  git remote -v 
  cd ..
  git submodule sync 
  cat .gitmodules
}

c0evanx() {
  cd util
  pwd
  git remote set-url origin git@github.com:evanx/redexutil.git
  git remote -v
  git checkout master
  git pull
  cd ../scripts
  pwd
  git remote set-url origin git@github.com:evanx/chronica-scripts.git
  git remote -v
  git checkout master
  git pull
  cd ..
  git submodule sync 
  cat .gitmodules
}

c1push() {
  message="$1"
  pwd
  git add --all
  git commit -m "$message"
  git push
  git status
  echo
}

c1commit() {
  c0evanx
  message="$1"
  c1push $message
  cd util
  c1push $message
  cd ../scripts
  c1push $message
  cd ..
  c0http
  c1push $message
}


if [ $# -gt 0 ]
then
  if [ $# -eq 1 ] 
  then
    if [ "$1" = 'push' ]
    then
      c1push 'update'
    else
      c1commit "$1"
    fi
  else
    echo "ERROR: $# args"
    echo "Usage: single arg commit message"
  fi
else
  c1commit "update"
fi
