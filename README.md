# Nextflow Automated Testing Demo

## Description

This project demonstrates how to automate Nextflow pipeline testing using GitHub Actions. It includes a dummy Nextflow pipeline and a nf-test test suite, which is automatically run on every pull request.

The test data for nf-test is uploaded via DVC to a Google Bucket location (refer [DVC Config](.dvc/config))

## Project Structure

- `main.nf`: This is the main Nextflow pipeline script.
- `tests/`: This directory contains the Nextflow test suite.
- `.github/workflows/automated-testing.yml`: This file defines the GitHub Actions workflow for automated testing.