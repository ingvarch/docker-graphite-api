# BUILD

```
docker build -t docker-graphite-api
```

# RUN

```
docker run -it -d -p 8000:8000 -v /tmp/graphite:/opt/graphite/storage/whisper --link carbon:carbon --name graphite docker-graphite-api
```
