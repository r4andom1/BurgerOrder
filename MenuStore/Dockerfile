FROM postgres:16

ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=admin
ENV POSTGRES_DB=menustore

COPY ./menustore.sql /docker-entrypoint-initdb.d/

EXPOSE 5432