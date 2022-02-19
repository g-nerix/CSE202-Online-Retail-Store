import mysql.connector as c
from mysql.connector import Error
import populate

def user_connect():
    """
    connects the python application to mysql server
    and prints the status of connection
    """

    h  = 'localhost'    # Name of Host
    u  = 'root'         # Name of User
    pw = 'password1234' # Password
    db = 'sys'          # Name of Database

    try :
        connection = c.connect(host = h, database = db, user = u, password = pw)
        if connection.is_connected():
            database_info = connection.get_server_info()
            print("Connected to MySQL Server version", database_info)
            cursor = connection.cursor()
            cursor.execute("select database();")
            record = cursor.fetchone()
            print("You're currently connected to database:", record[0])
            print("Searching for online_retail database...")
            return True, cursor, connection

    except Error as e:
        print("Error while connecting to MySQL", e)
        return False

def create_database(cursor):
    cursor.execute("show databases;")
    record = cursor.fetchall()
    new = True
    for i in record:
        if i[0] == "online_retail":
            new = False
    if (new):
        cursor.execute("CREATE DATABASE online_retail;")
        print("Creating online_retail Database...")

    cursor.execute("USE online_retail;")
    print("Using online_retail...")

# def populate_database():
