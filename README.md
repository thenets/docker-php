# Docker image for PHP + Apache HTTP Server

Compatible with all Linux x64 distros.

## What Is Included?
- Latest PHP 7.x
- Composer
- Apache

## 1. Requirements
Your server / virtual machine must meet the following requirements:

- Linux x64 kernel version 3.10 or higher
  - Distributions supported with simple installer: Ubuntu, Fedora, CentOS, openSUSE.
  - Other distros will require manual installation.
- 100 MB of RAM

## 2. How To Install
Run the following commands on your server / virtual machine:

```
# For stateful
docker run -it --rm -v ./:/home/easyphp/html thenets/php
```

If you want to add your application to image, just add it to `/home/easyphp/html` path.

## TODO

- Google PageSpeed with gzip, minify e image optimization