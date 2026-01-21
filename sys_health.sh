#!/bin/bash

echo "System Health Check - $(date)"

echo "Disk Usage:"
df -h

echo "Memory Usage:"
free -m

echo "Top Processes:"
ps aux --sort=-%mem | head -5
