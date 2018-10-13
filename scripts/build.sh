# !/bin/bash
set -e

# just test PRs
if test "${TRAVIS_PULL_REQUEST}" == "false"
then
    xcodebuild \
        -workspace ${PROJECT}.xcworkspace \
        -scheme ${PROJECT} \
        -configuration ${XCODE_CONFIGURATION} \
        clean build \
        | xcpretty -c && exit ${PIPESTATUS[0]}
else
    echo "Just build when not in a PR"
fi
