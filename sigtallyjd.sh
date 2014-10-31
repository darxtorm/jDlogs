#!/bin/bash
# made by joel devlin - bulletproof networks - assisted by GH, SK2, JW
# finds occurences of a violation per entire logs, for all the logs
# looks in /var/log/cisco/local6.log*
#SIGID=200000003 # real start
#SIGID=200021069 # demo number
#HIGHSIG=200200002
# $1 is from, $2 is to
rm /var/log/cisco/jDtally.log.bak #removes old bak logs
mv /var/log/cisco/jDtally.log /var/log/cisco/jDtally.log.bak #makes a bak coz
if [ -n $1 ]
then
        SIGID=200000003
else
        SIGID=$1
fi
if [[ -z $2 ]]
then
        HIGHSIG=200200002
else
        HIGHSIG=$2
fi
while [ $SIGID -lt $HIGHSIG ]; do
        COUNTRESULT=`grep -c "<sig_id>${SIGID}" /var/log/cisco/local6.log`
        if [ $COUNTRESULT -ne 0 ]
        then
                echo ${SIGID} $'\t' ${COUNTRESULT} | tee -a jDtally.log 
        fi
        let SIGID=SIGID+1
done
sort -r -n -k 2 /var/log/cisco/jDtally.log > /var/log/cisco/jDtally.sort.log # pumps out a sorted log but only if above has completed rather than cancelled
