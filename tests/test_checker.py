# test_database.py
from test import (
    database_test_products,
    database_test_menus,
    database_test_toppings,
    database_test_topping_type,
    database_test_product_type
)

from decimal import Decimal
from time import sleep

expected_product = (1, 1, "Plantera Burger", "A perfect looking gluten free burger.", Decimal('7.99'), 1, 1)
expected_menu = (1, 'Big Juicy Burger Combo', 'Its big... Its juicy...', Decimal('4.99')) 
expected_topping = (1, 'Brioche', 'Soft and buttery French-style bread.',  Decimal('1.50'), 1)
expected_topping_type = [(1, 'Bread'), (2, 'Meat'), (3, 'Topping'), (4, 'Sauce')]
expected_product_type = [(1, 'burger'), (2, 'drink'), (3, 'side')] 

tests_passed = 0
test_amount = 5

def test_database_products():
    global tests_passed
    result = database_test_products()  
    try:
        assert result == expected_product, f"Expected {expected_product}, but got {result}"
    except AssertionError as e:
        print("FAILED\n")
        return
    
    print("PASSED\n")
    tests_passed += 1

def test_database_menus():
    global tests_passed
    result = database_test_menus()  
    try:
        assert result == expected_menu, f"Expected {expected_product}, but got {result}"
    except AssertionError as e:
        print("FAILED\n")
        return
    
    print("PASSED\n")
    tests_passed += 1

def test_database_toppings():
    global tests_passed
    result = database_test_toppings()  
    try:
        assert result == expected_topping, f"Expected {expected_product}, but got {result}"
    except AssertionError as e:
        print("FAILED\n")
        return
    
    print("PASSED\n")
    tests_passed += 1

def test_database_topping_type():
    global tests_passed
    result = database_test_topping_type()  
    try:
        assert result == expected_topping_type, f"Expected {expected_product}, but got {result}"
    except AssertionError as e:
        print("FAILED\n")
        return
    
    print("PASSED\n")
    tests_passed += 1

def test_database_product_type():
    global tests_passed
    result = database_test_product_type()  
    try:
        assert result == expected_product_type, f"Expected {expected_product}, but got {result}"
    except AssertionError as e:
        print("FAILED\n")
        return
    
    print("PASSED\n")
    tests_passed += 1

if __name__ == "__main__":
    print("Running tests in 5 seconds...")
    sleep(5)
    test_database_products()
    test_database_menus()
    test_database_toppings()
    test_database_topping_type()
    test_database_product_type()
    print(f"{tests_passed}/{test_amount} tests passed")
