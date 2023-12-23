#!/usr/bin/env bash
./make_ascii_files.py
./zip_subjects.sh
./gzip_subjects.sh
./test.sh