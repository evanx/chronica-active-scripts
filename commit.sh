
c0pwd() {
  if ! pwd | grep -q '/chronica$' 
  then
    echo 'Abort, because not in chronica subdirectory'
    exit 1
  fi
}

c0sync() {
  c0pwd
  git submodule sync 
  cat .gitmodules | grep evanx
}

c0http() {
  c0pwd
  cd util
  pwd
  git remote set-url origin https://github.com/evanx/redexutil
  git remote -v 
  cd ../scripts
  pwd
  git remote set-url origin https://github.com/evanx/chronica-scripts
  git remote -v 
  cd ..
  c0sync
}

c0evanx() {
  c0pwd
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
  c0pwd
  cat .gitmodules | grep evanx
}

c1push() {
  echo "c1push '$1'" `pwd`
  message="$1"
  git add --all
  git commit -m "$message"
  git push
  git status
  echo
}

c1commit() {
  echo; echo "c1commit '$1'" 
  message="$1"
  c0pwd
  c0evanx
  c1push $message
  cd util
  c1push $message
  cd ../scripts
  c1push $message
  cd ..
  c0sync
  c1push $message
}


c0pwd

if [ $# -eq 0 ] 
then
  files=`git diff --name-only`
  c1commit "changed: $files"
elif [ $# -eq 1 ] 
then
  if [ "$1" != 'push' ]
  then
    c1commit "$1"
  else
    echo 'invalid usage'
    exit 1
  fi
elif [ $# -eq 2 ] 
then
  if [ "$1" = 'push' ]
  then
    c1push "$2"
    cat .gitmodules | grep evanx
  else
    echo 'invalid usage'
    exit 1
  fi
else 
  echo 'invalid usage'
  exit 1
fi

c0pwd
cat .gitmodules | grep evanx
