# Use these Actors from an AI agent (MCP)

Apify hosts an MCP server that exposes any Store Actor as a tool. This URL gives an agent (Claude, Cursor, VS Code, n8n AI Agent…) the saliga toolkit only:

```
https://mcp.apify.com/?tools=saliga/bulk-http-requests,saliga/document-to-markdown,saliga/image-to-text-ocr,saliga/audio-to-text,saliga/video-to-scenes,saliga/website-screenshot-change-detection,saliga/sitemap-extractor,saliga/broken-link-checker,saliga/tech-stack-detector,saliga/keyword-search-volume,saliga/career-site-jobs
```

You need a free Apify account. The first connection opens a browser to sign in (OAuth), or send your Apify API token as `Authorization: Bearer <token>`. Each tool call is a normal Actor run, priced per result as on the Actor page.

## What the agent can do with it

| Ask the agent | Tool it uses |
|---|---|
| "Call this API for every row of my CSV and give me the results" | bulk-http-requests |
| "Turn these PDFs into Markdown I can put in a vector database" | document-to-markdown |
| "Read the text in these scanned invoices / screenshots" | image-to-text-ocr |
| "Transcribe this podcast episode with timestamps" | audio-to-text |
| "Split this video into scenes and tell me what is said in each" | video-to-scenes |
| "Take full-page screenshots of these sites and tell me if they changed since last week" | website-screenshot-change-detection |
| "List every URL in example.com's sitemap that changed this week" | sitemap-extractor |
| "Find broken links on my site" | broken-link-checker |
| "Which CMS and email provider do these 200 companies use?" | tech-stack-detector |
| "Search volume and CPC for these keywords in the US and Germany" | keyword-search-volume |
| "Which of these companies are hiring engineers right now?" | career-site-jobs |

## Claude Desktop / Claude Code

```json
{
  "mcpServers": {
    "saliga-tools": {
      "type": "http",
      "url": "https://mcp.apify.com/?tools=saliga/bulk-http-requests,saliga/document-to-markdown,saliga/image-to-text-ocr,saliga/audio-to-text,saliga/video-to-scenes,saliga/website-screenshot-change-detection,saliga/sitemap-extractor,saliga/broken-link-checker,saliga/tech-stack-detector,saliga/keyword-search-volume,saliga/career-site-jobs"
    }
  }
}
```

## Cursor (`~/.cursor/mcp.json`)

```json
{
  "mcpServers": {
    "saliga-tools": {
      "url": "https://mcp.apify.com/?tools=saliga/bulk-http-requests,saliga/document-to-markdown,saliga/image-to-text-ocr,saliga/audio-to-text,saliga/video-to-scenes,saliga/website-screenshot-change-detection,saliga/sitemap-extractor,saliga/broken-link-checker,saliga/tech-stack-detector,saliga/keyword-search-volume,saliga/career-site-jobs",
      "headers": { "Authorization": "Bearer ${APIFY_TOKEN}" }
    }
  }
}
```

Pick fewer tools by shortening the `tools=` list. Docs: https://docs.apify.com/platform/integrations/mcp
