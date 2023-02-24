-- for scenarios where there are duplicates, and maybe we need to perform a cleanup operation... this will find the most recent record (or oldest, depending on what is the use case)

-- In this scenario, let us assume there should 25 records in my_table, but each has a duplicate. So, my_table has 50 records.
-- Each pair will have different primary keys, but a shared main_identifier. If the oldest record among each pair
-- is the only valid record we want to keep, we need to find and delete the newest records.

-- Since we are ordering this by created_date, ascending, the newest record will be the second row.
-- So, this query will produce 25 records where the rn = 2, and give us the primary keys that should be deleted.

SELECT my_primary_key
FROM
  (select my_primary_key, 
  main_identifier, 
  created_date, 
  row_number() over (partition by my_main_identifier order by created_date asc) as rn 
  from my_table)
WHERE
  rn = 2
