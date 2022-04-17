from msilib.schema import ListBox
from tkinter import *
from matplotlib import collections
from matplotlib.pyplot import title
from tkinter import messagebox
import mysql.connector

conn = mysql.connector.connect(
    host = "localhost",
    username = "root",
    password = "rupin", 
    database = "online_retail_store"
)
cur = conn.cursor()

root = Tk()
root.title("Online retail store")
root.geometry("500x500")

uname = ""

def login():
    for ele in root.winfo_children():
        ele.destroy()
    
    l0 = Label(root, text="LOGIN PAGE")
    l0.pack()
    f1 = Frame(root, pady=20)

    l1 = Label(f1, text="Username:")
    l1.grid(row = 1, column=1)
    l1.place()

    global tb1
    tb1 = Entry(f1)
    tb1.grid(row=1, column=2)
    tb1.place()

    l2 = Label(f1, text="Password:")
    l2.grid(row=2, column=1)
    l2.place()

    global tb2
    tb2 = Entry(f1)
    tb2.config(show="\u2022")
    tb2.grid(row=2, column=2)
    tb2.place()

    b1 = Button(f1, text = "Login as customer", command = cust_login)
    b1.grid(row=3, column=1)
    b1.place()

    b2 = Button(f1, text="Login as employee")
    b2.grid(row=3, column=3)
    b2.place()

    b3 = Button(f1, text="New user? Register", command=register)
    b3.grid(row=4, column=2)
    b3.place()

    f1.pack()
    quit = Button(root, text = "Exit", command = root.destroy)
    quit.pack()

def register():
    for ele in root.winfo_children():
        ele.destroy()
    l01 = Label(root, text = "REGISTRATION PAGE")
    l01.pack()
    f2 = Frame(root, pady="20")

    label_reg_1 = Label(f2, text="First name:")
    label_reg_1.grid(row=1, column=1)
    label_reg_1.place()

    label_reg_2 = Label(f2, text="Last name:")
    label_reg_2.grid(row=2, column=1)
    label_reg_2.place()

    label_reg_3 = Label(f2, text="Phone number:")
    label_reg_3.grid(row=3, column=1)
    label_reg_3.place()

    label_reg_4 = Label(f2, text="Email ID:")
    label_reg_4.grid(row=4, column=1)
    label_reg_4.place()    

    label_reg_5 = Label(f2, text="House num:")
    label_reg_5.grid(row=5, column=1)
    label_reg_5.place()

    label_reg_6 = Label(f2, text="Locality:")
    label_reg_6.grid(row=6, column=1)
    label_reg_6.place()

    label_reg_7 = Label(f2, text="City:")
    label_reg_7.grid(row=7, column=1)
    label_reg_7.place()

    label_reg_8 = Label(f2, text="State:")
    label_reg_8.grid(row=8, column=1)
    label_reg_8.place()

    label_reg_9 = Label(f2, text="Country:")
    label_reg_9.grid(row=9, column=1)
    label_reg_9.place()

    label_reg_10 = Label(f2, text="Pincode:")
    label_reg_10.grid(row=10, column=1)
    label_reg_10.place()

    label_reg_11 = Label(f2, text="Username:")
    label_reg_11.grid(row=11, column=1)
    label_reg_11.place()

    label_reg_12 = Label(f2, text="Password:")
    label_reg_12.grid(row=12, column=1)
    label_reg_12.place()

    global text_reg_1
    text_reg_1 = Entry(f2)
    text_reg_1.grid(row=1, column=2)
    text_reg_1.place()

    global text_reg_2
    text_reg_2 = Entry(f2)
    text_reg_2.grid(row=2, column=2)
    text_reg_2.place()

    global text_reg_3
    text_reg_3 = Entry(f2)
    text_reg_3.grid(row=3, column=2)
    text_reg_3.place()

    global text_reg_4
    text_reg_4 = Entry(f2)
    text_reg_4.grid(row=4, column=2)
    text_reg_4.place()

    global text_reg_5
    text_reg_5 = Entry(f2)
    text_reg_5.grid(row=5, column=2)
    text_reg_5.place()

    global text_reg_6
    text_reg_6 = Entry(f2)
    text_reg_6.grid(row=6, column=2)
    text_reg_6.place()

    global text_reg_7
    text_reg_7 = Entry(f2)
    text_reg_7.grid(row=7, column=2)
    text_reg_7.place()

    global text_reg_8
    text_reg_8 = Entry(f2)
    text_reg_8.grid(row=8, column=2)
    text_reg_8.place()

    global text_reg_9
    text_reg_9 = Entry(f2)
    text_reg_9.grid(row=9, column=2)
    text_reg_9.place()

    global text_reg_10
    text_reg_10 = Entry(f2)
    text_reg_10.grid(row=10, column=2)
    text_reg_10.place()

    global text_reg_11
    text_reg_11 = Entry(f2)
    text_reg_11.grid(row=11, column=2)
    text_reg_11.place()

    global text_reg_12
    text_reg_12 = Entry(f2)
    text_reg_12.grid(row=12, column=2)
    text_reg_12.config(show="\u2022")
    text_reg_12.place()

    f2.pack()

    new_reg = Button(root, text="Submit", command = add_reg)
    new_reg.pack()
    back2login = Button(root, text="Go back", command=login)
    back2login.pack()
    quit = Button(root, text="Exit", command = root.destroy)
    quit.pack()

