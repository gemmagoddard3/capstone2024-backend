import sqlite3

con = sqlite3.connect("database.db")

with open("database.sql", "r") as file:
    dbSetup = file.read()

con.executescript(dbSetup)

con.close()