# test_database.py
from test import (
    database_test_products,
    database_test_menus,
    database_test_toppings,
    database_test_topping_type,
    database_test_product_type
)
from decimal import Decimal

# Define expected outputs for your tests
expected_product = (1, 1, "Plantera Burger", "A perfect looking gluten free burger.", Decimal('7.99'), 1, 1)
expected_menu = (1, 'Big Juicy Burger Combo', 'Its big... Its juicy...', Decimal('4.99')) 
expected_topping = (1, 'Brioche', 'Soft and buttery French-style bread.',  Decimal('1.50'), 1)
expected_topping_type = [(1, 'Bread'), (2, 'Meat'), (3, 'Topping'), (4, 'Sauce')]
expected_product_type = [(1, 'burger'), (2, 'drink'), (3, 'side')] 

def test_database_products():
    result = database_test_products()  
    assert result == expected_product, f"Expected {expected_product}, but got {result}"

def test_database_menus():
    result = database_test_menus()  
    assert result == expected_menu, f"Expected {expected_menu}, but got {result}"

def test_database_toppings():
    result = database_test_toppings()  
    assert result == expected_topping, f"Expected {expected_topping}, but got {result}"

def test_database_topping_type():
    result = database_test_topping_type()  
    assert result == expected_topping_type, f"Expected {expected_topping_type}, but got {result}"

def test_database_product_type():
    result = database_test_product_type()  
    assert result == expected_product_type, f"Expected {expected_product_type}, but got {result}"

if __name__ == "__main__":
    test_database_products()
    test_database_menus()
    test_database_toppings()
    test_database_topping_type()
    test_database_product_type()
    print("All tests passed!")
