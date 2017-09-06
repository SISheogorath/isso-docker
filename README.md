Isso
===

[![Build Status](https://travis-ci.org/SISheogorath/isso-docker.svg?branch=master)](https://travis-ci.org/SISheogorath/isso-docker)
[![MadIRC #Admins](https://img.shields.io/badge/MadIRC-%23Admins-green.svg)](https://webclient.madirc.net/?join=%23Admins)

Docker setup for the commenting platform isso.

Isso – *Ich schrei sonst* – is a lightweight commenting server written in
Python and JavaScript. It aims to be a drop-in replacement for
[Disqus](http://disqus.com).

# How to use this image

First, a simple run command:

```console
$ docker run --name isso -p 8080:80 sheogorath/isso-docker
```

This will run an instance of isso with default settings but also won't persist anything.

To perist data and make isso accessable use:

```console
$ docker run --name isso -p 8080:80 -v `pwd`/data:/data sheogorath/isso-docker
```

*Please notice that isso doesn't provide any webinterface. So be aware of the fact that http://127.0.0.1:8080 will result in an empty/error page*

## Configuration

The configuration is done by environment variables. The container won't crash if you define none, but for real usage it's recommened to provide at least `ISSO_HOST`

|Name|Default value|Description|
|----|-------------|-----------|
|`ISSO_HOST`|`http://example.com`|It corresponds with [General] -> host [Details](https://posativ.org/isso/docs/configuration/server/#general)|
|`ISSO_NAME`|`comments.example.com`|It corresponds with [General] -> name [Details](https://posativ.org/isso/docs/configuration/server/#general)|
|`ISSO_MAX_AGE`|`30m`|It corresponds with [General] -> max-age [Details](https://posativ.org/isso/docs/configuration/server/#general)|
|`ISSO_REPLY_TO_SELF`|`false`|It corresponds with [Guard] -> reply-to-self [Details](https://posativ.org/isso/docs/configuration/server/#guard)|
|`ISSO_REQUIRE_EMAIL`|`false`|It corresponds with [Guard] -> require-email [Details](https://posativ.org/isso/docs/configuration/server/#guard)|
|`ISSO_REQUIRE_AUTHOR`|`false`|It corresponds with [Guard] -> require-author [Details](https://posativ.org/isso/docs/configuration/server/#guard)|

*For client side settings check the official docs: https://posativ.org/isso/docs/configuration/client/*

# Build this image

As there are currently no additional parameters, simply use the following statement:

```console
$ git clone https://github.com/SISheogorath/isso-docker.git
$ docker build -t isso:local isso-docker
```

# License

View [license information](https://github.com/posativ/isso/) for the software contained in this image.

# Supported Docker versions

This image is officially supported on Docker version 1.12.3.

Please see [the Docker installation documentation](https://docs.docker.com/installation/) for details on how to upgrade your Docker daemon.

# User Feedback

## Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/SISheogorath/isso-docker/issues).

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.
