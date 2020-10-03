### PROCESS
# mnemonic: [K]ill [P]rocess
#

local pid=$(ps -ef | sed 1d | eval "sk -m --header='[kill:process]'" | awk '{print $2}')

if [ "x$pid" != "x" ]
then
  echo $pid | xargs kill -${1:-9}
  kp
fi
