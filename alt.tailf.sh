
   ls --sort=time ~/.pm2/logs/chronica-out-* | head -1 | xargs tail -f |
     node_modules/bunyan/bin/bunyan -o short
