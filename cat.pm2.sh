
  if ls --sort=time ~/.pm2/logs/chronica-err*
  then
    err=`ls --sort=time ~/.pm2/logs/chronica-err* | head -1`
    echo; echo "$err"
    tail $err | node_modules/bunyan/bin/bunyan
    ls -l $err
  fi

  if ls --sort=time ~/.pm2/logs/chronica-out*
  then
    out=`ls --sort=time ~/.pm2/logs/chronica-out* | head -1`
    echo; echo "$out"
    tail $out | node_modules/bunyan/bin/bunyan
    ls -l $out
  fi
