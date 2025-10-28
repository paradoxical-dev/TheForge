#!/bin/bash

set -e

echo "[AIDE] Updating baseline database at $(date)"
aide --update
mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db

