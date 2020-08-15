With [docker-scripts](https://gitlab.com/docker-scripts/ds) we can
have one or more Wordpress containers, and each container can serve
one or more sites, as shown in the diagram:

<p align="center">
<img src="/dashohoxha/courses/docker-scripts/wordpress/assets/wordpress-ds.png">
</p>

Since all these sites use the ports `80` and `443`, we need a reverse
HTTP proxy in order to forward each request to the corresponding
container that serves that site/domain. The docker-script container
**wsproxy** plays this role, using Apache virtual domains. Not only
that, but **wsproxy** also gets automatically a free LetsEncrypt SSL
certificate for each domain/site that it manages, and also redirects
automatically all HTTP requests to HTTPS.

All the containers of docker-scripts are placed on the same local
network, and **wsproxy** knows how to access the container of each
domain that it manages. So, only the **wsproxy** container needs to
get the ports `80/443` forwarded from the hosts. The Wordpress
containers get their requests from **wsproxy** through the
docker-scripts local network, so they don't need to expose the ports
`80/443` to the host or to the outside world.

Each Wordpress container in turn uses Apache virtual domains to be
able to serve several (more than one) sites/domains.

Each Wordpress site needs also a database, and all of them use the
docker-scripts container **mariadb**, which they access through the
local network of docker-scripts.
