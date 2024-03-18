# Python Tutorials

## Introduction
This repository contains Python tutorials for beginners. The tutorials are designed to be interactive and easy to follow. The tutorials are written in a way that you can run the code and see the results in real-time.

## Table of Contents
1. [Getting Started](#getting-started)
2. [Update requirements.txt](#update-requirements.txt)

## Getting Started
To run the tutorial code, you need to install the required packages. You can do this by running the following command in the terminal:
```bash
> pip install -r requirements.txt
```

## Update requirements.txt
If you install new packages, you need to update the `requirements.txt` file. You can do this by running the following command in the terminal:
```bash
> pipreqs . --force
```

## Linting
After writing the code, you can check for any errors by running the following command in the terminal:
```bash
> flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
```