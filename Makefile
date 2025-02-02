# Deverlop By: Pakorn Soikham
# Date: 25-01-2025

# Variables
TEST_FILE=tests/TC-03.robot
OUTPUT_DIR=results/pabot_results

# Default credentials
USERNAME ?= 
PASSWORD ?= 

# Default target
.PHONY: all
all: prepare-output run-parallel open-report

# Run all tests
.PHONY: run-tests
run-tests: prepare-output
	robot --outputdir $(OUTPUT_DIR) --variable username:$(USERNAME) --variable password:$(PASSWORD) $(TEST_FILE)

# Run tests in parallel using pabot with dynamic processes
.PHONY: run-parallel
run-parallel: prepare-output
	@echo "Running tests in parallel with $(PROCESS_COUNT) processes"
	pabot --processes $(PROCESS_COUNT) --testlevelsplit --pabotlib --outputdir $(OUTPUT_DIR) --variable username:$(USERNAME) --variable password:$(PASSWORD) $(TEST_FILE)

# Open report in browser after test execution
.PHONY: open-report
open-report:
	@echo "Opening the test report..."
	@open $(OUTPUT_DIR)/report.html || echo "Failed to open the report"

# Prepare output directory
.PHONY: prepare-output
prepare-output:
	@echo "Preparing output directory..."
	@mkdir -p $(OUTPUT_DIR)

# Clean output directory
.PHONY: clean
clean:
	@echo "Cleaning the output directory..."
	rm -rf $(OUTPUT_DIR)

# Install dependencies from packages.txt
.PHONY: install-dependencies
install-dependencies:
	@echo "Installing dependencies from packages.txt..."
	pip install -r packages.txt

# Help
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make run-tests          Run all tests"
	@echo "  make run-parallel       Run tests in parallel with pabot (use custom process count)"
	@echo "  make clean              Clean the output directory"
	@echo "  make help               Display this help message"
	@echo "  make install-dependencies Install dependencies from packages.txt"
	@echo "  make prepare-output     Prepare the output directory"
	@echo "  make all                Run default tasks: prepare-output, run-parallel, open-report"

# Set default process count for parallel tests
PROCESS_COUNT ?= 4
