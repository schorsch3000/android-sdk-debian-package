#!/usr/bin/env bash
CMD=`android list sdk --all 2>&1 | grep -v Obsolete | egrep -v rc[0-9]+$ | grep SDK | grep -v Samples | sed 's/-.*//' | tr '\n' ',' | sed 's/[^0-9,]//g' | sed 's/,$/\n/' | sed 's/.*/android update sdk -u -f -a -t \0/' `
expect -c "
set timeout -1   ;
spawn $CMD;
expect {
    \"Do you accept the license\" { exp_send \"y\r\" ; exp_continue }
    eof
}
"
