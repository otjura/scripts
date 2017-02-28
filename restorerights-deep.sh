#!/bin/sh
find . -type f -name "*" -exec chmod 664 "{}" \;
find . -type d -name "*" -exec chmod 755 "{}" \;

