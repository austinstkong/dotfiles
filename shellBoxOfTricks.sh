#!/bin/bash
# List of handy Linux shell commands
# Austin Kong
# Last updated 2015 08 31

SW to install
VLC 7zip 
Offices
PuTTY WinSCP Filezilla Sublime Text

config files
zsh bash vim sublime geany git
zsh key maps

#Terminal shortcuts
^A : start of line
^E : end of line
^L : clear screen
^U : clear line
^K : clear line from cursor
^D : delete character under cursor
^W : deletes word before cursor
^R : search backwards command history
^S : search forwards command history
^P : prev command history
^N : next command history
^arrow : fwd back words
sudo !! : run last as sudo

#Packages to install
sudo apt-get install libopenmpi libopenmpi-dev libopenmpi-bin libopenmpi-doc
sudo apt-get install zsh vim tmux ranger w3m git gitk gitg git-gui geany meld octave gfortran libopenmpi1.6 libopenmpi-dev openmpi-bin openmpi-doc 
sudo apt-get install build-essential linux-headers-`uname -r`

sudo apt-get install ranger caca-utils highlight atool w3m poppler-utils mediainfo ffmpegthumbnailer
sudo apt-get install geany-plugin-addons geany-plugin-extrasel geany-plugin-latex geany-plugin-spellcheck geany-plugin-shiftcolumn geany-plugin-markdown geany-plugins-common

sudo apt-get install mpi-default-bin mpi-default-dev openmpi-doc openmpi-checkpoint libopenmpi-dbg 
sudo apt-get install libopenmpi1.6 libopenmpi-dev openmpi-bin openmpi-common openmpi-doc

#syncing files between two locations
rsync -rvu -e 'ssh -p 2052' tpdf5_synM_restart austin@129.94.56.43:~/141120
rsync -rvu tpdf2 z3375478@leonardi.eng.unsw.edu.au:~/scratch

#copy files
scp -P 2052 austin@129.94.56.43

#compare binary files
cmp -l post/synM_0_post/matlab/Z_fv/00205.dat post0/synM_0_post/matlab/Z_fv/00205.dat

#compare text files
# brief, difference only
diff -q
# -y side by side, 2 col
# -r Recursively for subdirectories

#run commands without alias
\ls

#sym link
ln -s /share/share3/austin/tpdf ./tpdf

#Ignores symlink. Shows physical directory
pwd -P
#Current directory with symlink
pwd -L

#Recursively list sub directories -t time -S size -r reverse order
ls -R
#Display / after directories, @ for sym link, * for executables etc
ls -F

#http://www.thegeekstuff.com/2010/04/unix-tar-command-examples/
#archiving. c-create, v-verbose, f-filename
tar cvf archive_name.tar dirname/
#z-gzip .tgz .tar.gz
tar cvzf archive_name.tar.gz dirname/
#j-bzip. bzip2 takes more time to compress and decompress than gzip. bzip2 archival size is less than gzip. .tbz .tb2 .tar.bz2
tar cvfj archive_name.tar.bz2 dirname/
#unzip
tar xvf archive_name.tar
tar xvfz archive_name.tar.gz
#view without extracting
tar tvf archive_name.tar
tar tvfz archive_name.tar.gz
#extract a single file or dir(s)
tar xvf archive_file.tar /path/to/file
tar xvf archive_file.tar /path/to/dir1/ /path/to/dir2/
#add a file to exisitng tarball (uncompressed only)
tar rvf archive_name.tar newfile
#verify contents (uncompressed only)
tar cvfW file_name.tar dir/
#difference between gzip archive file and file system
tar dfz file_name.tgz

#Search for files, kill errors
find / -name '*.f90' 2> /dev/null

#Search and execute a command on those found
find .. -name "*.mod" -exec rm {} \; ; find .. -name "*.o" -exec rm {} \; ;

#show line number
cat -n

#scrollable wall of text
less file
# squeeze blank lines (for cat too)
less -s file
# chomp long lines
less -S file
# many files, move with :n :p for next/prev
less file1 file2 file3

