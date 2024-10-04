from db import connect

def fetch_topping_html():
    conn = connect()

    if conn is None:
        return ":c", 500
    
    cursor = conn.cursor()

    try:
        cursor.execute("SELECT name, description, price, topping_type FROM toppings ORDER BY topping_type")
        toppings = cursor.fetchall()

        toppings_html = ""
        for topping in toppings:
            toppings_html += f"<strong>{topping[0]}</strong><ul><li>{topping[1]}</li><li>${topping[2]}</li><li>{topping[3]}</li></ul>"
        
        print(toppings)
        return toppings_html

    except Exception as e:
        return f"Error fetching toppings: {e}"
