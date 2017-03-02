# Commands to interact with the PostgeSQL server

* `ps -ef | grep postgres`

* To list all the databases: `\list`

* To create a database: `CREATE DATABASE database_name;`

* To use another databse: `\c database_name`

* To view all users: `\du`

* To find where change peer connection to md5, change file: `/etc/postgresql/9.3/main/pg_hba.conf`

* To login to a database as a user: `psql database_name user_name`

* To restart psql server: `sudo service postgresql restart`
