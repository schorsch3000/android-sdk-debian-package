#!/usr/bin/env bash
cd /usr/lib/android-sdk/build-tools
VERSION=$(ls | sort | tail -n1)
mkdir -p /build/android-sdk-$VERSION/usr/lib/android-sdk
cd /build/android-sdk-$VERSION/usr/lib/android-sdk
cp -pr /usr/lib/android-sdk/* .
chown root:root . -R
cd /build/android-sdk-$VERSION
mkdir DEBIAN
cp /build/control DEBIAN/control
echo "Version: $VERSION" >>DEBIAN/control
cd /build/android-sdk-$VERSION
mkdir -p etc/profile.d
echo 'export ANDROID_HOME="/usr/lib/android-sdk"' > etc/profile.d/android.sh
echo 'export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools' >> etc/profile.d/android.sh
cd /build
dpkg-deb --build android-sdk-$VERSION
