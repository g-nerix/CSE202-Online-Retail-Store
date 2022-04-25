from calendar import c
from msilib.schema import ListBox
from pickletools import string1
from tkinter import *
# from matplotlib import collections
# from matplotlib.pyplot import title
from tkinter import messagebox, ttk
from turtle import width
from xml.sax import parseString
import mysql.connector

conn = mysql.connector.connect(
    host = 'localhost',
    username = 'root',
    password = 'rupin',
    database = 'online_retail_store'
)
cur = conn.cursor()

root = Tk()
root.title("Online retail store")
root.geometry("1000x550")

uname = ""
cart_id = ""
cust_id = ""
def callback(input):
    if ((input.isdigit() and int(input)<=15) or input ==''):
        return True
    else:
        return False

reg = root.register(func = callback)

def login():
    for ele in root.winfo_children():
        ele.destroy()
    
    l0 = Label(root, text="LOGIN PAGE",font='Helvetica 22 bold')
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
    b1.grid(row=3, column=2)
    b1.place()

    b2 = Button(f1, text="Login as employee")
    b2.grid(row=4, column=2)
    b2.place()

    b3 = Button(f1, text="New user? Register", command=register)
    b3.grid(row=5, column=2)
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
    cur.execute('SELECT cust_id from customer order by cust_id desc limit 1;')
    temp1 = cur.fetchone()
    temp = temp1[0]
    cur.execute('INSERT INTO cart(cart_id) VALUES('+str(temp+100)+');')
    cur.execute('INSERT INTO cust_cart_rel VALUES('+str(temp)+','+str(temp+100)+');')
    conn.commit()
    messagebox.showinfo("registration", "Successfully registered!")

def cust_login():
    global uname
    global cust_id
    uname = tb1.get()
    cur.execute('SELECT password FROM customer WHERE username ="'+uname+'";')
    res = cur.fetchone()
    if (res[0]==tb2.get()):
        #messagebox.showinfo("login", "logged in")
        cur.execute('SELECT cust_id FROM customer where username = "'+uname+'";')
        res1 = cur.fetchone()
        cust_id = res1[0]
        global cart_id
        cur.execute('SELECT cart_id from cust_cart_rel where cust_id = '+str(cust_id)+';')
        res2 = cur.fetchone()
        cart_id = int(res2[0])
        cust_main()
    else:
        tb2.delete(0,'end')
        messagebox.showerror("Login", "wrong password, try again")

