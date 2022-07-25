# if you run into problems importing psycopg2 package after pip install, 
# check:https://stackoverflow.com/questions/24157533/trouble-with-psycopg2-in-virtualenv-python3-for-use-with-django
import psycopg2
from psycopg2 import sql

# I am loading in my credentials from a text file. You may replace these references with your own.
f = open('credentials.txt', 'r')
creds = f.read().splitlines()

con = psycopg2.connect(host='localhost', user=creds[0], password=creds[1], dbname = 'postgres', port = 5432)
cur = con.cursor()

main_query = sql.SQL("SELECT * from employee e")

cur.execute(main_query)
print(cur.fetchall())

my_join = sql.SQL(" inner join company c on e.companyid = c.companyid")

additional_args = sql.SQL(" AND firstname = 'Jordan'")

cur.execute(main_query + my_join + additional_args)
results = cur.fetchall()
print(results)