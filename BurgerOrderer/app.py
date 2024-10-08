""" BurgerOrderer"""
from flask import Flask, render_template
from flask import request
from db import connect
import requests
import db_fetch
import os

app = Flask(__name__)

order_dict = { # Test dictionary to test sending order to kichenview
    "name": "big_burger",
    "quantity": 2,
    "price": 25,
    "modifications": []
}

@app.route("/toppings")
def toppings():
    """ Toppings test page """
    toppings_html = db_fetch.fetch_topping_html()
    return render_template("toppings.html", toppings_list=toppings_html)

@app.route("/")
def front_page():
    """ Frontpage """
    return render_template("home.html")

@app.route("/order")
def order_page():
    """ Order page """
    return render_template("order-page.html")

@app.route("/order/<category>", methods=['get'])
def order_category(category):
    """ Menu choice page """
    items = db_fetch.fetch_category(category)
    return render_template("order-category.html", category=category, items=items)

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

""" Everything under here is about the kitchenview connection and sending the order through """
base_url = 'http://' + os.getenv('KITCHENVIEW_HOST', 'localhost:5000')

def render_order_page(burger_name, args):
    return "ordered " + burger_name

def make_url(burger_name):
    """ builds url to kitchenview with burger name"""
    return base_url + "/buy" + burger_name

def add_options(url, args):
    """
    adds the options the user has added or removed from order to the url
    """
    if len(args) != 0:
        url += "?" # adds a ? to divide the link from the args
        for arg in args:
            url += arg + "&" # adds a "&" between every option added-on
        return url
    
def send_to_kitchen(burger_name, args):
    """ 
    Creates url and adds the options,
    then sends url to kitchenview.
    """
    requrl = make_url(burger_name)
    requrl = add_options(requrl, args)

    print("Using kitchenview url: " + requrl)
    requests.get(requrl)
    return

@app.route("/buy/<burgername>", methods=["get"])
def buy(burger_name):
    """ should """
    print("Placing an order on " + burger_name)
    send_to_kitchen(burger_name, request.args)
    return render_order_page(burger_name, request.args)

if __name__ == "__main__":
    #print(base_url)
    app.run(debug=True, host="0.0.0.0", port=8000)
    
