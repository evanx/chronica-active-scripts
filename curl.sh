
   curl -s http://richie.ngena.com/chronica | python -mjson.tool | grep '^        "' -A1 | grep 'alerted' -B1 | grep WARN -B1
