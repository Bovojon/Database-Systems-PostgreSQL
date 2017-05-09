# Commands to interact with the PostgeSQL server

* To list all the databases: `\list`

* To create a database: `CREATE DATABASE database_name;`

* To use another databse: `\c database_name`

* To view all users: `\du`

* To find where change peer connection to md5, change file: `/etc/postgresql/9.3/main/pg_hba.conf`

* To login to a database as a user: `psql database_name user_name`

* To restart psql server: `sudo service postgresql restart`

* To check login info: `\conninfo`

* To restart psql server: `/etc/init.d/postgresql restart` or `sudo service postgresql restart`

* To fix problem of *FATAL:  Peer authentication failed for user "user_name"*: `psql user_name  -h 127.0.0.1 -d db_name`

---------------------------------------
### Other useful Commands:
* `sudo su - postgres`

* `ps -ef | grep postgres`

* `psql -d database_db -f file.sql > file.output`

* `\! clear`

* `\i filename.sql`

* `begin transaction` and then either `rollback transaction` or `commit transaction`
