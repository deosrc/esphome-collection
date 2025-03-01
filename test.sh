#!/usr/bin/env bash

ESPHOME_VERSION=latest
WORK_DIR=./devices/localdeck
TEST_FILE=main.yaml

pushd "$PWD/$WORK_DIR"

echo "Running clean command..."
docker run --rm -v "${PWD}":/config -it ghcr.io/esphome/esphome:$ESPHOME_VERSION clean "./tests/$TEST_FILE"
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "Clean command failed."
  exit $RESULT
fi

echo "Running compile command..."
docker run --rm -v "${PWD}":/config -it ghcr.io/esphome/esphome:$ESPHOME_VERSION compile "./tests/$TEST_FILE"
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "Clean command failed."
  exit $RESULT
fi

popd
