#!/bin/bash

cat /etc/passwd | grep -E -v "nologin|false|sync" | sort | awk -F ":" '{print $1,$6,$NF}'
