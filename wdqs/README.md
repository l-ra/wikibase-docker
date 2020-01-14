## wdqs docker image

Wikibase specific blazegraph image.

Automated build.

### Tags

Image name                              | Parent image             | WDQS Version
--------------------------------------- | ------------------------ | --------------
`wikibase/wdqs` : `0.3.10`, `latest`    | [openjdk:8-jdk-alpine](https://hub.docker.com/_/openjdk/) | 0.3.10
`wikibase/wdqs` : `0.3.6`               | [openjdk:8-jdk-alpine](https://hub.docker.com/_/openjdk/) | 0.3.6

### Upgrading

When upgrading between wdqs versions the data stored in `/wdqs/data` may not be compatible with the newer version.
When testing the new image if no data appears to be loaded into the query service you will need to reload the data.

If all changes are still in RecentChanges then simply removing `/wdqs/data` and restarting the service should reload all data.

If you can not use RecentChanges then you will need to reload from an RDF dump:
 - make an RDF dump from your Wikibase instance: https://github.com/wikimedia/mediawiki-extensions-Wikibase/blob/master/repo/maintenance/dumpRdf.php
 - Load an RDF dump into the query service: https://github.com/wikimedia/wikidata-query-rdf/blob/master/docs/getting-started.md#load-the-dump

### Environment variables

Variable                 | Default            | Since   | Description
-------------------------|  ------------------| --------| ----------
`MEMORY`                 | ""                 | 0.2.5   | Memory limit for blazegraph
`HEAP_SIZE`              | "1g"               | 0.2.5   | Heap size for blazegraph
`WIKIBASE_HOST`          | "wikibase.svc"     | 0.2.5   | Hostname of the Wikibase host
`WIKIBASE_SCHEME`        | "http"             | 0.2.5   | Scheme of the Wikibase host
`WIKIBASE_CONCEPT_HOST`          | "wikibase.svc"     | 0.2.5   | Hostname of the Wikibase concept host
`WIKIBASE_CONCEPT_SCHEME`        | "http"             | 0.2.5   | Scheme of the Wikibase concept host
`WDQS_HOST`              | "wdqs.svc"         | 0.2.5   | Hostname of the WDQS host (this service)
`WDQS_PORT`              | "9999"             | 0.2.5   | Port of the WDQS host (this service)
`WDQS_ENTITY_NAMESPACES` | "120,122"          | 0.2.5   | Wikibase Namespaces to load data from
`WIKIBASE_MAX_DAYS_BACK` | "90"               | 0.3.0   | Max days updater is allowed back from now


### Filesystem layout

File                              | Description
--------------------------------- | ------------------------------------------------------------------------------
`/wdqs/whitelist.txt`             | Whitelist file for other SPARQL endpoints
`/wdqs/RWStore.properties`        | Properties for the service
`/templates/mwservices.json`      | Template for MediaWiki services (substituted to `/wdqs/mwservices.json` at runtime)

### Troubleshooting

* The query service is not running or seems to get killed by the OS?
  * The image requires more than 2GB of available RAM to start. While being developed the dev machine had 4GB of RAM.
