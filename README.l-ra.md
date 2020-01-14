This is a clone of https://github.com/wmde/wikibase-docker

Modifications:
* travis build allows custom docker repo via travis env
* `wdqs` image is slightly modified to allow different wikibase service URL and concept URI 
* `docker-compose.yml` is modified to run with public DNS names behind nginx with automatis crtificae enrollment using letsencrypt (https://hub.docker.com/r/jrcs/letsencrypt-nginx-proxy-companion)