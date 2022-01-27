# binsync

#### Description
Synchronize bin directory across multiple systems<br />

#### Notes
- It is important the instructions are completed in order!
- You can only have one host machine under one root/user account
- You can have as many client machines as you like, under any root/user account
<br />
#### Gather client SSH keys
1. Login as non-root user
2. `su` and enter root password if setting up root
3. Generate the key `ssh-keygen` (leave all options including password empty and press enter)
4. Print the key `cat ${HOME}/.ssh/id_rsa.pub`
5. Copy the line printed out into a notepad (yes it is one giant line)<br />
<br />
#### Install keys on host machine
1. Login as non-root user
2. `su` and enter root password if setting up root
3. `nano ${HOME}/.ssh/authorized_keys`
4. Copy the lines from notepad and paste into the file
5. Save & Exit<br />
<br />
#### On the host machine
1. Login as non-root user
2. `su` and enter root password if setting up root as the host
3. Make bin directory `mkdir -p ${HOME}/bin`
4. `echo "export PATH=${HOME}/bin:\$PATH" | tee -a ${HOME}/.bashrc`<br />
<br />
#### On the client(s) machines
1. Login as non-root user
2. `su` and enter root password if setting up root as the client
3. Make bin directory `mkdir -p ${HOME}/bin`
4. `echo "export PATH=${HOME}/bin:\$PATH" | tee -a ${HOME}/.bashrc`
5. Change to directory you wish to install repository
6. Clone repo `git clone https://gogs.easyx.cc/EasyX-Community/binsync.git`
7. Change directory `cd binsync`
8. Chmod files `chmod +x binsync binsync-manual install_binsync.sh`
9. Execute installer `./install_binsync.sh`
10. Copy config `cp config.inc.sample config.inc`
11. Edit config `nano config.inc`
12. Enter in your User, Host, and Directory
13. Run manually `binsync-manual`
14. Add cronjob `crontab -e`
15. Add in: `*/5 * * * *             ${HOME}/bin/rsync-bin-push ; ${HOME}/bin/rsync-bin-pull ;`
16. Save & Exit<br />
<br />
<br />
#### Donations:
**XMR:** 84wwa7EKo8uasZAHijHKtBTuBaMPuNjCJgnfGJrsLFo4aZcfrzGvUX33sSeFNdno8fPiTDGnz4h1bCvsdFQYWRuR2619FzS <br />
**ETH(ERC-20):** 0xc89eEa9b5C0cfa7f583dc1A6405a7d5730ADB603 <br />
**BNB(BSC)** 0xc89eEa9b5C0cfa7f583dc1A6405a7d5730ADB603 <br />
**RTM:** RDg5KstHYvxip77EiGhPKYNL3TZQr6456T <br />
**AVN:** R9zSPpKjo6tCutMT5FyyGNr2vRaAssEtrm <br />
**PHL:** F7XaUosKYEXPP62o31DdpDoADo3VcxoFP4 <br />
**PEXA:** XBghzGLdeUzspUcJpeggPFLs3mAyTRHpPH <br />
