#!/bin/bash
# made by joel devlin - bulletproof networks - assisted by GH, SK2, JW
# finds occurences of a string per day, for the last thirty one days, date format 'Feb 31'
# looks in /var/log/cisco/local6.log*

SUBTRACTDAYS=0

while [ $SUBTRACTDAYS -lt 30 ]; do                                                      # last 31 days including today
        CUSTDATE=$(date +%b\ %d -d "${SUBTRACTDAYS} days ago")                          # sets date a la format
        COUNTRESULT=`zgrep ">${1}<" /var/log/cisco/local6.log* | grep -c "${CUSTDATE}\ "`     # sets up next line
#        COUNTRESULT=`zgrep -c \""${CUSTDATE}" .*"${1}".*\" /var/log/cisco/local6.log*` # attempt at distilation by regex, not yet working
        echo ${CUSTDATE} $'\t' ${COUNTRESULT}                                           # prints date followed by number of occurences
        let SUBTRACTDAYS=SUBTRACTDAYS+1
done
