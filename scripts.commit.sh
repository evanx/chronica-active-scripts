
set -u 

message="$1"
echo "message: $message"

if [ ! -f commit.sh ] 
then
  echo 'error'
  exit 1
else
  git add -A 
  git commit -m "$message"
  git push 
fi

