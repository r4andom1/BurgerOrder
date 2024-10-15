""" 
Takes order built up from BurgerOrderers app.py
and prints it to the kitchen console. 
"""
from flask import Flask, request, json

app = Flask(__name__)

""" Example code for building order 
# @app.route("/")
# def frontpage():
#     return 'Please specify a burger to buy'

# @app.route("/buy/<burger_name>")
# def buy(burger_name):
#     print("Order placed")
#     print("One " + burger_name + " ordered with the following options:")
#     for arg in request.args:
#         print(" - " + arg)
#     return "Ok"
"""

@app.route("/order", methods=["POST"])
def order():
    """
    Takes data from burgerorders app.py and
    prints it to kitchenview console
    """
    shopping_cart = json.loads(request.json)
    print_order(shopping_cart)
    return "200"

def print_order(shopping_cart):
    """ 
    Prints formatted order and any 
    modifications if there is any. 
    """
    cart_addons = shopping_cart["products"][0]["modifications"]
    print("Order has been placed:")
    print("-----------------") # formatting
    for item in shopping_cart["products"]:
        print("\n" + item["name"])
        if item["modifications"]:
            print(f"Customer has modified order with: \n")
            for addon in item["modifications"]:
                if addon["quantity"] != 1:
                    print(f"{addon['quantity']} {addon['topping_name']}")
        print("_________________") # formatting

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
    # http://kitchenview:5000/buy/gnuttburgare?noOnion&extraBacon&
