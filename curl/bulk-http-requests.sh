#!/usr/bin/env bash
# bulk-http-requests: runs the Actor and prints its results as JSON. Needs APIFY_TOKEN.
set -euo pipefail
curl -sS -X POST "https://api.apify.com/v2/acts/saliga~bulk-http-requests/run-sync-get-dataset-items" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  -d '{"url": "https://api.zippopotam.us/us/{{zip}}", "csv": "zip\n10001\n94103", "extract": {"city": "places.0.place name", "state": "places.0.state"}}'
