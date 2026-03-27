#!/bin/bash
# shellcheck disable=SC2164
# shellcheck disable=SC2016
cd "$(dirname "$0")"

DI_HUB=manhavn
DI_HUB=registry.autoketing.org:5000
if [ "$2" ]; then
  DI_HUB=$2
fi
DI_PACKAGE=otp2fa
DI_PACKAGE_VERSION=v0.0.2

IMAGE_NAME="$DI_HUB/$DI_PACKAGE:$DI_PACKAGE_VERSION"
echo ""
echo 'podman' manifest create $IMAGE_NAME
podman manifest create $IMAGE_NAME
echo ""
echo 'podman' build --arch amd64 --manifest $IMAGE_NAME .
podman build --arch amd64 --manifest $IMAGE_NAME .
echo ""
echo 'podman' build --arch aarch64 --manifest $IMAGE_NAME .
podman build --arch aarch64 --manifest $IMAGE_NAME .
echo ""
echo 'podman' manifest push --tls-verify=false $IMAGE_NAME $IMAGE_NAME
podman manifest push --tls-verify=false $IMAGE_NAME $IMAGE_NAME
echo ""
echo 'podman' manifest rm $IMAGE_NAME
podman manifest rm $IMAGE_NAME
#echo ""
#echo 'podman' image prune -f
#podman image prune -f

echo ' docker run -d --name otp2fa -v ${PWD}/env:/app/env -v ${PWD}/database:/app/database -v ${PWD}/qrcode:/app/qrcode -v ${PWD}/new-qrcode:/app/new-qrcode -it '"$TAG_NAME"
echo ' docker exec otp2fa create --issuer="test.com" --account="hello@account.com" --title="Test Title"'
echo ' docker exec otp2fa load --database="totp.db" --qrcode="test-com-Test-Title-hello-account-com.png"'
echo ' docker exec -it otp2fa update --database="totp.db"'
echo ' docker exec -it otp2fa genqr --database="totp.db" --output="new-qrcode"'
echo ' docker exec -it otp2fa otp --database="totp.db"'
echo ' docker exec -it otp2fa remove --database="totp.db"'

# git fetch --prune; git reset --hard origin/main;

echo ""
echo 'podman' image prune
podman image prune
