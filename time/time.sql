-- for postgres / redshift
-----------------------------------

-- for converting est/edt to utc

select convert_timezone('EDT', 'UTC', GETDATE())
