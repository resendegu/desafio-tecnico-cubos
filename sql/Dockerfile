FROM postgres:15.4 as dumper

ADD .env.local /docker-entrypoint-initdb.d/.env.local
ADD db_script.sh /docker-entrypoint-initdb.d/db_script.sh

RUN ["sed", "-i", "s/exec \"$@\"/echo \"skipping...\"/", "/usr/local/bin/docker-entrypoint.sh"]
RUN ls -la

ARG postgres_password
ARG admin_db_password
ARG admin_password

ENV postgres_password=$postgres_password
ENV admin_db_password=$admin_db_password
ENV admin_password=$admin_password
ENV PGDATA=/data
ENV POSTGRES_PASSWORD=${postgres_password}

RUN ["/usr/local/bin/docker-entrypoint.sh", "postgres"]

FROM postgres:15.4

COPY --from=dumper /data $PGDATA