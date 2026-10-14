// Run any saliga Actor with an example input: node run.mjs tech-stack-detector
// npm i apify-client ; export APIFY_TOKEN=apify_api_...
import { ApifyClient } from 'apify-client';

const EXAMPLES = {
    "bulk-http-requests": {
        "url": "https://api.zippopotam.us/us/{{zip}}",
        "csv": "zip\n10001\n94103",
        "extract": {
            "city": "places.0.place name",
            "state": "places.0.state"
        }
    },
    "document-to-markdown": {
        "urls": [
            "https://arxiv.org/pdf/1706.03762"
        ],
        "maxPages": 5
    },
    "image-to-text-ocr": {
        "imageUrls": [
            "https://upload.wikimedia.org/wikipedia/commons/a/a7/Wiki_logo.png"
        ]
    },
    "website-screenshot-change-detection": {
        "urls": [
            "https://example.com"
        ],
        "fullPage": true
    },
    "sitemap-extractor": {
        "startUrls": [
            "https://apify.com"
        ],
        "maxUrlsPerSite": 100
    },
    "broken-link-checker": {
        "startUrls": [
            {
                "url": "https://crawler-test.com/"
            }
        ],
        "maxPagesToCrawl": 5,
        "maxLinksToCheck": 150
    },
    "tech-stack-detector": {
        "urls": [
            "apify.com",
            "github.com"
        ],
        "checkDns": true
    },
    "keyword-search-volume": {
        "keywords": [
            "crm software",
            "project management software"
        ],
        "countries": [
            "US"
        ]
    },
    "career-site-jobs": {
        "companies": [
            "greenhouse:airbnb",
            "https://jobs.ashbyhq.com/ramp"
        ]
    },
    "audio-to-text": {
        "urls": [
            "https://archive.org/download/kinder_hausmaerchen_1206_librivox/kinderundhausmaerchen1_18_rumpelstilzchen_grimm_64kb.mp3"
        ],
        "language": "de"
    },
    "video-to-scenes": {
        "videoUrls": [
            "https://media.w3.org/2010/05/sintel/trailer.mp4"
        ]
    },
    "uk-companies-house": {
        "companyNumbers": [
            "00445790",
            "SC095000"
        ]
    },
    "bulk-file-downloader": {
        "urls": [
            "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
            "https://upload.wikimedia.org/wikipedia/commons/a/a9/Example.jpg"
        ]
    },
    "dataset-merge-dedupe": {
        "rows": [
            {
                "company": "Acme",
                "website": "https://www.acme.example/?utm_source=x"
            },
            {
                "company": "ACME GmbH",
                "website": "acme.example"
            },
            {
                "company": "Bluefin",
                "website": "https://bluefin.example"
            }
        ],
        "normalizeUrlFields": [
            "website"
        ],
        "extractDomainFrom": "website",
        "dedupeFields": [
            "domain"
        ]
    },
    "academic-paper-search": {
        "queries": [
            "retrieval augmented generation"
        ],
        "sources": [
            "openalex",
            "arxiv"
        ],
        "maxResultsPerQuery": 20
    }
};

const name = process.argv[2] ?? 'bulk-http-requests';
const client = new ApifyClient({ token: process.env.APIFY_TOKEN });
const run = await client.actor(`saliga/${name}`).call(EXAMPLES[name]);
const { items } = await client.dataset(run.defaultDatasetId).listItems();
for (const item of items) console.log(JSON.stringify(item).slice(0, 500));