def cust_main():
    for ele in root.winfo_children():
        ele.destroy()
    fcm = Frame(root)
    fcm1 = Frame(root)
    lcm1 = Label(fcm1, text="Inventory",font='Helvetica 22 bold')
    lcm1.grid(row=1, column=1)
    lcm1.place()

    scr_cm = Scrollbar(fcm1, orient=VERTICAL)

    cur.execute("SELECT item_id, company_name, item_name, qty, price, category, discount FROM INVENTORY;")
    res = cur.fetchall()

    tree = ttk.Treeview(fcm1, column=("c1", "c2", "c3","c4","c5","c6","c7"), show='headings', height=10, yscrollcommand=scr_cm.set)
    tree.column("# 1", anchor=CENTER)
    tree.heading("# 1", text="Item ID")
    tree.column("# 2", anchor=CENTER)
    tree.heading("# 2", text="Company Name")
    tree.column("# 3", anchor=CENTER)
    tree.heading("# 3", text="Item Name")
    tree.column("# 4", anchor=CENTER, width=55)
    tree.heading("# 4", text="Quantity")
    tree.column("# 5", anchor=CENTER, width=40)
    tree.heading("# 5", text="Price")
    tree.column("# 6", anchor=CENTER)
    tree.heading("# 6", text="Category")
    tree.column("# 7", anchor=CENTER, width=60)
    tree.heading("# 7", text="Discount")

    m = 0;
    for i in res:
        tree.insert('', 'end', text=str(m), values = i)
        m+=1
    tree.grid(row=2, column=1)
    tree.place()

    scr_cm.grid(row=2, column=2, sticky='ns')
    scr_cm.config(command = tree.yview)
    scr_cm.place()

    bt_show_cart = Button(fcm, text="Show cart",command = show_cart)
    bt_show_cart.grid(row = 3, column=1)
    bt_show_cart.place()

    bt_show_orders = Button(fcm, text="Previous orders", command = show_orders)
    bt_show_orders.grid(row=3, column=2)
    bt_show_orders.place()

    add_item_id = Label(fcm, text="Add item ID")
    add_item_id.grid(row=4, column=1)
    add_item_id.place()

    global item_id_tb
    item_id_tb = Entry(fcm)
    item_id_tb.grid(row=4, column=2)
    item_id_tb.place()
    
    add_qty = Label(fcm, text = "Add quantity")
    add_qty.grid(row=5, column=1)
    add_qty.place()

    global add_qty_tb
    add_qty_tb = Entry(fcm)
    add_qty_tb.config(validate="key", validatecommand=(reg,'%P'))
    add_qty_tb.grid(row=5, column=2)
    add_qty_tb.place()

    add_to_cart = Button(fcm, text="Add to cart", command = add2cart)
    add_to_cart.grid(row = 6, column=2)
    add_to_cart.place()
    def OrderBy(s):
        for ele in tree.get_children():
            tree.delete(ele)
        if(s=="price_asc"):
            cur.execute("SELECT * FROM INVENTORY order by price ASC;")
        elif (s =="price_desc"):
            cur.execute("SELECT * FROM INVENTORY order by price DESC;")
        elif (s =="discount_asc"):
            cur.execute("SELECT * FROM INVENTORY order by discount ASC;")
        elif (s =="discount_desc"):
            cur.execute("SELECT * FROM INVENTORY order by discount DESC;")
        elif (s =="name_asc"):
            cur.execute("SELECT * FROM INVENTORY order by item_name ASC;")
        elif (s =="name_desc"):
            cur.execute("SELECT * FROM INVENTORY order by item_name DESC;")

        res = cur.fetchall()
        

        scr_cm.grid(row=2, column=2, sticky='ns')
        scr_cm.config(command = tree.yview)
        scr_cm.place()

        m = 0;
        for i in res:
            tree.insert('', 'end', text=str(m), values=i)
            m += 1
        tree.grid(row=2, column=1)
        tree.place()
    
    fcm2 = Frame(root)
    l_sort = Label(fcm2, text="Sort by:")
    l_sort.grid(row=1, column=1)
    l_sort.place()
    clicked = StringVar()
    clicked.set("None")
    options = ["price_asc", "price_desc", "discount_asc", "discount_desc", "name_asc", "name_desc"]
    drop_sort = OptionMenu(fcm2, clicked, *options)
    drop_sort.grid(row=1, column=2)
    drop_sort.place()
    def sort_cm():
        OrderBy(clicked.get())
    b_sort = Button(fcm2, text="Sort", command=sort_cm)
    b_sort.grid(row=1, column=3)
    b_sort.place()

    search_lbl = Label(fcm2, text="Search")
    search_lbl.grid(row=2, column=1)
    search_lbl.place()

    search_ent = Entry(fcm2)
    search_ent.grid(row=2, column=2)
    search_ent.place()

    def search_cust_inv():
        for ele in tree.get_children():
            tree.delete(ele)
        cur.execute('SELECT * FROM INVENTORY WHERE ITEM_NAME LIKE "%'+search_ent.get()+'%";')
        res = cur.fetchall()
        m = 0;
        for i in res:
            tree.insert('', 'end', text=str(m), values = i)
            m+=1
        tree.grid(row=2, column=1)
        tree.place()

    search_bt = Button(fcm2, text="Search", command = search_cust_inv)
    search_bt.grid(row=2, column=3)
    search_bt.place()  

    logout_cm = Button(fcm2, text="Logout", command = logout)
    logout_cm.grid(row=3, column=2)
    logout_cm.place()
    
    fcm1.pack()
    fcm.pack()
    fcm2.pack()


