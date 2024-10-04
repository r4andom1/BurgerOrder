""" BurgerOrderer"""
from flask import Flask, render_template
from db import connect
import db_fetch

app = Flask(__name__)

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


@app.route("/order/category")
def order_meat():
    """ Menu choice page """
    return render_template("order-category.html")


@app.route("/order-completed")
def order_completed_page():
    """ Order completed page """
    return render_template("order-completed.html")

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=8000)

#TODO: Lägg till fler app.routes för de andra sidorna.
#TODO: Bygg ut front-pagen med länk till sidan för att välja meny etc
