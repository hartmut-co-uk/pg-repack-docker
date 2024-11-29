# pg-repack-docker

Docker image with 'pg_repack' (PostgreSQL extension) installed, can be run natively - or be used 'client-side' to run/invoke pg_repack functionality
for a PostgreSQL database with the extension installed.

Reference: https://github.com/reorg/pg_repack

## versions

This images follows the pg_repack releases + compatibility with PostgreSQL.

| postgres | pg_repack |
|----------|-----------|
| 17       | 1.5.1     |
| 16       | 1.5.0     |
| 15       | 1.4.8     |
| 14       | 1.4.7     |
| 13       | 1.4.6     |
| 12       | 1.4.5     |
| 11       | 1.4.4     |
| 10       | 1.4.3     |


## Dockerhub

https://hub.docker.com/r/hartmutcouk/pg-repack-docker/


### build

```
docker build . -t pg-repack-docker
```

### run postgres

This image extends the official [postgres docker image](https://hub.docker.com/_/postgres/) - so you can start a container with postgres following the official image.
e.g. pg17 (+pg_repack 1.5.1):

```
docker run -e POSTGRES_PASSWORD=1234 --name pg16 -p 5432:5432 -d hartmutcouk/pg-repack-docker:1.5.1
```

psql from local:
```
PGPASSWORD=supersecure psql -h localhost -U postgres
```

psql via docker:
```
docker run -e PGPASSWORD=supersecure -it --rm --network host hartmutcouk/pg-repack-docker:1.5.1 psql -h localhost -U postgres
```


### exec pg_repack against host network

```
docker run -e PGPASSWORD=1234 -it --rm --network host hartmutcouk/pg-repack-docker:1.5.1 pg_repack -h localhost -U dbroot --dbname=dbname --dry-run --table=table1 --only-indexes --no-superuser-check
```

Notes:
- uses host network: `--network host`
- passing `PGPASSWORD` via env variable avoids password prompt (to e.g. exec via script/cron)
