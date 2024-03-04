#!/bin/bash
set -e
#ls -lha
source "docker-entrypoint-initdb.d/.env.local"

psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
CREATE TABLE IF NOT EXISTS "users" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL
);

INSERT INTO "users" (username, password, role)
VALUES ('admin', '$admin_password', 'admin');

EOSQL