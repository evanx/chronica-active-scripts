

if ! ls -l  ~/.chronica.yaml
then
  echo 'Create config file e.g.  ~/.chronica.yaml'
  echo 'See https://github.com/evanx/chronica'
  exit 1
fi

if ! pwd | grep -q '/chronica'
then
  echo 'Please cd into and run from chronica directory e.g. cd ~/chronica'
  exit 1
fi

  rm -f ~/.pm2/logs/chronica-*

  [ -f  ~/.chronica.yaml ] || exit 1

  cat index.js | grep -q evanxsummers || exit 1

  node_modules/pm2/bin/pm2 stop chronica

  node_modules/pm2/bin/pm2 start index.js --name chronica -- ~/.chronica.yaml

  node_modules/pm2/bin/pm2 show chronica

  sleep 2

  ls -l ~/.pm2/logs/chronica-*

  ls --sort=time ~/.pm2/logs/chronica-err-*.log |
     head -1 | xargs cat |
     node_modules/bunyan/bin/bunyan -o short

  ls --sort=time ~/.pm2/logs/chronica-out-*.log |
     head -1 | xargs tail -f |
     node_modules/bunyan/bin/bunyan -o short
