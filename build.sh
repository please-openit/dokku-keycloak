#!/usr/bin/env bash

source .env

VERSION="26.0.6"
echo "Downloading Keycloak $VERSION..."
wget -q https://github.com/keycloak/keycloak/releases/download/$VERSION/keycloak-$VERSION.zip
echo "Unzipping Keycloak $VERSION..."
unzip -q keycloak-$VERSION.zip
mv keycloak-$VERSION keycloak
rm keycloak-$VERSION.zip
echo "Keycloak $VERSION downloaded and unzipped successfuly"
#cp cache-ispn.xml keycloak/conf/cache-ispn.xml
cp -R target/* keycloak/providers/
keycloak/bin/kc.sh build --db=postgres --metrics-enabled=true