def add2cart():
    pass
    global item_id_tb
    global cart_id
    global add_qty_tb
    temp_cost = 0
    cur.execute('SELECT price*(1 - discount/100) from inventory where '+str(item_id_tb.get())+'=item_id;')
    res = cur.fetchone()
    temp_cost = res[0]
    cur.execute('INSERT INTO cart_item VALUES('+item_id_tb.get()+','+str(cart_id)+','+add_qty_tb.get()+','+str(int(temp_cost))+');')
    conn.commit()

def logout():
    global uname, cart_id, cust_id
    uname = ""
    cart_id = 0
    cust_id = 0
    login()

def show_cart():
    for ele in root.winfo_children():
        ele.destroy()
    fsc = Frame(root)

    fsc1 = Frame(root)
    lsc1 = Label(fsc, text="Your cart", font='Helvetica 22 bold')
    lsc1.grid(row=1, column=1)
    lsc1.place()
    global cust_id
    scr_cm = Scrollbar(fsc, orient=VERTICAL)
    lbcm = Listbox(fsc1, yscrollcommand=scr_cm.set, width=60, height=30, borderwidth=2)
    cur.execute("select C.item_id, C.qty, C.cost from cart_item as C, cust_cart_rel as r where r.cart_id = C.cart_id and r.cust_id = '"+str(cust_id)+"';")
    res = cur.fetchall()

    tree = ttk.Treeview(fsc, column=("c1", "c2", "c3"), show='headings', height=10)
    tree.column("# 1", anchor=CENTER)
    tree.heading("# 1", text="Item_ID")
    tree.column("# 2", anchor=CENTER)
    tree.heading("# 2", text="Quantity")
    tree.column("# 3", anchor=CENTER)
    tree.heading("# 3", text="Cost")

    m = 0
    for i in res:
        tree.insert('', 'end', text=str(m), values=i)
        m += 1
    tree.grid(row=2, column=1)
    tree.place()
    fsc2 = Frame(root)
    back_from_cart = Button(fsc2, text="Back", command=cust_main)
    back_from_cart.grid(row=1, column=1)
    back_from_cart.place()

    scr_cart = Scrollbar(fsc, orient=VERTICAL)
    scr_cart.grid(row=2, column=2, sticky='ns')
    scr_cart.config(command =tree.yview)
    scr_cart.place()

    convert = Button(fsc2, text = "Place order", command= convert2order)
    convert.grid(row=3, column=1, pady=10)
    convert.place()
    
    rem_item_sc = Label(fsc2, text = "Remove item:")
    rem_item_sc.grid(row=2, column=1)
    rem_item_sc.place()
    global rem_item_sc_e
    rem_item_sc_e=Entry(fsc2)
    rem_item_sc_e.grid(row=2, column=2)
    rem_item_sc_e.place()

    rem_item_sc_b = Button(fsc2, text="Remove", command = rem_from_cart)
    rem_item_sc_b.grid(row=2, column=3)
    rem_item_sc_b.place()

    fsc.pack()
    fsc2.pack()
def rem_from_cart():
    global rem_item_sc_e, cart_id, cust_id
    temp = rem_item_sc_e.get()
    cur.execute('DELETE FROM CART_ITEM WHERE cart_id='+str(cart_id)+' and item_id='+str(temp)+';')
    conn.commit()

