import sqlite3

def load_database(db_name: str=":memory:") -> sqlite3.Connection:

    con = sqlite3.connect(db_name, detect_types=sqlite3.PARSE_DECLTYPES|sqlite3.PARSE_COLNAMES)
    cur = con.cursor()

    number_of_records = 5

    def mock_comp_results() -> None:
        table = """CREATE TABLE comp_results(
            Name VARCHAR(255)
            ,WEIGHT_CLASS INT NOT NULL
            ,VICTORIES INT NOT NULL
            );"""
        cur.execute(table)

        NAME = ['John', 'Frey', 'George', 'Lily', "Sam"]
        WEIGHT_CLASS = [100, 150, 150, 100, 150]
        VICTORIES = [0, 2, 0, 1, 0]

        query = """INSERT INTO comp_results (NAME, WEIGHT_CLASS, VICTORIES) VALUES (?, ?, ?);"""

        for i in range(0, number_of_records):
            cur.execute(query, (NAME[i], WEIGHT_CLASS[i], VICTORIES[i]))

    mock_comp_results()

    return con