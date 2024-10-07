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


def fetch_category(category):
    category_map = {
        "meat": 1,
        "chicken": 1,
        "fish": 1,
        "vegan": 1,
        "sides": 3,
        "drinks": 2
    }
    conn = connect()

    if conn is None:
        return ":c", 500
    
    cursor = conn.cursor()
    try:
        cursor.execute("SELECT name FROM products WHERE product_type = %s", (category_map[category],))
        items = cursor.fetchall()
        print(items)

        items_html = ""
        for item in items:
            items_html += f"<div class='item'><p>{item[0]}</p><div>+</div></div>"
        return items_html
    except Exception as e:
        return f"Error fetching items: {e}"