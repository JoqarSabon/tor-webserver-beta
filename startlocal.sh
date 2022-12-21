#!/bin/bash
# Start local Server

sudo su <<EOF
  cd "main"
  php -S localhost:9090 & sudo tor
EOF


