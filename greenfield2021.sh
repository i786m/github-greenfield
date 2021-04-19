#!/bin/bash

mkdir 2021
cd 2021
for M in {01..03}
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
      echo "$i on $M/$D/2021" > commit.md
      export GIT_COMMITTER_DATE="2021-$M-$D 12:$i:00"
      export GIT_AUTHOR_DATE="2021-$M-$D 12:$i:00"
      git add commit.md -f
      git commit --date="2021-$M-$D 12:0$i:00" -m "$i on $M $D 2021"
    done      
    cd ../
  done
  cd ../
done
cd ../

git push origin main
git rm -rf 20**
git commit -am "cleanup"
git push origin main