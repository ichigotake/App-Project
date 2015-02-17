#!/bin/bash

./project
./project bump_version 0.5
./project changes --dry-run
./project release --dry-run
touch untracks && ./project untracks && rm untracks
