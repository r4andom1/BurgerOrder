""" BurgerOrderer"""
from flask import Flask, render_template, session, request, redirect, json
from db import connect
from datetime import datetime
import requests
import db_fetch
import os

app = Flask(__name__)
app.secret_key = "secretkeyverysecretkey"

@app.route("/")
def front_page():
    """ Frontpage """

    initialize_session_cart()
    print("Session cart initialized")
    #print(session["cart"])
    return render_template("home.html")

@app.route("/order")
def order_page():
    """ Order page """

    return render_template("order-page.html", cart=session["cart"])

@app.route("/order/<category>", methods=['get'])
def order_category(category):
    """ Menu choice page """

    items = db_fetch.fetch_category(category)
    #print(f"Loading order_category with cart: {session['cart']}")
    return render_template("order-category.html", category=category, items=items, cart=session["cart"])

@app.route("/order-completed")
def order_completed_page():
    """ Order completed page """

    return render_template("order-completed.html")

@app.route("/info/product/<product_id>")
def product_info(product_id):
    """ Product info page """

    product = db_fetch.fetch_product(product_id)
    return render_template("product-info.html", product=product)

@app.route("/info/menu/<menu_id>")
def menu_info(menu_id):
    """ Menu info page """

    menu = db_fetch.fetch_menu(menu_id)
    return render_template("menu-info.html", menu=menu)

@app.route("/cart/add/<product_id>", methods=['POST'])
def add_to_cart(product_id):
    """ Add product to cart """

    add_to_session_cart(product_id)        
    referer = request.headers.get("Referer")
    return redirect(referer)

@app.route("/cart/remove/<product_id>", methods=['POST'])
def remove_from_cart(product_id):
    """ Remove product from cart """

    remove_from_session_cart(product_id)
    referer = request.headers.get("Referer")
    return redirect(referer)

@app.route("/order/modify")
def modify_order():
    """ Modify order page """

    #print(f"Loading order modify with cart: {session['cart']}")
    load_topping_data_to_cart()
    #print(f"Order modify loaded with cart: {session['cart']}")
    return render_template("modify-order.html", cart=session['cart'])

@app.route("/cart/add-modification/<product_id>&<topping_name>", methods=['POST'])
def add_modification(product_id, topping_name):
    """ Add modification to product """
    
    session["cart"] = session.get("cart")
    #print(f"Adding modification {topping_name} to product_id {product_id}")

    for product in session["cart"]["products"]:
        if int(product["product_id"]) == int(product_id):
            for modification in product["modifications"]:
                if modification["topping_name"] == topping_name:
                    modification["quantity"] += 1
                    #print(f"Incremented quantity for topping {topping_name}. New quantity: {modification['quantity']}")
                    break

    calculate_total_price()
    #print(f"Added modification new cart: {session['cart']}")
    
    referer = request.headers.get("Referer")
    return redirect(referer)

@app.route("/cart/remove-modification/<product_id>&<topping_name>", methods=['POST'])
def remove_modification(product_id, topping_name):
    """ Remove modification from product """

    session["cart"] = session.get("cart")
    #print(f"Removing modification {topping_name} from product_id {product_id}")

    for product in session["cart"]["products"]:
        if int(product["product_id"]) == int(product_id):
            for modification in product["modifications"]:
                if modification["topping_name"] == topping_name:
                    if modification["quantity"] > 0:
                        modification["quantity"] -= 1
                        print(f"Decremented quantity for topping {topping_name}. New quantity: {modification['quantity']}")
                    break

    calculate_total_price()

    #print(f"Removed modification new cart: {session['cart']}")
    
    referer = request.headers.get("Referer")
    return redirect(referer)

baseURL='http://' + os.getenv('KITCHENVIEW_HOST', 'localhost:5000')

@app.route("/order/place", methods=['POST'])
def place_order():
    """ Place order and send notification to kitchenview """

    json_cart = json.dumps(session["cart"])
    requestURL = baseURL + "/order"
    requests.post(requestURL, json=json_cart)
    current_date = datetime.now().strftime("%m-%d-%Y")
    current_time = datetime.now().strftime("%I:%M %p")
    return render_template("order-completed.html", cart=session["cart"], current_date=current_date, current_time=current_time)

@app.route("/cart/clear")
def clear_cart():
    """ Clear session cart """

    initialize_session_cart()
    return redirect("/order")

def load_topping_data_to_cart():

    """ Load topping data to cart """


    conn = connect()
    cur = conn.cursor()

    product_ids = [item['product_id'] for item in session["cart"]["products"]]

    if not product_ids:
        #print("No products in cart to load toppings.")
        return

    cur.execute(""" 
        SELECT pt.product_id, t.name, t.price 
        FROM product_toppings pt
        JOIN toppings t ON pt.topping_id = t.topping_id
        WHERE pt.product_id = ANY(%s::int[])
    """, (product_ids,))

    topping_data = cur.fetchall()

    session["cart"] = session.get("cart", {"products": []})

    for product in session["cart"]["products"]:
        if "modifications" not in product:
            product["modifications"] = []

        if product["modifications"] == []:
            for topping in topping_data:
                if product["product_id"] == topping[0]:
                    product["modifications"].append({
                        "topping_name": topping[1],
                        "price_per": topping[2],
                        "quantity": 1
                    })

    cur.close()
    conn.close()

def add_to_session_cart(product_id):
    """ Add product to cart """

    conn = connect()
    cur = conn.cursor()
    
    cur.execute("SELECT product_id, name, price, product_type FROM products WHERE product_id = %s", (product_id,))
    product = cur.fetchone()
    
    #print(f"Product: {product}")

    if product is None:
        #print("Product not found.")
        return

    session["cart"] = session.get("cart", {"products": []})

    found_product = None
    for cart_product in session["cart"]["products"]:
        if cart_product["product_id"] == product[0]:
            found_product = cart_product
            break

    if found_product: 
        found_product["quantity"] += 1
    else:
        session["cart"]["products"].append({
            "product_id": product[0],
            "name": product[1],
            "price": product[2],
            "product_type": product[3],
            "quantity": 1,
            "modifications": []
        })

    calculate_total_price()
    #print(f"Cart: {session['cart']}")

def remove_from_session_cart(product_id):
    """ Remove product from cart """

    session["cart"] = session.get("cart", {"products": []})
    #print(f"Removing product_id {product_id} from cart.")

    for product in session["cart"]["products"]:
        if int(product["product_id"]) == int(product_id):
            if product["quantity"] > 1:
                product["quantity"] -= 1
                #print(f"Decremented quantity for product_id {product_id}. New quantity: {product['quantity']}")
            else:
                session["cart"]["products"].remove(product)
                #print(f"Removed product_id {product_id} from cart.")
            break
    calculate_total_price()

def calculate_total_price():
    """ Calculate total price for cart """

    #print(f"Calculating total price for cart: {session['cart']}")

    total_price = 0
    for product in session["cart"]["products"]:
        total_price += float(product["price"]) * int(product["quantity"])
    
    for product in session["cart"]["products"]:
        for modification in product["modifications"]:
            if modification != []:
                if int(modification["quantity"] > 1):
                    total_price += float(modification["price_per"]) * (int(modification["quantity"]) - 1)
    session["cart"]["total_price"] = round(total_price, 2)

def initialize_session_cart():
    """ Initialize session cart """

    session["cart"] = {
        "products": [],
        "total_price": 0
    }

#@app.route("/toppings")
#def toppings():
#    """ Toppings test page """
#    toppings_html = db_fetch.fetch_topping_html()
#    return render_template("toppings.html", toppings_list=toppings_html)

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=8000)