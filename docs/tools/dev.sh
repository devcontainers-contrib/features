#!/bin/bash
set -e

php -S 0.0.0.0:8000 -c . -t pages router.php
