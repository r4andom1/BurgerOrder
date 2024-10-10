from flask import Flask, request, json

app = Flask(__name__)

@app.route("/")
def frontpage():
    return 'Please specify a burger to buy'

@app.route("/buy/<burger_name>")
def buy(burger_name):
    print("Order placed")
    print("One " + burger_name + " ordered with the following options:")
    for arg in request.args:
        print(" - " + arg)
    return "Ok"

@app.route("/order", methods=["POST"])
def order():
    print("Order placed")
    shopping_cart = json.loads(request.json)
    print_order(shopping_cart)
    return "200"

def print_order(shopping_cart):
    cart_addons = shopping_cart["products"][0]["modifications"]
    if shopping_cart["products"][0]["quantity"] != 1: # If quantity is not 1
        print("Print order as usual\n")
        print(shopping_cart["products"][0]["quantity"])
    #else
    for item in shopping_cart["products"]:
        print(item["name"])
        if item["modifications"]:
            for addon in item["modifications"]:
                if addon["quantity"] != 1:
                    print(addon["topping_name"])
                    print(addon["quantity"])


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5001)
    # http://kitchenview:5000/buy/gnuttburgare?noOnion&extraBacon&