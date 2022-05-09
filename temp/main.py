import initialise

def print_hi(name):
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.

if __name__ == '__main__':
    print_hi('PyCharm')

    is_connected, cursor, connection = initialise.user_connect()
    if(is_connected):
        initialise.create_database(cursor)
        initialise.create_table(cursor)

