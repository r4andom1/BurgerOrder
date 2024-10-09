from flask import Flask
from flask import request

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

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
    # http://kitchenview:5000/buy/gnuttburgare?noOnion&extraBacon&