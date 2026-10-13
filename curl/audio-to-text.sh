#!/usr/bin/env bash
# audio-to-text: runs the Actor and prints its results as JSON. Needs APIFY_TOKEN.
set -euo pipefail
curl -sS -X POST "https://api.apify.com/v2/acts/saliga~audio-to-text/run-sync-get-dataset-items" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  -d '{"urls": ["https://archive.org/download/kinder_hausmaerchen_1206_librivox/kinderundhausmaerchen1_18_rumpelstilzchen_grimm_64kb.mp3"], "language": "de"}'
