import psycopg2

def connect():
    conn = psycopg2.connect(
        host="localhost",
        port=5433,
        database="menustore",
        user="admin",
        password="admin"
    )
    conn.set_client_encoding('UTF8')
    return conn