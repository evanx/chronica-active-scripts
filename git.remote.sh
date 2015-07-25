
pwd | grep -q '/chronica' || exit 1

c0default() {
  cd util
  pwd
  git remote -v 
  cd ../scripts
  pwd
  git remote -v 
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
}

c0http() {
  cd util
  pwd
  git remote set-url origin https://github.com/evanx/redexutil
  git remote -v 
  cd ../scripts
  pwd
  git remote set-url origin https://github.com/evanx/chronica-scripts
  git remote -v 
}

if [ $# -gt 0 ]
then
  command=$1
  shift
  c$#$command $@
else
  c0default
fi


