#!/bin/bash

set -e

LOGFILE="/var/log/aide/aide.log"
EMAIL="{{AIDE_EMAIL}}"

aide --check

if grep -qE "Modified|Added|Removed" "$LOGFILE"; then
    {
        echo "Subject: AIDE Integrity Report: $(date +'%Y-%m-%d')"
        echo "To: $EMAIL"
        echo
        cat "$LOGFILE"
    } | msmtp "$EMAIL"
fi
