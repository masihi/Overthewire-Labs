#!/bin/bash

#set -e #if any command outputs to stderr immediatly stop executing.

if [[ -e passwords ]] ; then
  rm passwords; echo "Removing passwords file.";
  rm LEVEL_PASS*; echo "Removing LEVEL_PASS* files.";
else
  echo 'The file "passwords" does not exist.'
fi

passwords="";
LEVEL_PASS_N="";
LEVEL_PASS="";

function sshbandit {
    num="$1"
    shift 1
    if [ "$num" == 0 ] ; then
	pass=bandit0
    else
     	pass="$(sed -n "${num}p" passwords)"
    fi

    sshpass -p "$pass" ssh bandit${num}@bandit.labs.overthewire.org -p 2220 "$@"
}

sshbandit 0 cat readme >> passwords;

cat passwords | sed -n '1p' >> LEVEL_PASS_N;

tr -d '\n' < LEVEL_PASS_N > LEVEL_PASS;

sshbandit 1 cat ./- >> passwords;

cat passwords | sed -n '2p' > LEVEL_PASS_N;

tr -d '\n' < LEVEL_PASS_N > LEVEL_PASS;

sshbandit 2 cat "spaces\ in\ this\ filename" >> passwords;

cat passwords | sed -n '3p' > LEVEL_PASS_N;

tr -d '\n' < LEVEL_PASS_N > LEVEL_PASS;

sshbandit 3 cat "inhere/.hidden" >> passwords;

cat passwords | sed -n '4p' > LEVEL_PASS_N;

tr -d '\n' < LEVEL_PASS_N > LEVEL_PASS;

sshbandit 4 cat inhere/-file07 >> passwords;

cat passwords | sed -n '5p' > LEVEL_PASS_N;

tr -d '\n' < LEVEL_PASS_N > LEVEL_PASS;

tr -d [:alpha:] < LEVEL_PASS_N > LEVEL_PASS_N;

sshbandit 5 cat ./inhere/maybehere07/.file2 >> LEVEL_PASS_N;

#Should work but cant execute $(command), takes too long
#sshpass -f LEVEL_PASS ssh bandit5@bandit.labs.overthewire.org -p 2220 cat $(find -size 1033c) >> LEVEL_PASS;
tr -d [:blank:] < LEVEL_PASS_N >  LEVEL_PASS;
cat LEVEL_PASS >> passwords;

sshbandit 6 cat /var/lib/dpkg/info/bandit7.password > LEVEL_PASS_N;

#find /* -size 33c -type f -user bandit7 -group bandit6 -print
cat LEVEL_PASS_N > LEVEL_PASS;
cat LEVEL_PASS >> passwords;

sshbandit 7 grep millionth data.txt > LEVEL_PASS_N ;

sed 's/millionth//' < LEVEL_PASS_N  > LEVEL_PASS;

tr -d '[:blank:]' < LEVEL_PASS > LEVEL_PASS_N;
cat LEVEL_PASS_N > LEVEL_PASS;

cat LEVEL_PASS >> passwords;

sshbandit 8 sort data.txt | uniq -c | grep "1 "| sed 's/1 //' | tr -d '[:blank:]' > LEVEL_PASS;

#cat LEVEL_PASS_N | uniq -c | grep "1 "| sed 's/1 //' | tr -d '[:blank:]' > LEVEL_PASS;

cat LEVEL_PASS >> passwords;

sshbandit 9 strings data.txt > LEVEL_PASS_N;

cat LEVEL_PASS_N | grep ===== | sed -n 4p | tr -d "=*[:blank:]" > LEVEL_PASS;

cat LEVEL_PASS >> passwords;

sshbandit 10 base64 -d data.txt > LEVEL_PASS_N;

sed 's/The password is //' LEVEL_PASS_N > LEVEL_PASS;

cat LEVEL_PASS >> passwords;

sshbandit 11 cat data.txt | tr 'n-za-mN-ZA-M' 'a-zA-Z' | sed 's/The password is //' > LEVEL_PASS ;

cat LEVEL_PASS >> passwords;

#sshbandit 12 mkdir -p /tmp/masihi; rm -rf /tmp/masihi/*; xxd -r data.txt /tmp/masihi/sol; cd /tmp/masihi; pwd; mv sol sol.gz ; gzip -d sol.gz ; mv sol sol.bz2; bzip2 -d sol.bz2; mv sol sol.gz; gzip -d sol.gz; mv sol sol.tar; tar -xvf sol.tar; mv data5.bin sol.tar; tar -xvf sol.tar; mv data6.bin sol.bz2; bzip2 -d sol.bz2; mv sol sol.tar; tar -xvf sol.tar; mv data8.bin sol.gz; gzip -d sol.gz; sed 's/The password is //' sol > LEVEL_PASS; cat LEVEL_PASS >> paswords;

sshbandit 12 cat data.txt > LEVEL_PASS_N; cp LEVEL_PASS_N data.txt; xxd -r data.txt sol; mv sol sol.gz ; gzip -d sol.gz ; mv sol sol.bz2; bzip2 -d sol.bz2; mv sol sol.gz; gzip -d sol.gz; mv sol sol.tar; tar -xvf sol.tar; mv data5.bin sol.tar; tar -xvf sol.tar; mv data6.bin sol.bz2; bzip2 -d sol.bz2; mv sol sol.tar; tar -xvf sol.tar; mv data8.bin sol.gz; gzip -d sol.gz; sed 's/The password is //' sol > LEVEL_PASS; cat LEVEL_PASS >> passwords; rm sol.tar data.txt sol;

#sshbandit 13 'ssh bandit14@bandit.labs.overthewire.org -i sshkey.private' #'cat /etc/bandit_pass/bandit14 > LEVEL_PASS; exit;' cat LEVEL_PASS >> password;

