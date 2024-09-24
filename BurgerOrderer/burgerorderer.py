<<<<<<< HEAD
""" BurgerOrderer"""
=======
>>>>>>> 798b60dfadfa0782d10400ae82c1c88814de78de
from flask import Flask, render_template

app = Flask(__name__)

<<<<<<< HEAD
@app.route("/")
def front_page():
    """ Frontpage """
    return render_template("index.html")

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=8000)
=======
@app.route('/')
def home():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
>>>>>>> 798b60dfadfa0782d10400ae82c1c88814de78de
