#!/bin/bash
balooctl status
baloo_file_cleaner > /dev/null
balooctl status
balooctl restart
