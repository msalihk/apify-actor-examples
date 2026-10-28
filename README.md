# saliga Apify Actors: copy-paste examples

Small, runnable examples for the [saliga Actors on Apify](https://apify.com/saliga). Every example calls the Actor's synchronous endpoint and prints the results, so you can try one in a terminal in a minute.

You need an Apify account (the free plan works) and an API token from Console → Settings → API & Integrations:

```bash
export APIFY_TOKEN=apify_api_...
```

The pattern is always the same:

```bash
curl -s -X POST "https://api.apify.com/v2/acts/saliga~<actor>/run-sync-get-dataset-items" \
  -H "Authorization: Bearer $APIFY_TOKEN" -H "Content-Type: application/json" \
  -d '<input JSON>'
```

| Actor | Example input | What you get | Price |
|---|---|---|---|
| [bulk-http-requests](https://apify.com/saliga/bulk-http-requests) | `{"url":"https://api.zippopotam.us/us/{{zip}}","csv":"zip\n10001\n94103","extract":{"city":"places.0.place name"}}` | One row per API call, with extracted columns | $1 / 1,000 requests |
| [document-to-markdown](https://apify.com/saliga/document-to-markdown) | `{"urls":["https://arxiv.org/pdf/1706.03762"],"maxPages":5}` | Markdown with tables, RAG chunks | $2 / 1,000 pages |
| [image-to-text-ocr](https://apify.com/saliga/image-to-text-ocr) | `{"imageUrls":["https://upload.wikimedia.org/wikipedia/commons/a/a7/Wiki_logo.png"]}` | Text with confidence | $1.50 / 1,000 images |
| [website-screenshot-change-detection](https://apify.com/saliga/website-screenshot-change-detection) | `{"urls":["https://example.com"],"fullPage":true}` | Screenshot URLs, change percent | $1–4 / 1,000 |
| [sitemap-extractor](https://apify.com/saliga/sitemap-extractor) | `{"startUrls":["https://apify.com"],"maxUrlsPerSite":100}` | Every URL with lastmod | $0.25 / 1,000 URLs |
| [broken-link-checker](https://apify.com/saliga/broken-link-checker) | `{"startUrls":[{"url":"https://example.com/"}],"maxPagesToCrawl":20}` | Broken links and where they are | $0.50 / 1,000 links |
| [tech-stack-detector](https://apify.com/saliga/tech-stack-detector) | `{"urls":["apify.com","github.com"]}` | CMS, analytics, email provider | $1.50 / 1,000 sites |
| [keyword-search-volume](https://apify.com/saliga/keyword-search-volume) | `{"keywords":["crm software"],"countries":["US"]}` | Google volume, CPC, trend | $3 / 1,000 + $0.19 / lookup |
| [career-site-jobs](https://apify.com/saliga/career-site-jobs) | `{"companies":["greenhouse:airbnb","https://jobs.ashbyhq.com/ramp"]}` | Open jobs | $1 / 1,000 jobs |
| [audio-to-text](https://apify.com/saliga/audio-to-text) | `{"urls":["https://example.com/episode.mp3"]}` | Transcript, SRT, chunks | $8 / 1,000 minutes |
| [video-to-scenes](https://apify.com/saliga/video-to-scenes) | `{"videoUrls":["https://media.w3.org/2010/05/sintel/trailer.mp4"]}` | Scene cuts, keyframes | $2 / 1,000 frames |
| [uk-companies-house](https://apify.com/saliga/uk-companies-house) | `{"companyNumbers":["00445790"]}` | UK company profile | $2 / 1,000 companies |
| [bulk-file-downloader](https://apify.com/saliga/bulk-file-downloader) | `{"urls":["https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf"]}` | Stored file, public link, sha256, ZIP | $1 / 1,000 files |
| [dataset-merge-dedupe](https://apify.com/saliga/dataset-merge-dedupe) | `{"datasetIds":["<id1>","<id2>"],"dedupeFields":["url"],"exportFormats":["csv"]}` | One merged, de-duplicated table + CSV/Excel | $0.50 / 1,000 rows |
| [academic-paper-search](https://apify.com/saliga/academic-paper-search) | `{"queries":["retrieval augmented generation"],"sources":["openalex","arxiv"]}` | Papers with DOI, citations, PDF link | $3 / 1,000 papers |
| [linkedin-jobs-scraper](https://apify.com/saliga/linkedin-jobs-scraper) | `{"keywords":["data engineer"],"locations":["United Kingdom"],"postedWithin":"week"}` | LinkedIn jobs with full description, salary, agency flag; or hiring companies | $1 / 1,000 jobs |
| [linkedin-company-scraper](https://apify.com/saliga/linkedin-company-scraper) | `{"companies":["https://www.linkedin.com/company/stripe/"],"websites":["linear.app"]}` | Company details, recent posts, similar companies | $3 / 1,000 companies |
| [linkedin-company-search](https://apify.com/saliga/linkedin-company-search) | `{"keywords":["fintech"],"locations":["London"],"companySizes":["51-200"]}` | Companies matching industry, size and HQ filters | $4 / 1,000 companies |

Folders:
- `mcp/`: use these Actors as tools from Claude, Cursor or any MCP client, with one URL.
- `curl/`: one shell script per Actor.
- `python/`: the same with `apify-client` (`pip install apify-client`).
- `node/`: the same with `apify-client` for JavaScript.
- `n8n/`: importable n8n workflows (HTTP Request node, no community node needed).
  - `n8n-template-bulk-http-requests.json`: enrich every row of a Google Sheet with one API call per row, written back in place
  - `n8n-template-document-to-markdown-rag.json`: chat with your PDF and Office files, with page citations (form → Markdown chunks → vector store → AI agent)
  - `n8n-template-keyword-search-volume.json`: monthly search volume history in Google Sheets plus a rising/falling summary by e-mail
  - `n8n-template-website-change-monitor.json`: weekly visual change report by e-mail with the diff images attached
  - `n8n-template-weekly-broken-link-report.json`: weekly broken link report by e-mail (Gmail)
  - `n8n-template-linkedin-competitor-posts.json`: weekly e-mail digest of competitors' new LinkedIn posts (Gmail)
  - `n8n-template-linkedin-company-leads.json`: form → LinkedIn company search → lead list in Google Sheets
  - `n8n-template-linkedin-hiring-companies.json`: daily list of companies hiring for a role on LinkedIn in Google Sheets

  Import: n8n → Workflows → ⋯ → Import from File. Then add a *Header Auth* credential (`Authorization` = `Bearer YOUR_APIFY_TOKEN`) in the Apify HTTP Request node, and connect Google Sheets, Gmail or OpenAI where the workflow uses them.

Prices are the Store prices when this was written; the Actor page is the source of truth.

Questions or a missing feature: open an issue here or on the Actor page.
