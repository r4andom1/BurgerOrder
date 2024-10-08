from flask import Flask
from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy() # db intitialized here
app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "menustore.sql"
db.init_app(app)






# tests/test_routes.py
def test_front_page(test_app):
    client = test_app.test_client()
    response = client.get('/')
    assert response.status_code == 200
    assert b'Welcome' in response.data

def test_toppings_page(test_app, mocker):
    client = test_app.test_client()


    response = client.get('/toppings')
    assert response.status_code == 200
    assert b'Lettuce' in response.data
    assert b'Tomato' in response.data

def test_order_category(test_app, mocker):
    client = test_app.test_client()


    response = client.get('/order/burger')
    assert response.status_code == 200
    assert b'Burger' in response.data
    assert b'Fries' in response.data

def test_product_info(test_app, mocker):
    client = test_app.test_client()


    response = client.get('/info/product/1')
    assert response.status_code == 200
    assert b'Burger' in response.data
    assert b'10.0' in response.data
