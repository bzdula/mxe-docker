# mxe-docker

##Build:

```
docker build -f Dockerfile.qmake --build-arg TARGET=x86_64-w64-mingw32.static .
```
##Usage: 

```
docker run -e 'MAKEARGS=-j32 release' --mount type=bind,source=`pwd`,target=/src --name mxe --rm bzdula/mxe-w64-static-qmake:latest
```
