#!/usr/bin/env bash
# career-site-jobs: runs the Actor and prints its results as JSON. Needs APIFY_TOKEN.
set -euo pipefail
curl -sS -X POST "https://api.apify.com/v2/acts/saliga~career-site-jobs/run-sync-get-dataset-items" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  -d '{"companies": ["greenhouse:airbnb", "https://jobs.ashbyhq.com/ramp"]}'
