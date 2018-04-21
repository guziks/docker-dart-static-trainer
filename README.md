## About

Docker base image to train dart script [snapshots](https://github.com/dart-lang/sdk/wiki/Snapshots) and turn them into "app-jit" snapshots.

List of "static" images (all are "onbuild"):

* [dart-static-builder](https://hub.docker.com/r/guziks/dart-static-builder)
* [dart-static-trainer](https://hub.docker.com/r/guziks/dart-static-trainer) (this one)
* [dart-static-runtime](https://hub.docker.com/r/guziks/dart-static-runtime)

## Tags

Available tags correspond to those of [google/dart](https://hub.docker.com/r/google/dart/tags).

## Prerequisites

See [dart-static-builder](https://hub.docker.com/r/guziks/dart-static-builder) instructions first.

For this image to work, app must have `train` command, so it can be run like this:

```
$ dart main.dart train
```

This command should launch a server, issue several training requests to itself and finish with `0` exit code.

## Usage

This image can be used as an intermediate stage to train script snapshot from "builder" step to get "app-jit" snapshot.

Create `Dockerfile` like this:

```
FROM guziks/dart-static-builder as builder
FROM guziks/dart-static-trainer as snapshot
FROM guziks/dart-static-runtime
EXPOSE <port1> <port2> ...
CMD ["arg1", "arg2", ...]
```
