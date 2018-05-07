function _today {

        TS=`date +%Y_%m_%d__%A`
        WORKDIR=$HOME/Documents/work
        if [ ! -d $WORKDIR   ]
        then
                mkdir -p $WORKDIR
        fi
        cd $WORKDIR

        WORKFILE=$WORKDIR/work_$TS.txt

        tmux new -s today  "vim -O $WORKFILE -o "

        git add $WORKDIR/work_$TS.txt
        git commit $WORKDIR/work_$TS.txt -m "Auto commit for $TS on `date +%Y_%m_%d__%A`"
        git push -u origin master
}
