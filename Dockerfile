FROM postgres:11

RUN apt-get update --fix-missing && \
    apt-get install -y postgresql-server-dev-$PG_MAJOR wget openssh-server

COPY scripts .
RUN chmod +x ./*.sh && bash ./install_pg_repack.sh
