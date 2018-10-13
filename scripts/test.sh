#!/bin/bash
set -e

xcodebuild build test \
    -IDEBuildOperationMaxNumberOfConcurrentCompileTasks=2 \
    -workspace ${PROJECT}.xcworkspace \
    -scheme ${PROJECT} \
    -sdk iphonesimulator \
    -destination 'platform=iOS Simulator,id='"${SIMULATOR_UDID}" \
    | xcpretty -c && exit ${PIPESTATUS[0]}