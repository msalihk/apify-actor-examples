#!/usr/bin/env bash
# video-to-scenes: runs the Actor and prints its results as JSON. Needs APIFY_TOKEN.
set -euo pipefail
curl -sS -X POST "https://api.apify.com/v2/acts/saliga~video-to-scenes/run-sync-get-dataset-items" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  -d '{"videoUrls": ["https://media.w3.org/2010/05/sintel/trailer.mp4"]}'
