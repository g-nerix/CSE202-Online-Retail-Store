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
            # print("\nYou're currently connected to database:", record[0])
            print("\nSearching for online_retail database...")
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
        print("\nonline_retail Database NOT Found !!")
        cursor.execute("CREATE DATABASE online_retail;")
        print("Creating new online_retail Database...")

    print("Found online_retail Database")
    cursor.execute("USE online_retail;")
    print("Using online_retail Database...")

# def populate_database():
def create_table(cursor):
    """
    Checks for missing Tables and Makes new Table if they don't exist
    :param cursor:
    :return:
    """
    new_employee = True
    new_cart = True
    new_cart_item = True
    new_customer = True
    new_cust_cart_rel = True
    new_inventory = True
    new_order_item = True
    new_orders = True
    new_payments = True

    cursor.execute("SHOW TABLES")
    record = cursor.fetchall()

    print("\nSearching for Employee table...")
    print("Searching for Inventory table...")
    print("Searching for Customer table...")
    print("Searching for Cart  table...")
    print("Searching for Cart_item  table...")
    print("Searching for Cust_Cart_Rel table...")
    print("Searching for Orders table...\n")
    print("Searching for Order_items table...\n")
    print("Searching for Payments table...\n")

    for i in record:
        if i[0] == "employee":
            new_employee = False
        if i[0] == "inventory":
            new_inventory = False
        if i[0] == "cart":
            new_cart = False
        if i[0] == "customer":
            new_customer = False
        if i[0] == "cart_item":
            new_cart_item = False
        if i[0] == "cust_cart_rel":
            new_cust_cart_rel = False
        if i[0] == "orders":
            new_orders = False
        if i[0] == "order_item":
            new_order_item = False
        if i[0] == "payments":
            new_payments = False

    # adding cart table
    print("Creating cart table...")
    # cursor.execute("DROP TABLE IF EXISTS `cart`;")
    if new_cart:
        cursor.execute("CREATE TABLE `cart` ("+
                        "`cart_id` int NOT NULL,"+
                        "`qty` int DEFAULT NULL,"+
                        "`cost` int DEFAULT NULL,"+
                        "PRIMARY KEY (`cart_id`)"+
                        ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;")
    cursor.execute("LOCK TABLES `cart` WRITE;")
    cursor.execute("UNLOCK TABLES;")

    # adding table inventory
    print("Creating inventory table...")
    # cursor.execute("DROP TABLE IF EXISTS `inventory`;")
    if new_inventory:
        cursor.execute("CREATE TABLE `inventory` (" +
                       "`item_id` int NOT NULL," +
                       "`company_name` varchar(30) DEFAULT NULL," +
                       "`item_name` varchar(50) NOT NULL," +
                       "`qty` int NOT NULL," +
                       "`price` int NOT NULL," +
                       "`category` varchar(20) NOT NULL," +
                       "`discount` int DEFAULT NULL," +
                       "PRIMARY KEY (`item_id`)," +
                       "CONSTRAINT `inventory_chk_1` CHECK ((`price` > 0))," +
                       "CONSTRAINT `inventory_chk_2` CHECK ((`qty` >= 0))," +
                       "CONSTRAINT `inventory_chk_3` CHECK ((`discount` >= 0))" +
                       ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;")
    cursor.execute("LOCK TABLES `inventory` WRITE;")
    cursor.execute("UNLOCK TABLES;")

    # adding cart_item table
    print("Creating cart_item table...")
    # cursor.execute("DROP TABLE IF EXISTS `cart_item`;")
    if new_cart_item:
        cursor.execute("CREATE TABLE `cart_item` ("+
                       "`item_id` int NOT NULL,"+
                       "`cart_id` int NOT NULL,"+
                       "`qty` int NOT NULL,"+
                       "`cost` int NOT NULL,"+
                       "PRIMARY KEY (`item_id`,`cart_id`),"+
                       "KEY `cart_id` (`cart_id`),"+
                       "CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `inventory` (`item_id`),"+
                       "CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`)"+
                       ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;")
    else:
        print("cart_item table already exists !!")

    cursor.execute("LOCK TABLES `cart_item` WRITE;")
    cursor.execute("UNLOCK TABLES;")

    # adding table customer
    print("Creating customer table...")
    # cursor.execute("DROP TABLE IF EXISTS `customer`;")
    if new_customer:
        cursor.execute("CREATE TABLE `customer` (" +
                       "`cust_id` int NOT NULL," +
                       "`first_name` varchar(30) NOT NULL," +
                       "`last_name` varchar(30) DEFAULT NULL," +
                       "`phone_no` bigint DEFAULT NULL," +
                       "`email` varchar(30) NOT NULL," +
                       "`house_no` int NOT NULL," +
                       "`locality` varchar(25) NOT NULL," +
                       "`city` varchar(20) NOT NULL," +
                       "`state` varchar(30) NOT NULL," +
                       "`country` varchar(20) NOT NULL,"+
                       "`pin_code` int DEFAULT NULL," +
                       "`username` varchar(15) DEFAULT NULL," +
                       "`password` varchar(64) DEFAULT NULL," +
                       "PRIMARY KEY (`cust_id`)," +
                       "UNIQUE KEY `phone_no` (`phone_no`)," +
                       "CONSTRAINT `customer_chk_1` CHECK ((`pin_code` between 100000 and 999999))," +
                       "CONSTRAINT `customer_chk_2` CHECK ((`phone_no` between 1000000000 and 9999999999))" +
                       ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;")
    else:
        print("customer table already exists !!")

    cursor.execute("LOCK TABLES `customer` WRITE;")
    cursor.execute("UNLOCK TABLES;")

    # adding cust_cart_rel table
    print("Creating cust_cart_rel table...")
    # cursor.execute("DROP TABLE IF EXISTS `cust_cart_rel`;")
    if new_cust_cart_rel:
        cursor.execute("CREATE TABLE `cust_cart_rel` ("+
                       "`cust_id` int NOT NULL,"+
                       "`cart_id` int NOT NULL,"+
                       "PRIMARY KEY (`cust_id`,`cart_id`),"+
                       "KEY `cart_id` (`cart_id`),"+
                       "CONSTRAINT `cust_cart_rel_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),"+
                       "CONSTRAINT `cust_cart_rel_ibfk_2` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`)"+
                       ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;")
    else:
        print("cust_cart_rel table already exists !!")
    cursor.execute("LOCK TABLES `cust_cart_rel` WRITE;")
    cursor.execute("UNLOCK TABLES;")



    # adding employee table
    print("Creating employee table...")
    # cursor.execute("DROP TABLE IF EXISTS `employee`;")
    if new_employee:
        cursor.execute("CREATE TABLE `employee` ("+
                       "`emp_id` int NOT NULL,"+
                       "`first_name` varchar(30) NOT NULL,"+
                       "`last_name` varchar(30) DEFAULT NULL,"+
                       "`phone_no` bigint NOT NULL,"+
                       "`email` varchar(30) NOT NULL,"+
                       "`doj` date NOT NULL,"+
                       "`house_no` int NOT NULL,"+
                       "`locality` varchar(25) NOT NULL,"+
                       "`city` varchar(20) NOT NULL,"+
                       "`state` varchar(30) NOT NULL,"+
                       "`country` varchar(20) NOT NULL," +
                       "`pin_code` int NOT NULL,"+
                       "`dob` date DEFAULT NULL,"+
                       "`department` varchar(20) NOT NULL,"+
                       "`salary` int NOT NULL,"+
                       "`gender` char(1) DEFAULT NULL,"+
                       "`username` varchar(15) NOT NULL,"+
                       "`password` varchar(64) NOT NULL,"+
                       "PRIMARY KEY (`emp_id`),"+
                       "UNIQUE KEY `phone_no` (`phone_no`),"+
                       "UNIQUE KEY `username` (`username`),"+
                       "CONSTRAINT `employee_chk_1` CHECK ((`gender` in (_utf8mb4'm',_utf8mb4'f',_utf8mb4'o'))),"+
                       "CONSTRAINT `employee_chk_2` CHECK ((`pin_code` between 100000 and 999999)),"+
                       "CONSTRAINT `employee_chk_3` CHECK ((`phone_no` between 1000000000 and 9999999999))"+
                       ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;")
    else:
        print("employee table already exists !!")
    cursor.execute("LOCK TABLES `employee` WRITE;")
    cursor.execute("UNLOCK TABLES;")

    # adding payments table
    print("Creating payments table...")
    # cursor.execute("DROP TABLE IF EXISTS `payments`;")
    if new_payments:
        cursor.execute("CREATE TABLE `payments` (" +
                       "`payment_id` int NOT NULL," +
                       "`payment_method` varchar(15) NOT NULL," +
                       "PRIMARY KEY (`payment_id`)," +
                       "CONSTRAINT `payments_chk_1` CHECK ((`payment_method` in (_utf8mb4'cod',_utf8mb4'credit_card',_utf8mb4'debit_card',_utf8mb4'neft')))" +
                       ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;")
    else:
        print("payments table already exists !!")
    cursor.execute("LOCK TABLES `payments` WRITE;")
    cursor.execute("UNLOCK TABLES;")

    # adding orders table
    print("Creating orders table...")
    # cursor.execute("DROP TABLE IF EXISTS `orders`;")
    if new_orders:
        cursor.execute("CREATE TABLE `orders` (" +
                       "`order_id` int NOT NULL," +
                       "`order_date` date NOT NULL," +
                       "`qty` int NOT NULL," +
                       "`cost` int NOT NULL," +
                       "`order_status` varchar(15) NOT NULL," +
                       "`payment_id` int NOT NULL," +
                       "PRIMARY KEY (`order_id`)," +
                       "KEY `payment_id` (`payment_id`)," +
                       "CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`)," +
                       "CONSTRAINT `status_limit` CHECK ((`order_status` in (_utf8mb4'confirmed',_utf8mb4'shipped',_utf8mb4'delivered')))" +
                       ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;")
    else:
        print("orders table already exists !!")
    cursor.execute("LOCK TABLES `orders` WRITE;")
    cursor.execute("UNLOCK TABLES;")

    # adding order_item table
    print("Creating order_item table...")
    # cursor.execute("DROP TABLE IF EXISTS `order_item`;")
    if new_order_item:
        cursor.execute("CREATE TABLE `order_item` ("+
                       "`item_id` int NOT NULL,"+
                       "`order_id` int NOT NULL,"+
                       "`qty` int NOT NULL,"+
                       "`cost` int NOT NULL,"+
                       "PRIMARY KEY (`item_id`,`order_id`),"+
                       "KEY `order_id` (`order_id`),"+
                       "CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `inventory` (`item_id`),"+
                       "CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)"+
                       ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;")
    else:
        print("order_item table already exists !!")

    cursor.execute("LOCK TABLES `order_item` WRITE;")
    cursor.execute("UNLOCK TABLES;")





    # new_employee = True
    # new_address = True
    # new_inventory = True
    # new_customer = True
    # new_wishlist = True
    # new_customer_cart = True
    # new_customer_order = True
    #
    # cursor.execute("SHOW TABLES")
    # record = cursor.fetchall()
    #
    # print("\nSearching for Employee table...")
    # print("Searching for Address table...")
    # print("Searching for Inventory table...")
    # print("Searching for Customer table...")
    # print("Searching for Wishlist table...")
    # print("Searching for Customer_Cart table...")
    # print("Searching for Customer_Order table...\n")
    #
    # for i in record:
    #     if i[0] == "employee":
    #         new_employee = False
    #     if i[0] == "address":
    #         new_address = False
    #     if i[0] == "inventory":
    #         new_inventory = False
    #     if i[0] == "customer":
    #         new_customer = False
    #     if i[0] == "wishlist":
    #         new_wishlist = False
    #     if i[0] == "customer_cart":
    #         new_customer_cart = False
    #     if i[0] == "customer_order":
    #         new_customer_order = False
    #
    # if new_employee:
    #     print("Employee table not found !!")
    #     print("Creating new Table Employee...")
    #     cursor.execute("create table employee (Emp_id INT,First_name VARCHAR(50),Last_name VARCHAR(50),Mobile_no VARCHAR(50),Email VARCHAR(50),DOB DATE,Date_of_joining DATE,Department VARCHAR(50),Salary VARCHAR(50),Username VARCHAR(50),Password VARCHAR(50));")
    # else:
    #     print("Employee table already exists !!")
    #
    # if new_address:
    #     print("Address table not found !!")
    #     print("Creating new Table Address...")
    #     cursor.execute("create table address (Username VARCHAR(50),House_no VARCHAR(50),Locality VARCHAR(50),City VARCHAR(50),State VARCHAR(50),Pincode INT);")
    # else:
    #     print("Address table already exists !!")
    #
    # if new_inventory:
    #     print("Inventory table not found !!")
    #     print("Creating new Table Inventory...")
    #     cursor.execute("create table inventory (Item_id INT,Item_name VARCHAR(50),Quantity INT,Price INT,Category VARCHAR(50),Discount INT);")
    # else:
    #     print("Inventory table already exists !!")
    #
    # if new_customer:
    #     print("Customer table not found !!")
    #     print("Creating new Table customer...")
    #     cursor.execute("create table customer (First_name VARCHAR(50),Last_name VARCHAR(50),Mobile_no VARCHAR(50),Email VARCHAR(50),DOB DATE,Username VARCHAR(50),Password VARCHAR(50));")
    # else:
    #     print("Customer table already exists !!")
    #
    # if new_wishlist:
    #     print("Wishlist table not found !!")
    #     print("Creating new Table Wishlist...")
    #     cursor.execute("create table wishlist (Item_id INT,Username VARCHAR(50),Price INT);")
    # else:
    #     print("Wishlist table already exists !!")
    #
    # if new_customer_cart:
    #     print("Customer_Cart table not found !!")
    #     print("Creating new Table Customer_Cart...")
    #     cursor.execute("create table customer_cart (Item_id INT,Username VARCHAR(50),Total_qty INT,Total_cost INT);")
    # else:
    #     print("Customer_Cart table already exists !!")
    #
    # if new_customer_order:
    #     print("Customer_Order table not found !!")
    #     print("Creating new Table Customer_Order...")
    #     cursor.execute("create table customer_order (Item_id INT,Username VARCHAR(50),Order_date DATETIME,Shipping_date DATE,Order_cost INT,Payment_mode VARCHAR(50));")
    # else:
    #     print("Customer_Order table already exists !!")
    # print("----------------------------")
    # print("Created all required Tables")
    # print("----------------------------")
