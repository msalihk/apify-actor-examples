#!/usr/bin/env bash
# academic-paper-search: runs the Actor and prints its results as JSON. Needs APIFY_TOKEN.
set -euo pipefail
curl -sS -X POST "https://api.apify.com/v2/acts/saliga~academic-paper-search/run-sync-get-dataset-items" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  -d '{"queries": ["retrieval augmented generation"], "sources": ["openalex", "arxiv"], "maxResultsPerQuery": 20}'
