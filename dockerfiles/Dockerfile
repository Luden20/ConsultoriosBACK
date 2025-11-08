FROM mysql:8.0

ENV MYSQL_ROOT_PASSWORD=root123
ENV MYSQL_DATABASE=consultoriosjuridicos
ENV MYSQL_USER=appuser
ENV MYSQL_PASSWORD=pass123
ENV MYSQL_ROOT_HOST=%

EXPOSE 3306

CMD ["mysqld", "--default-authentication-plugin=mysql_native_password", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci"]
