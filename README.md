# Commands to interact with the PostgeSQL server

* `sudo su - postgres`

* `ps -ef | grep postgres`

* To list all the databases: `\list`

* To create a database: `CREATE DATABASE database_name;`

* To use another databse: `\c database_name`

* To view all users: `\du`

* To find where change peer connection to md5, change file: `/etc/postgresql/9.3/main/pg_hba.conf`

* To login to a database as a user: `psql database_name user_name`

* To restart psql server: `sudo service postgresql restart`

* To check login info: `\conninfo`

* To restart psql server: `/etc/init.d/postgresql restart` or `sudo service postgresql restart`


---------------------------------------

## Chapter 6 notes
* Simple SELECT query to tables Movies:
```
SELECT *
FROM Movies
WHERE studioName = 'Disney' AND year = 1990;
```
* Using AS option:
```
SELECT title AS name, length*0.017 AS lengthInHours
FROM Movies
WHERE studioName = 'Disney' AND year = 1990;
```
* SQL is case insensitive except within strings.

* To order the attributes use `ORDER BY <list of attributes`:
```
SELECT *
FROM Movies
WHERE studioName = 'Disney' AND year = 1990
ORDER BY length, title;
```
* If descending order:
```
SELECT *
FROM Movies
WHERE studioName = 'Disney' AND year = 1990
ORDER BY length, title DESC;
```

* Products and Joins in SQL - selecting from 2 tables:
```
SELECT name
FROM Movies, MovieExec
WHERE title = 'Star Wars' AND producerC# = cert#;
```
> In the above query, title and producerC# are attributes in the Movies relation and cert# is an attribute in the MovieExec relation.

* If two relations have the same attribute name, then R.A refers to the attribute A of relation R:
```
SELECT MovieStar.name, MovieExec.name
FROM MovieStar, MovieExec
WHERE MovieStar.address = MovieExec.address;
```

`psql -d database_db -f file.sql > file.output`

`\! clear`

`\i filename.sql`

`begin transaction`
Then:
`rollback transaction` or `commit transaction`
