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
    if new:
        print("online_retail Database NOT Found !!")
        cursor.execute("CREATE DATABASE online_retail;")
        print("Creating new online_retail Database...")

    print("Found online_retail Database")
    cursor.execute("USE online_retail;")
    print("Using online_retail Database...")

# def populate_database():
def create_table(cursor):
    new_employee = True
    new_address = True
    new_inventory = True
    new_customer = True
    new_wishlist = True
    new_customer_cart = True
    new_customer_order = True

    cursor.execute("SHOW TABLES")
    record = cursor.fetchall()
    print("Searching for Employee table...")
    for i in record:
        if i[0] == "employee":
            new_employee = False
        if i[0] == "address":
            new_address = False
        if i[0] == "inventory":
            new_inventory = False
        if i[0] == "customer":
            new_customer = False
        if i[0] == "wishlist":
            new_wishlist = False
        if i[0] == "customer_cart":
            new_customer_cart = False
        if i[0] == "customer_order":
            new_customer_order = False

    if new_employee:
        print("Employee table not found !!")
        print("Creating new Table Employee...")
        cursor.execute("create table employee (Emp_id INT,First_name VARCHAR(50),Last_name VARCHAR(50),Mobile_no VARCHAR(50),Email VARCHAR(50),DOB DATE,Date_of_joining DATE,Department VARCHAR(50),Salary VARCHAR(50),Username VARCHAR(50),Password VARCHAR(50));")
    else:
        print("Employee table already exists !!")

    if new_address:
        print("Address table not found !!")
        print("Creating new Table Address...")
        cursor.execute("create table address (Username VARCHAR(50),House_no VARCHAR(50),Locality VARCHAR(50),City VARCHAR(50),State VARCHAR(50),Pincode INT);")
    else:
        print("Address table already exists !!")

    if new_inventory:
        print("Inventory table not found !!")
        print("Creating new Table Inventory...")
        cursor.execute("create table inventory (Item_id INT,Item_name VARCHAR(50),Quantity INT,Price INT,Category VARCHAR(50),Discount INT);")
    else:
        print("Inventory table already exists !!")

    if new_customer:
        print("Customer table not found !!")
        print("Creating new Table customer...")
        cursor.execute("create table customer (First_name VARCHAR(50),Last_name VARCHAR(50),Mobile_no VARCHAR(50),Email VARCHAR(50),DOB DATE,Username VARCHAR(50),Password VARCHAR(50));")
    else:
        print("Customer table already exists !!")

    if new_wishlist:
        print("Wishlist table not found !!")
        print("Creating new Table Wishlist...")
        cursor.execute("create table wishlist (Item_id INT,Username VARCHAR(50),Price INT);")
    else:
        print("Wishlist table already exists !!")

    if new_customer_cart:
        print("Customer_Cart table not found !!")
        print("Creating new Table Customer_Cart...")
        cursor.execute("create table customer_cart (Item_id INT,Username VARCHAR(50),Total_qty INT,Total_cost INT);")
    else:
        print("Customer_Cart table already exists !!")

    if new_customer_order:
        print("Customer_Order table not found !!")
        print("Creating new Table Customer_Order...")
        cursor.execute("create table customer_order (Item_id INT,Username VARCHAR(50),Order_date DATETIME,Shipping_date DATE,Order_cost INT,Payment_mode VARCHAR(50));")
    else:
        print("Customer_Order table already exists !!")
