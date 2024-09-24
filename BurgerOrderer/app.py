""" BurgerOrderer"""
from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def front_page():
    """ Frontpage """
    return render_template("index.html")



if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=8000)

#TODO: Lägg till fler app.routes för de andra sidorna.
#TODO: Bygg ut front-pagen med länk till sidan för att välja meny etc
