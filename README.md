docker-localenv
===============


PURPOSE
-------

My docker image (based on Ubuntu) for setting up a local development environment for various development projects, such as nodejs apps, things requiring a jdk (oracle) etc. 

It also installs docker (ie. docker in docker) for testing some of my CI projects that build and version docker images. 



BUILD
-----

This should do the job (note the non-existent docker repo it attempts to link to in the `docker-compose.yml` file... this should be updated to your preference):

```
docker-compose build
```

There's also a script there for builing using `docker build` which is a bit weird/hacky/custom, but does the job too:

```
./build-local.sh
```



USAGE
-----

I usually run an interactive instance of this image on my mac (or linux desktop or whatever) with a command like the following:

```
EXTPORT=1234 \
INTPORT=9000 \
docker run -it \
  -v /home/adam/git:/root/git \
  -p $PORT:9000 \
  localenv \
  bash
```

... and customise the volumes and port mappings based on whatever dev purposes I need at the time.


