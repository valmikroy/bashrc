function _gchktrack {
        git checkout --track origin/${1}
}


function _gmm {
        BRANCH=`git branch | grep -e '^*' | awk '{print $2}'`
        git stash
        git checkout master
        git pull
        git checkout $BRANCH
        git merge master
        git stash apply
}
