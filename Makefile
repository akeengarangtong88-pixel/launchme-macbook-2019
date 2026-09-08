.PHONY: build run clean test install

# Build the project
build:
	xcodebuild -scheme LaunchMe -configuration Release

# Run the app
run:
	xcodebuild -scheme LaunchMe -configuration Debug -derivedDataPath build
	open build/Release/LaunchMe.app

# Debug run
debug:
	xcodebuild -scheme LaunchMe -configuration Debug
	open build/Debug/LaunchMe.app

# Clean build artifacts
clean:
	xcodebuild clean
	rm -rf build/
	rm -rf .build/

# Install to Applications folder
install: build
	cp -r build/Release/LaunchMe.app /Applications/

# Run tests
test:
	xcodebuild test -scheme LaunchMe

# Format code
format:
	swift format -i -r LaunchMe/

# Lint
lint:
	swiftlint lint LaunchMe/

# Create distribution package
dist: build
	mkdir -p dist
	cp -r build/Release/LaunchMe.app dist/
	ditto -c -k --sequesterRsrc dist/LaunchMe.app LaunchMe.zip
	mv LaunchMe.zip dist/

.PHONY: help
help:
	@echo "LaunchMe - MacBook Pro 2019 Touch Bar Edition"
	@echo ""
	@echo "Available targets:"
	@echo "  make build    - Build the app"
	@echo "  make run      - Build and run the app"
	@echo "  make debug    - Build debug version"
	@echo "  make clean    - Clean build artifacts"
	@echo "  make install  - Install to /Applications"
	@echo "  make test     - Run tests"
	@echo "  make format   - Format code"
	@echo "  make lint     - Lint code"
	@echo "  make dist     - Create distribution zip"
	@echo "  make help     - Show this help message"