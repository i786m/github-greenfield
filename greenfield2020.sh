#!/bin/bash
Y=$1
mkdir $Y
cd $Y
for ((M=$2; M<=$3; M++))
do
  mkdir $M
  cd $M
  for (( D=1; D<=31; D++))
  do
    mkdir $D
    cd $D
    n=$((RANDOM%7+10))
    for ((i=1; i<$n; i++))
    do
      echo "$i on $M/$D/$Y" > commit.md
      export GIT_COMMITTER_DATE="$Y-$M-$D 12:$i:00"
      export GIT_AUTHOR_DATE="$Y-$M-$D 12:$i:00"
      git add commit.md -f
      git commit --date="$Y-$M-$D 12:0$i:00" -m "$i on $M $D $Y"
    done      
    cd ../
  done
  git push origin main
  cd ../
done
cd ../



git rm -rf 20**
git commit -am "cleanup"
git push origin main