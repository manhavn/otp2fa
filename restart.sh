#!/bin/bash
# shellcheck disable=SC2164
cd "$(dirname "$0")"

docker stop otp2fa
docker rm otp2fa
docker rmi manhavn/otp2fa:v0.0.1
docker run -d --name otp2fa \
  -v "${PWD}"/otp2fa/env:/app/env \
  -v "${PWD}"/otp2fa/database:/app/database \
  -v "${PWD}"/otp2fa/qrcode:/app/qrcode \
  -v "${PWD}"/otp2fa/new-qrcode:/app/new-qrcode \
  -it manhavn/otp2fa:v0.0.1
