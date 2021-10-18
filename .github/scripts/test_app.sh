#!/bin/bash

set -eo pipefail

xcodebuild -workspace Moviedb.xcworkspace \
            -scheme Moviedb \
            -destination platform=iOS\ Simulator,OS=14.4,name=iPhone\ 11 \
            clean test | xcpretty
