#!/usr/bin/env bash
# dataset-merge-dedupe: runs the Actor and prints its results as JSON. Needs APIFY_TOKEN.
set -euo pipefail
curl -sS -X POST "https://api.apify.com/v2/acts/saliga~dataset-merge-dedupe/run-sync-get-dataset-items" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  -d '{"rows": [{"company": "Acme", "website": "https://www.acme.example/?utm_source=x"}, {"company": "ACME GmbH", "website": "acme.example"}, {"company": "Bluefin", "website": "https://bluefin.example"}], "normalizeUrlFields": ["website"], "extractDomainFrom": "website", "dedupeFields": ["domain"]}'
