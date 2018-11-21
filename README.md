# pg-repack-docker

Docker image for 'pg_repack' (PostgreSQL extension) to use 'client-side' to run/invoke the actual repack functionality 
for a PostgreSQL database with the extension installed.

Reference: https://github.com/reorg/pg_repack


## Dockerhub

https://hub.docker.com/r/hartmutcouk/pg-repack-docker/


### build

    docker build . -t pg-repack-docker
    
### run (example)
    
    docker run -e PGPASSWORD=supersecure -it --rm hartmut-co-uk/pg-repack-docker pg_repack -h localhost -U dbroot --dbname=dbname --dry-run --table=table1 --only-indexes --no-superuser-check

