#!/bin/bash
# TXT-EXTRACTOR deploy script

echo "Cloning Repo..."
git clone https://github.com/Popeye68/TXT-EXTRACTOR.git /TXT-EXTRACTOR
cd /TXT-EXTRACTOR

echo "Installing Python dependencies..."
pip install -r requirements.txt

echo "Starting Bot..."
python -m Extractor
