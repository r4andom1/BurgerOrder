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
    finally:
        cursor.close()
        conn.close()


def fetch_category(category):
    category_map = {
        "beef": 1,
        "chicken": 1,
        "fish": 1,
        "plant-based": 1,
        "sides": 3,
        "drinks": 2
    }
    conn = connect()

    if conn is None:
        return ":c", 500
    
    cursor = conn.cursor()
    try:
        if category_map.get(category) == 1:   
            cursor.execute("""
                SELECT DISTINCT p.product_id, p.name
                FROM products p
                JOIN product_toppings pt ON p.product_id = pt.product_id
                JOIN toppings t ON pt.topping_id = t.topping_id
                WHERE t.name ILIKE %s ORDER BY name
            """, (category,))

            items = cursor.fetchall()

            items_html = ""
            for item in items:
                items_html += (
                    f"<div class='item' data-id='{item[0]}' "
                    f"onclick=\"location.href='/info/product/{item[0]}';\"><p>{item[1]}</p><div>+</div></div>"
                )
        else:
            cursor.execute("""
                SELECT product_id, name, quantity, rpq.description
                FROM products p
                JOIN ref_product_quantities rpq ON p.quantity_unit = rpq.quantity_unit
                WHERE product_type = %s ORDER BY name, quantity
            """, (category_map.get(category),))

            items = cursor.fetchall()

            items_html = ""
            for item in items:
                items_html += (
                    f"<div class='item' data-id='{item[0]}' "
                    f"onclick=\"location.href='/info/product/{item[0]}';\"><p>{item[1]} {item[2]} {item[3]}</p><div>+</div></div>"
                )


     

        
            
        return items_html
    except Exception as e:
        return f"Error fetching items: {e}"
    finally:
        cursor.close()
        conn.close()

def fetch_product(product_id):
    conn = connect()

    if conn is None:
        return ":c", 500
    
    cursor = conn.cursor()
    try:
        cursor.execute("SELECT product_type FROM products WHERE product_id = %s", (product_id,))
        product_type = cursor.fetchone()[0]
    except Exception as e:
        return f"Error fetching product type: {e}"
    
    # 1 = burger, 2 = drink, 3 = side, we only care about burger because we fetch contents of the burger
    
    if product_type == 1:
        try:
            cursor.execute("""
                SELECT p.name, p.description, p.price, p.quantity, rpq.description, t.name, t.description FROM products p
                JOIN product_toppings pt ON p.product_id = pt.product_id
                JOIN toppings t ON pt.topping_id = t.topping_id
				JOIN ref_product_quantities rpq ON p.quantity_unit = rpq.quantity_unit
                WHERE p.product_id = %s
            """, (product_id,))

            product_details = cursor.fetchall()
            product_name, product_desc, product_price, product_quantity, quantity_unit_desc, _, _ = product_details[0]

            product_html = (
                f"<h1>Item</h1>"
                f"<h3>{product_name}</h3>"
                f"<p>{product_desc}</p>"
                f"<p>${product_price}</p>"
                f"<p>Qty {product_quantity} {quantity_unit_desc}</p>"
            )

            toppings_list = [
                f"<li><strong>{topping_name}</strong>: {topping_desc}</li>"
                for _, _, _, _, _, topping_name, topping_desc in product_details
            ]

            product_html += "<h1>Toppings</h1><ul>" + ''.join(toppings_list) 
        
            return product_html
        except Exception as e:
            return f"Error fetching product: {e}"
        finally:
            cursor.close()
            conn.close()
        
    else:
        try:
            cursor.execute("""
                SELECT p.name, p.description, p.price, p.quantity, rpq.description FROM products p 
                JOIN ref_product_quantities rpq ON p.quantity_unit = rpq.quantity_unit
                WHERE p.product_id = %s
            """, (product_id,))
            product_details = cursor.fetchone()
            product_name, product_desc, product_price, product_quantity, quantity_unit_desc = product_details

            product_html = (
                f"<h1>Item</h1>"
                f"<h3>{product_name}</h3>"
                f"<p>{product_desc}</p>"
                f"<p>${product_price}</p>"
                f"<p>Qty {product_quantity} {quantity_unit_desc}</p>"
            )
            return product_html
        except Exception as e:
            return f"Error fetching product: {e}"
        finally:
            cursor.close()
            conn.close()
        




    
    
    
    

