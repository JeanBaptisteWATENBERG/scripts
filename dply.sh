#!/bin/sh
export DEBIAN_FRONTEND=noninteractive;
apt-get update;
apt-get -y upgrade;
apt-get -y install curl;
apt-get install -y wget; wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.tar.gz" -O jdk-8-linux-x64.tar.gz;
tar xzf jdk-8-linux-x64.tar.gz; mkdir -p /opt/java; mv jdk1.8.0_77 /opt/java; ln -s /opt/java/jdk1.8.0_77 /opt/java/latest; ln -s /opt/java/latest /opt/java/default;
rm -f /opt/java/jdk1.8.0_77/src.zip /opt/java/jdk1.8.0_77/javafx-src.zip;
rm -rf /opt/java/jdk1.8.0_77/lib/missioncontrol/ /opt/java/jdk1.8.0_77/lib/visualvm/ /opt/java/jdk1.8.0_77/db/;
update-alternatives --install /usr/bin/java java /opt/java/latest/bin/java 1;
update-alternatives --install /usr/bin/javac javac /opt/java/latest/bin/javac 1;
EXPORT JAVA_HOME=/opt/java/latest;
EXPORT PATH=$PATH:$JAVA_HOME/bin;
rm -f jdk-8-linux-x64.tar.gz; apt-get remove -y wget; apt-get autoremove -y; apt-get clean -y; apt-get autoclean -y;
curl -s https://scripts.programster.org/scripts/17?output=raw | bash;
curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
chmod +x /usr/local/bin/docker-compose;

wget https://raw.githubusercontent.com/JeanBaptisteWATENBERG/scripts/master/startup.sh
chmod +x startup.sh

