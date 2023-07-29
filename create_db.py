import sqlite3


def create_db():
    with open("student_journal.sql") as f:
        sql = f.read()

    with sqlite3.connect("student_journal.db") as con:
        cur = con.cursor()
        cur.executescript(sql)


if __name__ == "__main__":
    create_db()
