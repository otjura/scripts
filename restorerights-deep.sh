#!/bin/sh
find . -type f -name "*" -exec chmod 644 "{}" \;
find . -type d -name "*" -exec chmod 755 "{}" \;
