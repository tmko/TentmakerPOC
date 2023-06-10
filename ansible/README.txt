Install Ansible
assume python3 and pip are installed
python3 -m pip install --user ansible

ssh-keyscan -H 192.168.1.162 >> ~/.ssh/known_hosts

Create an SSH key in PEM format
I have not been able to use ssh-keygen -e to reliably generate a private key for SSH in PEM format. This format is sometimes used by commercial products. Instead, I had to convert the key using openssl.

# generate an RSA key of size 2048 bits
ssh-keygen -t rsa -b 2048 -f jabba -C 'ronnie-jabba'

# copy key to 10.1.56.50 and add to authorized_keys

# convert private key to PEM format
openssl rsa -in jabba -outform PEM -out jabba.pem
chmod 700 jabba.pem

# test key
ssh -i ./jabba.pem rmaini@10.1.56.50 -p 2222

# add a passphrase
ssh-keygen -p -f jabba.pem

# does it have a passphrase
ssh-keygen -y -f jabba.pem

# test key, now with passphrase
ssh -i ./jabba.pem rmaini@10.1.56.50 -p 2222



 [centos@ip-172-31-6-171 ambari]$ history
    1  clear ls
    2  pwd
    3  clear
    4  git
    5  clear
    6  git clone https://github.com/apache/ambari.git
    7  ls
    8  cd ambari/
    9  ls
   10  more start-build-env.sh 
   11  ls
   12  more install-ambari-python.sh 
   13  clear
   14  ls
   15  ./install-ambari-python.sh 
   16  ls
   17  more install-ambari-python.sh 
   18  clear
   19  ls
   20  more setup.py 
   21  clear
   22  ls
   23  sudo -s 'cat ambari-vagrant/append-to-etc-hosts.txt >> /etc/hosts'
   24  more /etc/host
   25  more /etc/hosts
   26  ls
   27  cd ambari-serv
   28  cd ambari-server
   29  ls
   30  mvn install
   31  mvn install -DskipTests=true
   32  ls
   33  cd ..
   34  ls
   35  cd ambari-views/
   36  ls
   37  mvn install
   38  cd ..
   39  ls
   40  mvn install -DskipTests=true
   41  mvn -B clean install rpm:rpm -DnewVersion=2.7.5.0.0 -DbuildNumber=5895e4ed6b30a2da8a90fee2403b6cab91d19972 -DskipTests -Dpython.ver="python >= 2.6"
   42  mvn -B clean install rpm:rpm -DnewVersion=2.3.0.0.0.0 -DbuildNumber=5895e4ed6b30a2da8a90fee2403b6cab91d19972 -DskipTests -Dpython.ver="python >= 2.6"
   43  history
   44  ls
   45  ls ambari-server/target/rpm/ambari-server/
   46  ls
   47  ls ambari-server/target/rpm/ambari-server/RPMS/
   48  yum install ambari-server/target/rpm/ambari-server/RPMS/x86_64/ambari-server-3.0.0.0-SNAPSHOT.x86_64.rpm 
   49  sudo yum install ambari-server/target/rpm/ambari-server/RPMS/x86_64/ambari-server-3.0.0.0-SNAPSHOT.x86_64.rpm 
   50  ambari-server setup.py 
   51  ambari-server start
   52  sudo ambari-server start
   53  sudo ambari-server setup
   54  sudo ambari-server start
   55  more /var/log/ambari-server/ambari-server.log 
   56  tail /var/log/ambari-server/ambari-server.log 
   57  tail -f  /var/log/ambari-server/ambari-server.log 
   58  history
[centos@ip-172-31-6-171 ambari]$ ^C
[centos@ip-172-31-6-171 ambari]$ ^C
[centos@ip-172-31-6-171 ambari]$ 
