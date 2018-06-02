[GitHub](https://github.com/nephatrine/docker-gravcms) |
[DockerHub](https://hub.docker.com/r/nephatrine/gravcms/) |
[unRAID](https://github.com/nephatrine/unraid-docker-templates)

# Grav CMS Docker

This docker runs the [Grav](https://getgrav.org/) flat-file CMS. The default installation will include a handful of basic plugins such as the [admin panel](https://github.com/getgrav/grav-plugin-admin/blob/develop/README.md). You can access this at `/admin` in your URL.

There have been reports of issues updating from the Admin plugin page so I suggest updating from the CLI. You can create ``{config}/etc/update-grav`` or ``{config}/etc/update-grav.once`` to have the startup scripts attempt to update any plugins (and grav itself) on startup.

Certbot (LetsEncrypt) is installed to handle obtaining SSL certs in case this is your only web docker. If you plan on hosting multiple applications/dockers, though I suggest having one [nginx-ssl](https://hub.docker.com/r/nephatrine/nginx-ssl/) docker that is publicly visible and handles the SSL certs for all domains. That docker can then proxy all your other nginx dockers which would actually be running on non-public IPs under plain HTTP.

## Settings

See the [base image](https://github.com/nephatrine/docker-nginx-ssl) for additional settings.

## Mount Points

- **/mnt/config:** Configuration Volume