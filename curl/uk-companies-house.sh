#!/usr/bin/env bash
# uk-companies-house: runs the Actor and prints its results as JSON. Needs APIFY_TOKEN.
set -euo pipefail
curl -sS -X POST "https://api.apify.com/v2/acts/saliga~uk-companies-house/run-sync-get-dataset-items" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  -d '{"companyNumbers": ["00445790", "SC095000"]}'
