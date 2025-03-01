#!/usr/bin/env bash

ESPHOME_VERSION=latest
WORK_DIR=""
TEST_FILE=main.yaml

while getopts ":d:t:v" opt; do
  case $opt in
    d) WORK_DIR=$OPTARG ;;
    t) TEST_FILE=$OPTARG ;;
    v) ESPHOME_VERSION=$OPTARG ;;
  esac
done

if [ -z "$WORK_DIR" ]; then
  echo "Work directory not specified." >&2
  exit 1
fi

echo "Test Arguments:"
echo "    Work Dir: $WORK_DIR"
echo "    Test File: $TEST_FILE"
echo "    ESPHome Version: $ESPHOME_VERSION"

pushd "$PWD/$WORK_DIR"

echo "Running clean command..."
docker run --rm -v "${PWD}":/config -it ghcr.io/esphome/esphome:$ESPHOME_VERSION clean "./tests/$TEST_FILE"
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "Clean command failed." >&2
  exit $RESULT
fi

echo "Running compile command..."
docker run --rm -v "${PWD}":/config -it ghcr.io/esphome/esphome:$ESPHOME_VERSION compile "./tests/$TEST_FILE"
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "Clean command failed." >&2
  exit $RESULT
fi

popd
