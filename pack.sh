#!/bin/bash
set -ex
dir=groove2groove-data-v1.0.0
rm -f "$dir".tar.gz
find -L "$dir" -type f -not -name '.*' -print | sort | tar czvf "$dir".tar.gz --dereference -T -