def add_reg():
    add_str = ('INSERT INTO CUSTOMER(first_name, last_name, phone_no, email, house_no, locality, city, state, country, pin_code, username, password) VALUES ('+
    '"'+text_reg_1.get()+'"'+','+'"'+text_reg_2.get()+'"'+','+text_reg_3.get()+','+
    '"'+text_reg_4.get()+'"'+','+text_reg_5.get()+','+'"'+text_reg_6.get()+'"'+','+'"'+text_reg_7.get()+'"'+','+'"'+text_reg_8.get()+'"'+','+
    '"'+text_reg_9.get()+'"'+','+text_reg_10.get()+','+'"'+text_reg_11.get()+'"'+','+'"'+text_reg_12.get()+'"'+');')
    cur.execute(add_str)
    conn.commit()
    messagebox.showinfo("registration", "Successfully registered!")

def cust_login():
    global uname
    uname = tb1.get()
    cur.execute('SELECT password FROM customer WHERE username ="'+uname+'";')
    res = cur.fetchone()
    if (res[0]==tb2.get()):
        messagebox.showinfo("login", "logged in")
        cust_main()
    else:
        messagebox.showerror("login", "wrong password, try again")

def cust_main():
    for ele in root.winfo_children():
        ele.destroy()
    fcm = Frame(root)

    lcm1 = Label(fcm, text="Inventory")
    lcm1.grid(row=1, column=1)
    lcm1.place()

    scr_cm = Scrollbar(fcm, orient=VERTICAL)
    lbcm = Listbox(fcm, yscrollcommand=scr_cm.set, width = 40)
    cur.execute("SELECT * FROM INVENTORY;")
    res = cur.fetchall()
    for i in res:
        lbcm.insert(END, i)
    lbcm.grid(row=2, column=1)
    scr_cm.grid(row=2, column=2, sticky='ns')
    scr_cm.config(command=lbcm.yview)
    lbcm.place()
    scr_cm.place()

    bt_show_cart = Button(fcm, text="Show cart",command = show_cart)
    bt_show_cart.grid(row = 3, column=1)
    bt_show_cart.place()
    fcm.pack()

    logout_cm = Button(root, text="Logout", command = logout)
    logout_cm.pack()

def logout():
    global uname
    uname = ""
    login()

def show_cart():
    for ele in root.winfo_children():
        ele.destroy()
    fsc = Frame(root)

    back_from_cart = Button(fsc, text = "Back", command = cust_main)
    back_from_cart.grid(row =1, column=1)
    back_from_cart.place()

    fsc.pack()

if __name__=="__main__":
    login()
    root.mainloop()
