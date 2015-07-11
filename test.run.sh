
  node index.js ~/.chronica.yaml debug | 
    node_modules/bunyan/bin/bunyan -o short |
    grep -v '^\s*at .*babel' 
