FROM debian:jessie
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y wget openjdk-7-jre-headless expect build-essential devscripts debhelper
RUN mkdir /usr/lib/android-sdk
RUN cd /usr/lib/android-sdk && wget -qO -  http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz | tar -xvvz --strip 1
ENV PATH $PATH:/usr/lib/android-sdk/tools/
ADD update.sh /usr/local/bin/update-android-sdk
ADD build-deb.sh /usr/local/bin/build-deb
ADD control /build/control
RUN chmod +x /usr/local/bin/*
CMD /usr/local/bin/update-android-sdk
