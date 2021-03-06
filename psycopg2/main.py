# if you run into problems importing psycopg2 package after pip install, 
# check:https://stackoverflow.com/questions/24157533/trouble-with-psycopg2-in-virtualenv-python3-for-use-with-django
import psycopg2
from psycopg2 import sql

# I am loading in my credentials from a text file. You may replace these references with your own.
f = open('credentials.txt', 'r')
creds = f.read().splitlines()

# connect to localhost postgres db
con = psycopg2.connect(host='localhost', user=creds[0], password=creds[1], dbname = 'postgres', port = 5432)
cur = con.cursor()

schema = 'public'

# base query
main_query = sql.SQL("SELECT * from employee e")

# test the query -- if there is an error, you may have to perform a rollback operation to free db transactions
cur.execute(main_query)
print(cur.fetchall())

# create a join
my_join = sql.SQL(" inner join company c on e.companyid = c.companyid")

# additional args added to join (equivalent to having in WHERE clause)
additional_args = sql.SQL(" AND firstname = 'Jordan'")

cur.execute(main_query + my_join + additional_args)
results = cur.fetchall()
print(results)

print()
print()

# grab column information
col_info_query = f"select column_name from information_schema.columns where table_schema = '{schema}' and table_name = 'employee';"
cur.execute(col_info_query)
my_columns = cur.fetchall()

filtered_columns = list(filter(lambda x: 'active' in x[0], my_columns))

print(filtered_columns)