def show_orders():
    for ele in root.winfo_children():
        ele.destroy()
    
    fso = Frame(root)
    global cust_id
    lso1 = Label(fso, text="Your Orders",font='Helvetica 22 bold')
    lso1.grid(row=1, column=1)
    lso1.place()

    tree = ttk.Treeview(fso, column=("c1", "c2", "c3","c4","c5"), show='headings', height=10)
    tree.column("# 1", anchor=CENTER, width=90)
    tree.heading("# 1", text="Order_ID")
    tree.column("# 2", anchor=CENTER,width=90)
    tree.heading("# 2", text="Order date")
    tree.column("# 3", anchor=CENTER, width=90)
    tree.heading("# 3", text="Cost")
    tree.column("# 4", anchor=CENTER, width=90)
    tree.heading("# 4", text="Status")
    tree.column("# 5", anchor=CENTER, width=90)
    tree.heading("# 5", text="Payment_ID")

    scr_so = Scrollbar(fso, orient=VERTICAL)
    scr_so.grid(row=2, column=2, sticky='ns')
    scr_so.config(command =tree.yview)
    scr_so.place()

    cur.execute('SELECT o.order_id, o.order_date, o.cost, o.order_status, o.payment_id FROM orders as o, cust_order_rel as rel where rel.cust_id='+str(cust_id)+' and rel.order_id = o.order_id;')
    res = cur.fetchall()
    m = 0
    for i in res:
        tree.insert('', 'end', text=str(m), values=i)
        m += 1
    tree.grid(row=2, column=1)
    tree.place()
    fso1 = Frame(root)
    back_ord = Button(fso1, text="Back", command= cust_main)
    back_ord.grid(row=2, column=1)
    back_ord.place()
    
    global see_det_tb
    see_det_tb = Entry(fso1)
    see_det_tb.grid(row=1, column=1)
    see_det_tb.place()

    see_det = Button(fso1, text="See details", command=show_order_det)
    see_det.grid(row=1, column=2)
    see_det.place()

    fso.pack()
    fso1.pack()

def show_order_det():
    global see_det_tb
    temp = see_det_tb.get()
    for ele in root.winfo_children():
        ele.destroy()
    f_odet = Frame(root)
    
    l_odet = Label(f_odet, text='Order details', font='Helvetica 22 bold')
    l_odet.grid(row=1, column=1)
    l_odet.place()

    cur.execute('SELECT oi.item_id, oi.qty, oi.cost FROM ORDER_ITEM as oi, cust_order_rel as rel WHERE oi.order_id='+str(temp)+' and rel.order_id = oi.order_id and rel.cust_id='+str(cust_id)+';')
    res = cur.fetchall()

    tree = ttk.Treeview(f_odet, column=("c1", "c2", "c3"), show='headings', height=10)
    tree.column("# 1", anchor=CENTER, width=90)
    tree.heading("# 1", text="Item_ID")
    tree.column("# 2", anchor=CENTER,width=90)
    tree.heading("# 2", text="Quantity")
    tree.column("# 3", anchor=CENTER, width=90)
    tree.heading("# 3", text="Cost")
    m = 0
    for i in res:
        tree.insert('', 'end', text=str(m), values=i)
        m += 1
    tree.grid(row=2, column=1)
    tree.place()
    back_odet = Button(f_odet, text = "Back", command=show_orders)
    back_odet.grid(row=3, column=1)
    back_odet.place()

    scr_sod = Scrollbar(f_odet, orient=VERTICAL)
    scr_sod.grid(row=2, column=2, sticky='ns')
    scr_sod.config(command =tree.yview)
    scr_sod.place()

    f_odet.pack()

def convert2order():
    global cust_id
    global cart_id
    cur.execute('SELECT c.cost*c.qty from cart_item as c where c.cart_id='+str(cart_id)+';')
    total = 0
    res = cur.fetchall()
    for i in res:
        total+=i[0]
    cur.execute('call cart2ord('+str(cust_id) + ','+str(total)+');')
    conn.commit()
    messagebox.showinfo("Confirmation", "Order placed")

if __name__=="__main__":
    login()
    root.mainloop()