printf '4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e' > LEVEL_PASS; cat LEVEL_PASS >> passwords

echo '' >> passwords

sshbandit 14 'echo 4wcYUJFw0k0XLShlDzztnTBHiqxU3b3e | nc localhost 30000' > LEVEL_PASS_N
sed -n '2p' < LEVEL_PASS_N > LEVEL_PASS
cat LEVEL_PASS >> passwords

#sshbandit 15 'echo BfMYroe26WYalil77FoDi9qh59eK5xNr | openssl s_client -connect localhost:30001' > LEVEL_PASS_N
echo cluFn7wTiGryunymYOu4RcffSxQluehd >> passwords

#sshbandit 16 nmap localhost -p31000-32000; openssl s_client -connect localhost:31790
#copy RSA KEY to file RSA17.private
# chmod 400 RSA17.private
#ssh -i RSA17.private bandit17@bandit.labs.overthewire.org -p 2220
#cat /etc/bandit_pass/bandit17 >> passwords

echo xLYVMN9WE5zQ5vHacb0sZEVqbrp7nBTn >> passwords

sshbandit 17 diff passwords.old passwords.new > LEVEL_PASS_N;
sed -n '4p' < LEVEL_PASS_N > LEVEL_PASS;

sed 's/> //' < LEVEL_PASS > LEVEL_PASS_N;

cat LEVEL_PASS_N >> passwords


sshbandit 18 'cat readme' >> passwords

sshbandit 19 './bandit20-do cat /etc/bandit_pass/bandit20' >> passwords

#sshbandit 20

#tmux
# echo "GbKksEFF4yrVs6il55v6gwY5aVje5f0j" | nc -l -p 60000
# press ctrl+b release then press %
# in new  terminal ./suconnect 60000

echo "gE269g2h3mw3pwgrj0Ha9Uoqen1c9DGr" >> passwords

sshbandit 21 'cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv' >> passwords

sshbandit 22 'cat /tmp/8ca319486bfbbc3663ea0fbe81326349' >> passwords

#cat /usr/bin/cronjob_bandit23.sh
#myname=$(whoami)
#mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)
#cat /tmp/$mytarget

#sshbandit 23
#mkdir /tmp/bandit24
#cd /tmp/bandit24
#touch 24.sh

#nano
##!/bin/bash
#cat /etc/bandit_pass/bandit24 >> /tmp/bandit24/bandit24
#exit nano

#chmod +x 24.sh
#mv 24.sh /var/spool/bandit24
# ./usr/bin/cronjob24.sh or wait one minute
#check /tmp/bandit24/bandit24

#note level not currently working


echo "UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ" >> passwords

#sshbandit 24

#mkdir /tmp/bandit25
##!/bin/bash
#touch out.txt

#for i in {0000..10000}
#do
#echo "UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ $i" >> out.txt
#done

#cat out.txt | nc localhost 30002
#rm out.txt

echo "uNG9O58gUE7snukf3bvZ0rxhtnjzSGzG" >> passwords


#sshbandit 25

#shrink window to 5 lines
# press v to enter vim
#:e /etc/bandit_pass_bandit26

echo "5czgV9L3Xx8JPOyRbXh6lQbmIOWvPT6Z" >> passwords

#sshbandit 26

#shrink window to 5 lines
# press v to enter vim
# :set shell=/bin/bash
# :shell
# ./bandit27.do cat /bandit_pass/bandit27

echo "3ba3118a22e93127a4ed485be72ef5ea" >> passwords

#sshbandit 27
#mkdir /tmp/level27
#git clone ssh://bandit27-git@localhost/home/bandit27-git/repo
# use bandit 27 pass -> 3ba3118a22e93127a4ed485be72ef5ea
echo "0ef186ac70e04ea33b4c1853d2526fa2" >> passwords

#sshbandit 28
#mkdir /tmp/masihi28
#cd /tmp/masihi28
#git clone sshssh://bandit28-git@localhost/home/bandit28-git/repo
#0ef186ac70e04ea33b4c1853d2526fa2
# cd repo
#git log
# git checkout 186a1038cc54d1358d42d468cdc8e3cc28a93fcb
# cat READ.ME

echo "bbc96594b4e001778eee9975372716b2" >> passwords

#sshbandit 29

# mkdir /tmp/masihi29 ; cd /tmp/masihi29
#git clone sshssh://bandit29-git@localhost/home/bandit29-git/repo
# there is no commit history
# do git branch -r to see a development branch
# git checkout dev
# cat readme
echo "5b90576bedb2cc04c86a9e924ce42faf" >> passwords

#sshbandit 30
# mkdir /tmp/masihi30 ; cd /tmp/masihi30
# git clone sshssh://bandit30-git@localhost/home/bandit30-git/repo
# git tag
# git show secret

echo "47e603bb428404d265f59c42920d81e5" >> passwords

#sshbandit 31

# mkdir /tmp/masihi31 ; cd /tmp/masihi31
# git clone sshssh://bandit31-git@localhost/home/bandit31-git/repo
# cd repo
# nano .gitignore -> clean line or delete file
# nano key.txt
# May I come in?
# CTRL - x ;  y ; enter
# git status
# git add *
# git commit -m "add key.txt"
# git push origin master
# 47e603bb428404d265f59c42920d81e5

echo "56a9bf19c63d650ce78e6ec0354ee45e" >> passwords

#sshbandit 32
# This is an interactive restricted shell
# turns everything into uppercase
# let's check the environment Variable zero
# $0
# and voila we have bash again
# cat /etc/bandit_pass/bandit33

echo "c9c3199ddf4121b10cf581a98d51caee" >> passwords

#sshbandit 33
