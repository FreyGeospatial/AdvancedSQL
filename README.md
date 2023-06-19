# AdvancedSQL
Here, I will examine intermediate and advanced sql functions, usually using Python as an intermediary between myself and the database. Databases I will be using will mostly be:
- Postgres (and maybe PostGIS)
- SQL Server

### Reusable code and tips:

SQL Server local host connection string: `f'Driver={{SQL Server}};Server=<localhost OR computer name>;Database=<db name>;Trusted_Connection=yes;'`
- `Trusted connection=yes` assumes Windows authentication is being used.

Redshift current datetime in UTC:
- `GETDATE() at time zone current_setting('timezone') at time zone 'utc'`

To run SQL Server on an M1 Mac, follow the steps here:
- https://database.guide/how-to-install-sql-server-on-an-m1-mac-arm64/
- TLDR:
  - install and open docker
  - run `docker pull mcr.microsoft.com/azure-sql-edge` in the terminal
  - run `sudo docker run --cap-add SYS_PTRACE -e 'ACCEPT_EULA=1' -e 'MSSQL_SA_PASSWORD=bigStrongPwd' -p 1433:1433 --name sqledge -d mcr.microsoft.com/azure-sql-edge` but change the password and database name if you wish
  - run `docker ps` to check status of server
  - use DBeaver or Azure Data Studio to connect to the SQL Server instance if you choose to use a GUI. Username is `sa`, server is `localhost`.
