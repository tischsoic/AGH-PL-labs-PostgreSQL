Creating database duplicate because of risky queries in lab_6:

CREATE DATABASE postgres_copy WITH TEMPLATE postgres OWNER postgres;


In some cases database name must be quoted

If some other connections are active in source database then error will be thrown
(ERROR: source database "sourcedb" is being accessed by other users). There is
simple script to kill all other connections in postges database except current
connection

In PostgreSQL 9.2 and above, to disconnect everything except your session from
the database you are connected to:

```
SELECT pg_terminate_backend(procpid)
FROM pg_stat_activity
WHERE datname = current_database()
    AND procpid <> pg_backend_pid();
```

Source: http://jaaknt.blogspot.com/2013/05/duplicate-postgres-database.html



Use transaction to control original state od DB!
Example:

```
BEGIN;
UPDATE accounts SET balance = balance - 100.00
    WHERE name = 'Alice';
SAVEPOINT my_savepoint;
UPDATE accounts SET balance = balance + 100.00
    WHERE name = 'Bob';
-- oops ... forget that and use Wally's account
ROLLBACK TO my_savepoint;
UPDATE accounts SET balance = balance + 100.00
    WHERE name = 'Wally';
COMMIT;
```

Example from: https://www.postgresql.org/docs/8.3/static/tutorial-transactions.html
