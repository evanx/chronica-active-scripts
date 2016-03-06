
set -u 

message="$1"
echo "message: $message"

c0remote_evanx() {
  git remote set-url origin git@github.com:evanx/chronica-scripts.git
}

c0remote_http() {
  git remote set-url origin https://github.com/evanx/chronica-scripts
}

c0commit() {
  git add -A 
  git commit -m "$message"
  git push 
}

if [ ! -f commit.sh ] 
then
  echo 'error'
  exit 1
else
  c0remote_evanx
  c0commit 
fi

