import db_mock
import sqlite3

con = db_mock.load_database()
cur = con.cursor()

query = "SELECT name, weight_class, victories, count(weight_class) OVER (PARTITION BY weight_class) as blah FROM comp_results;"
cur.execute(query)
x = cur.fetchall()

print("Name | Weight_class | Victories | count of weight class")
for record in x:
    print(record)