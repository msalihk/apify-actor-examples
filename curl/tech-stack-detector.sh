#!/usr/bin/env bash
# tech-stack-detector: runs the Actor and prints its results as JSON. Needs APIFY_TOKEN.
set -euo pipefail
curl -sS -X POST "https://api.apify.com/v2/acts/saliga~tech-stack-detector/run-sync-get-dataset-items" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  -d '{"urls": ["apify.com", "github.com"], "checkDns": true}'
