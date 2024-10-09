import psycopg2

def connect():
    try:
        conn = psycopg2.connect(
            host="localhost",
            port=5433,
            database="menustore",
            user="admin",
            password="admin"
        )
    except Exception as e:
        print(f"Error connecting to database")
    conn.set_client_encoding('UTF8')
    return conn

# _____________________________________________________

def database_test_products():
    conn = connect()
    if conn is not None:
        try:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM products")
            products = cursor.fetchone()
            return products
        except Exception as e:
            print(f"Error executing query: {e}")
        finally:
            cursor.close()
            conn.close()
    else:
        print("Connection to the database failed.")

# _____________________________________________________

def database_test_menus():
    conn = connect()
    if conn is not None:
        try:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM menus")
            toppings = cursor.fetchone()
            return toppings
        except Exception as e:
            print(f"Error executing query: {e}")
        finally:
            cursor.close()
            conn.close()
    else:
        print("Connection to the database failed.")

# _____________________________________________________

def database_test_toppings():
    conn = connect()
    if conn is not None:
        try:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM toppings")
            toppings = cursor.fetchone()
            return toppings
        except Exception as e:
            print(f"Error executing query: {e}")
        finally:
            cursor.close()
            conn.close()
    else:
        print("Connection to the database failed.")

# _____________________________________________________

def database_test_topping_type():
    conn = connect()
    if conn is not None:
        try:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM ref_topping_type")
            toppings = cursor.fetchall()
            return toppings
        except Exception as e:
            print(f"Error executing query: {e}")
        finally:
            cursor.close()
            conn.close()
    else:
        print("Connection to the database failed.")

# _____________________________________________________

def database_test_product_type():
    conn = connect()
    if conn is not None:
        try:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM ref_product_type")
            toppings = cursor.fetchall()
            return toppings
        except Exception as e:
            print(f"Error executing query: {e}")
        finally:
            cursor.close()
            conn.close()
    else:
        print("Connection to the database failed.")


products_table_test = (1, 1, "Plantera Burger", "A perfect looking gluten free burger.", "Decimal('7.99')", 1, 1)
menus_table_test = (1, 'Brioche', 'Soft and buttery French-style bread.', "Decimal('1.50')", 1)
toppings_table_test = (1, 'Brioche', 'Soft and buttery French-style bread.', "Decimal('1.50')", 1)
topping_typ_table_test = [(1, 'Bread'), (2, 'Meat'), (3, 'Topping'), (4, 'Sauce')]
product_typ_table_test = [(1, 'burger'), (2, 'drink'), (3, 'side')]


if __name__ == "__main__":
    database_test_products()
    database_test_menus()
    database_test_toppings()
    database_test_topping_type()
    database_test_product_type()