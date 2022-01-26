# binsync
------

**Note:** Working on multiple shellscript repositories...

Synchronize bin directory across multiple systems

1. Install rsync `apt install -y rsync`
2. Clone repo `git clone https://gogs.easyx.cc/EasyX-Community/binsync.git`
3. Change directory `cd binsync`
4. Chmod files `chmod +x binsync binsync-manual install_binsync.sh`
5. Execute installer `./install_binsync.sh`
6. Copy config `cp config.inc.sample config.inc`
7. Edit config `nano config.inc`
8. Enter in your Host, Port, User, Pass, Wallet pass, Send to address, Minimum to send, and comment.
