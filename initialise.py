import mysql.connector as c
from mysql.connector import Error
import populate

def user_connect():
    """
    connects the python application to mysql server
    and prints the status of connection
    :param:
    :return boolean, cursor, connection:
    """

    h  = 'localhost'    # Name of Host      ** Make changes accordingly
    u  = 'root'         # Name of User      ** Make changes accordingly
    pw = 'password1234' # Password          ** Make changes accordingly
    db = 'sys'          # Name of Database  ** Make changes accordingly

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
    """
    Creates database online_retail if it doesn't exist
    else opens the existing online_retail database
    :param cursor:
    :return:
    """
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
    print("Using online_retail Database...")

# def populate_database():
