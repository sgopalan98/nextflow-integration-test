#!/bin/bash

# Fetch URLs for test data using DVC
TEST_DATA1=$(dvc get --show-url . data/testfile)

# Export the URL as an environment variable
export TEST_DATA1

# Run nf-test to test the Nextflow pipeline
# Make sure to adjust the command according to your nf-test setup
nf-test test main.nf.test
