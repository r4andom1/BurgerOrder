import psycopg2

def connect():
    """ Connect to the database """

    conn = psycopg2.connect(
        host="menustore",
        port=5432,
        database="menustore",
        user="admin",
        password="admin"
    )
    conn.set_client_encoding('UTF8')
    return conn