#head or tail of file (last 10 lines)
head 
tail 
#last 25 lines
tail -n25 
#last 25 char
tail -c25
#print last 10 lines then monitor for updates
tail -f
#monitor if file is renamed/recreated/deleted
tail -F

#count number of lines in a file. Default output is words, lines, bytes
wc -l *.f90

#http://www.codecoffee.com/tipsforlinux/articles/25.html
#Extended grep
grep -E "(a*)|(b*)\1"
#Search folder for files with specific text string
grep -rnw directory -e target_string
#to filter and count only lines with pattern, or with -v to invert match..
grep -w 'pattern' -c file
grep -w 'pattern' -c -v file
#List, find and sort
ls | grep 'pattern' | sort -r
# sort third field numerically (default delimiter is space)
sort -k3n
#Print out 5-8th line/31st line, first 10 chars only
sed -n '5,8p' tpdf_SLURM
sed -n '31p' tpdf_SLURM | cut -c-10

#Extract data from CSV/alike file: comma seperated first and third column
cut -d',' -f1,3 file

#Take first field, sort, select only unique entries and count
cat file | cut -d',' -f1 | sort | uniq | wc -l
#Count number of identical entries, sequential only so needs to be sorted first
cat file | cut -d',' -f1 | sort | uniq -c
#Take 10th/first 10/10th to last/10th to 20th characters per line
cat file | cut -c10
cat file | cut -c-10
cat file | cut -c10
cat file | cut -c10-20

#Grand total usage of directory
du -sh
#Adds total to last line of normal listing
du -ch
#Filter out only total listing
du -ch | grep total
du -s
#Free space
df -h
#How much disk quota do I have? –“Blocks” is how many disk blocks you are using, in chunks of 1 kB
quota -s

who #is logged on
whoami #my username
id #group info
env
date
hostname
uname #linux os info
finger #lookup user
chfn #update finger info, also ~/.path, ~/.projects
lspci #list pci devices
which cat #locates a command, shows path

#CPU info
/bin/cat /proc/cpuinfo | egrep 'processor|model name|chache size|core|sibiling|physical'

#f more info H tree view
ps -edHf | grep austin

#Change grub listing
# http://ubuntuforums.org/showthread.php?t=1287602

#Run last command as sudo
sudo !!

#Mount a partition/iso image
sudo mount -t ext4 /dev/sda3 /mnt/scratch
sudo mount -t iso9600 -o loop /path/to.iso /mnt/iso
#Technically a loop device is a block device that writes to a file, rather than a piece of hardware. So you always use/need to use the loop back device when mounting a file.
#Auto mount drives through /etc/fstab or PySDM (Python Storage Disk Manager) or Disks in menu
#http://community.linuxmint.com/tutorial/view/1513
/dev/disk/by-uuid/* /scratch ext4 rw,suid,dev,exec,auto,user,async
#Unmount
sudo umount /mnt/scratch
#List disks/drives
sudo fdisk -l
lsblk

#Default file permissions (symbolically)
umask -S
#u=rwx,g=rx
umask 0027
#u=rwx
umask 0077

#Change ownership of a directory/file
sudo chown -R austin /scratch

#Run as a background process
nohup tar cvzf 1401.tar.gz 1401/ > 1401.out &> 1401.err1 &

#Executes a command repeatedly every 5 sec
watch -n 5 "ps -e | grep php"

#http://www.tecmint.com/ssh-passwordless-login-with-putty/
#http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
#Passwordless ssh http://arbib.it/2008/08/05/shortest-passwordless-ssh-tutorial-ever/
local$ ssh-keygen -t dsa
local$ scp ~/.ssh/id_dsa.pub remote:~/
local$ ssh username@remote
remote$ cat ~/id_dsa.pub >> ~/.ssh/authorized_keys
remote$ chmod 644 ~/.ssh/authorized_keys
remote$ rm ~/id_dsa.pub
remote$ exit
local$ ssh username@remote
