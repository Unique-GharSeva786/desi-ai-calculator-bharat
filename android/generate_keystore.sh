#!/bin/bash
# Desi AI Calculator - Release Keystore Generator Script
# Run this script to generate a production release keystore for Play Store signing

set -e

KEYSTORE_NAME="release.keystore"
KEY_ALIAS="desi_calculator_key"
VALIDITY_DAYS=10000

echo "=========================================================="
echo "Desi AI Calculator - Generating Release Keystore"
echo "=========================================================="
echo ""
echo "Please enter a secure password for your keystore:"
read -s STORE_PASS
echo "Please re-enter the password to confirm:"
read -s CONFIRM_PASS

if [ "$STORE_PASS" != "$CONFIRM_PASS" ]; then
    echo "Error: Passwords do not match!"
    exit 1
fi

keytool -genkey -v \
    -keystore "$KEYSTORE_NAME" \
    -alias "$KEY_ALIAS" \
    -keyalg RSA \
    -keysize 2048 \
    -validity "$VALIDITY_DAYS" \
    -storepass "$STORE_PASS" \
    -keypass "$STORE_PASS" \
    -dname "CN=Desi AI Calculator, OU=Mobile, O=Desi Apps, L=Delhi, ST=Delhi, C=IN"

echo ""
echo "Creating keystore.properties file..."
cat <<EOF > keystore.properties
storeFile=$KEYSTORE_NAME
storePassword=$STORE_PASS
keyAlias=$KEY_ALIAS
keyPassword=$STORE_PASS
EOF

echo "Success! $KEYSTORE_NAME and keystore.properties created successfully."
echo "You can now build signed Release APK and AAB from Android Studio or using ./gradlew bundleRelease"
