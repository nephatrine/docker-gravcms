[Git Repo](https://code.nephatrine.net/nephatrine/docker-gravcms) |
[DockerHub](https://hub.docker.com/r/nephatrine/gravcms/) |
[unRAID Template](https://github.com/nephatrine/unraid-docker-templates)

# Grav Container

This docker container manages the Grav application, a lightweight flat-file CMS.

- [Grav](https://getgrav.org/)

During the initial installation (which occurs on first run) the following plugins are installed as well:

- [admin](https://github.com/getgrav/grav-plugin-admin/blob/develop/README.md) !!!
- [cookieconsent](https://github.com/naucon/grav-plugin-cookieconsent/blob/master/README.md)
- [external_links](https://github.com/Sommerregen/grav-plugin-external-links/blob/develop/README.md)
- [pagination](https://github.com/getgrav/grav-plugin-pagination/blob/develop/README.md)
- [simplesearch](https://github.com/getgrav/grav-plugin-simplesearch/blob/develop/README.md)
- [sitemap](https://github.com/getgrav/grav-plugin-sitemap/blob/develop/README.md)

## Configuration

- ``{config}/etc/crontab``: Crontab Entries
- ``{config}/etc/logrotate.conf``: Logrotate General Configuration
- ``{config}/etc/logrotate.d/*``: Logrotate Per-Application Configuration
- ``{config}/etc/mime.types``: NGINX MIME Types
- ``{config}/etc/nginx.conf``: NGINX General Configuration
- ``{config}/etc/nginx.d/*``: NGINX Per-Site Configuration
- ``{config}/etc/php.d/*``: PHP Extension Configuration
- ``{config}/etc/php.ini``: PHP General Configuration
- ``{config}/etc/php-fpm.conf``: PHP-FPM General Configuration
- ``{config}/etc/php-fpm.d/*``: PHP-FPM Per-Site Configuration
- ``{config}/ssl/live/{site}/``: SSL/TLS certificates
- ``{config}/www/grav/user/config/*``: Grav Configuration
- ``{config}/www/grav/user/pages/*``: Grav Pages
- ``{config}/www/grav/user/plugins/*``: Grav Plugins
- ``{config}/www/grav/user/themes/*``: Grav Themes

**Remember to log into admin page (``{url}/admin``) and configure password! If you cannot access URL, check access rules in ``{config}/etc/nginx.d/default.conf``.**

You can perform updates of grav itself and your plugins from the admin panel. Depending on the caching you have enabled and how the storage for the container is set up, you may encounter difficulties when updating from the web interface. If you create a file ``{config}/etc/update-grav`` or ``{config}/etc/update-grav.once`` and then restart the container, the startup scripts will attempt to update grav and all plugins before the service spins up to avoid caching issues.

Certbot is included for requestung SSL certificates but you are better off just enabling HTTP from these containers and then using a single [docker-nginx-ssl](https://code.nephatrine.net/nephatrine/docker-nginx-ssl) container as a reverse proxy and handling all the HTTPS/SSL configuration there.

## Ports

- **80/tcp:** HTTP Port
- **443/tcp:** HTTPS Port

## Variables

- **PUID:** Owner UID (*1000*)
- **PGID:** Owner GID (*100*)
- **TZ:** Time Zone (*"America/New_York"*)

- **DNSADDR:** Resolver IPs ("8.8.8.8 8.8.4.4") (IGNORED AFTER INITIAL RUN) (SPACE-DELIMITED)

- **ADMINIP**: Administrator IP ("127.0.0.1") (IGNORED AFTER INITIAL RUN)
- **TRUSTSN:** Trusted Subnet ("192.168.0.0/16") (IGNORED AFTER INITIAL RUN)

- **SSLEMAIL:** LetsEncrypt Email ("")
- **SSLDOMAINS:** LetsEncrypt Domains ("") (COMMA-DELIMITED)

## Mount Points

- **/mnt/config:** Configuration/Logs