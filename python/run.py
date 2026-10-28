"""Run any saliga Actor with an example input: python run.py tech-stack-detector

pip install apify-client ; export APIFY_TOKEN=apify_api_...
"""
import json
import os
import sys

from apify_client import ApifyClient

EXAMPLES = {
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
        "fullPage": True
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
        "checkDns": True
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
    },
    "linkedin-jobs-scraper": {
        "keywords": [
            "data engineer"
        ],
        "locations": [
            "United Kingdom"
        ],
        "postedWithin": "week",
        "maxJobsPerSearch": 50,
        "excludeStaffingAgencies": True
    },
    "linkedin-company-scraper": {
        "companies": [
            "https://www.linkedin.com/company/stripe/",
            "microsoft"
        ],
        "websites": [
            "linear.app"
        ]
    },
    "linkedin-company-search": {
        "keywords": [
            "fintech"
        ],
        "locations": [
            "London"
        ],
        "industries": [
            "Financial",
            "Software"
        ],
        "companySizes": [
            "11-50",
            "51-200",
            "201-500"
        ],
        "maxCompanies": 20
    }
}


def main() -> None:
    name = sys.argv[1] if len(sys.argv) > 1 else 'bulk-http-requests'
    client = ApifyClient(os.environ['APIFY_TOKEN'])
    run = client.actor(f'saliga/{name}').call(run_input=EXAMPLES[name])
    for item in client.dataset(run['defaultDatasetId']).iterate_items():
        print(json.dumps(item, ensure_ascii=False)[:500])


if __name__ == '__main__':
    main()
