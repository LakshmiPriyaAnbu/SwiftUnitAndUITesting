#!/bin/bash
echo "Hello, World"
#
## Define project and scheme
#PROJECT_PATH="/Users/lakshmipriya/Desktop/TestingPractice/TestingPractice.xcodeproj"
#SCHEME="TestingPractice"
#BUILD_DIR="/Users/lakshmipriya/Desktop/TestingPractice/build"
#BUILD_LOG="$BUILD_DIR/build.log"
#TEST_LOG="$BUILD_DIR/test.log"
#EMAIL="alakshmipriya@greatergoods.com"
#
## Create the build directory if it doesn't exist
#mkdir -p "$BUILD_DIR"
#
## Clean Derived Data
#echo "Cleaning Derived Data..."
#rm -rf ~/Library/Developer/Xcode/DerivedData
#
## Build the project
#echo "Building project..."
##xcodebuild -project "$PROJECT_PATH" -scheme "$SCHEME" -configuration Debug -destination 'platform=iOS Simulator,name=iPhone 14' clean build | tee "$BUILD_LOG"
##
### Check if build succeeded
##if grep -q "BUILD SUCCEEDED" "$BUILD_LOG"; then
##    echo "Build succeeded."
##else
##    echo "Build failed. Check the build log for details."
##    echo "Error: Build failed!" | mail -s "Build Failure" "$EMAIL"
##    exit 1
##fi
##
### Run tests
##echo "Running tests..."
##xcodebuild -project "$PROJECT_PATH" -scheme "$SCHEME" -destination 'platform=iOS Simulator,name=iPhone 14' test | tee "$TEST_LOG"
##
### Check if tests succeeded
##if grep -q "Test Succeeded" "$TEST_LOG"; then
##    echo "All tests passed."
##    echo "Success: All tests passed!" | mail -s "Build and Test Success" "$EMAIL"
##else
##    echo "Some tests failed. Check the test log for details."
##    echo "Error: Some tests failed!" | mail -s "Build and Test Failure" "$EMAIL"
##    exit 1
##fi
