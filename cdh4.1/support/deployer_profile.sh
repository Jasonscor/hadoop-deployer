#!/usr/bin/env bash
# coding=utf-8
# Author: zhaigy@ucweb.com
# Data:   2012-09

BAPF="$HOME/.bash_profile"
DPPF="$HOME/.deployer_profile"

[ ! -e $BAPF ] && touch $BAPF;

DPFLAG="# hadoop deployer profile - uc.cn"

profile()
{
  if ! grep -q "$DPFLAG" $BAPF; then 
    echo "$DPFLAG" >> $BAPF;
    echo "if [ -f $DPPF ]; then" >> $BAPF;
    echo "  . $DPPF;" >> $BAPF;
    echo "fi" >> $BAPF;
    echo "#END#" >> $BAPF;
  fi
  
  echo "#!/usr/bin/env bash
export DP_HOME=$DP_HOME
export SSH_PORT=$SSH_PORT
export PORT_PREFIX=$PORT_PREFIX

export DEP_HOME=$DP_HOME

export PATH=\$DP_HOME/bin:\$PATH

if [ -d $HOME/local ]; then
  for D in \`ls -d $HOME/local/*\`; do
    if [ -d \$D/bin ]; then
      PATH=\$D/bin:\$PATH
    elif [ -d \$D/sbin ]; then
      PATH=\$D/sbin:\$PATH
    fi
  done
fi

PATH=\$( awk -F: '{
sep = \"\"
for (i = 1; i <= NF; ++i)
  if (unique[\$i] != 1)
    {
      out = out sep \$i
      sep = \":\"
      unique[\$i] = 1
    }
    print out
  }' <<< \$PATH)

export PATH

alias ssh='ssh -p \$SSH_PORT'
alias scp='scp -P \$SSH_PORT'
alias ccdp='cd \$DP_HOME'
" > $DPPF
}

unprofile()
{
  rm -f $DPPF
  cp $BAPF "$BAPF.$NOW8_6"
  sed -i "/$DPFLAG/,/#END#/d" $BAPF
}
