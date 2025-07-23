#!/usr/bin/env bash

TEST_FILE=""
ESPHOME_VERSION=latest

while getopts ":t:v:" opt; do
  case $opt in
    t) TEST_FILE=$OPTARG ;;
    v) ESPHOME_VERSION=$OPTARG ;;
  esac
done

if [ -z "$TEST_FILE" ]; then
  echo "Test file not specified." >&2
  exit 1
fi

echo "Test Arguments:"
echo "    Test File: $TEST_FILE"
echo "    ESPHome Version: $ESPHOME_VERSION"

WORK_DIR=$(dirname $(dirname "$TEST_FILE"))
TEST_BASENAME=$(basename "$TEST_FILE")

pushd "$WORK_DIR"

echo "Running clean command..."
docker run --rm -v "${PWD}":/config -t ghcr.io/esphome/esphome:$ESPHOME_VERSION clean "./tests/$TEST_BASENAME"
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "Clean command failed." >&2
  exit $RESULT
fi

echo "Running compile command..."
docker run --rm -v "${PWD}":/config -t ghcr.io/esphome/esphome:$ESPHOME_VERSION compile "./tests/$TEST_BASENAME"
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "Clean command failed." >&2
  exit $RESULT
fi

popd
