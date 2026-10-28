#!/usr/bin/env bash
# linkedin-company-search: runs the Actor and prints its results as JSON. Needs APIFY_TOKEN.
set -euo pipefail
curl -sS -X POST "https://api.apify.com/v2/acts/saliga~linkedin-company-search/run-sync-get-dataset-items" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  -d '{"keywords": ["fintech"], "locations": ["London"], "industries": ["Financial", "Software"], "companySizes": ["11-50", "51-200", "201-500"], "maxCompanies": 20}'
