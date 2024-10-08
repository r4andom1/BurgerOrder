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

def database_test():
    conn = connect()
    if conn is not None:
        try:
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM products")
            toppings = cursor.fetchone()
            print(toppings)
        except Exception as e:
            print(f"Error executing query: {e}")
        finally:
            cursor.close()
            conn.close()
    else:
        print("Connection to the database failed.")

products_table_test = (1, 1, "Plantera Burger", "A perfect looking gluten free burger.", "Decimal('7.99')", 1, 1)


if __name__ == "__main__":
    database_test()
