
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
  cd ..
  sed -i 's/git@github\.com:evanx\/chronica-scripts\.git/https:\/\/github.com\/evanx\/chronica-scripts/' .gitmodules .git/config
  sed -i 's/git@github\.com:evanx\/redexutil\.git/https:\/\/github.com\/evanx\/redexutil/' .gitmodules .git/config
  cat .gitmodules .git/config | grep evanx
}

if [ $# -gt 0 ]
then
  command=$1
  shift
  c$#$command $@
else
  c0default
fi


