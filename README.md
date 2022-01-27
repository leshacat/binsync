# binsync

#### Notes
**Note:** It is important the instructions are completed in order!<br />
**Note:** You can only have one host machine under one root/user account<br />
**Note:** You can have as many client machines as you like, under any root/user account<br />

#### Description
Synchronize bin directory across multiple systems

#### Gather client SSH keys
1. Login as non-root user
2. `su` and enter root password if setting up root
3. Generate the key `ssh-keygen`
4. Print the key `cat ${HOME}/.ssh/id_rsa.pub`
5. Copy the line printed out into a notepad (yes it is one giant line)

#### Install keys on host machine
1. Login as non-root user
2. `su` and enter root password if setting up root
3. `nano ${HOME}/.ssh/authorized_keys`
4. Copy the lines from notepad and paste into the file
5. Save & Exit

#### On the host machine
1. Login as non-root user
2. `su` and enter root password if setting up root as the host
3. Make bin directory `mkdir -p ${HOME}/bin`
4. `echo "export PATH=${HOME}/bin:\$PATH" | tee -a ${HOME}/.bashrc`

#### On the client(s) machines
1. Login as non-root user
2. `su` and enter root password if setting up root as the client
2. Make bin directory `mkdir -p ${HOME}/bin`
3. `echo "export PATH=${HOME}/bin:\$PATH" | tee -a ${HOME}/.bashrc`
4. Change to directory you wish to install repository
5. Clone repo `git clone https://gogs.easyx.cc/EasyX-Community/binsync.git`
6. Change directory `cd binsync`
7. Chmod files `chmod +x binsync binsync-manual install_binsync.sh`
8. Execute installer `./install_binsync.sh`
9. Copy config `cp config.inc.sample config.inc`
10. Edit config `nano config.inc`
11. Enter in your User, Host, and Directory
12. Run manually `binsync-manual`
13. Add cronjob `crontab -e`
14. Add in: `*/5 * * * *             ${HOME}/bin/rsync-bin-push ; ${HOME}/bin/rsync-bin-pull ;`
15. Save & Exit

#### On the client(s) machines as a regular user:
1. Make bin directory `mkdir -p /root/bin`
2. `echo "export PATH=${HOME}/bin:\$PATH" | tee -a ${HOME}/.bashrc`
3. Change to directory you wish to install repository
4. Clone repo `git clone https://gogs.easyx.cc/EasyX-Community/binsync.git`
5. Change directory `cd binsync`
6. Chmod files `chmod +x binsync binsync-manual install_binsync.sh`
7. Execute installer `./install_binsync.sh`
8. Copy config `cp config.inc.sample config.inc`
9. Edit config `nano config.inc`
10. Enter in your User, Host, and Directory
11. Run manually `binsync-manual`
12. Add cronjob `crontab -e`
13. Add in: `*/5 * * * *             ${HOME}/bin/rsync-bin-push ; ${HOME}/bin/rsync-bin-pull ;`
14. Save & Exit
