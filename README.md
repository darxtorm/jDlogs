jDlogs
======

log plumbing tools for supportID/signatureID detective work

sigtallyjd.sh
Which attacks are most popular currently? This does a tally on the non-zero-occurence signatures for the current log, normally will not reach back further than a week. Can show which attacks are currently popular. Will spit out a sorted and an unsorted list. You can use $1 and $2 to set a start and end violation signature.
example usage: # ./sigtallyjd.sh 200007000 200008000 # will scan current log for 1000 signatures
example output:
200007002        3
200007003        1
200007005        2
200007006        1
200007008        12886
200007011        93701
200007013        6339

trendfinderjd.sh
When did this block begin to occur, or has it always been around? this delivers a count of how many times a violation has occurred in the last month (as log files are available). you must use $1 to tell it which signature to search for
example usage: # ./trendfinderjd.sh 200007011 # will scan ALL logs for history of specific violation
example output:
Oct 31   1
Oct 30   54881
Oct 29   38811
Oct 27   0
Oct 26   1
Oct 25   0
Oct 24   0
Oct 23   0
Oct 22   0
Oct 21   0
