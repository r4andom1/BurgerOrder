from decimal import Decimal
import test
def check_product_description(products_table):
    """Check if the product description contains specific text."""
    # Check if the description contains the expected text
    expected_description = "A perfect looking gluten free burger."
    return expected_description in products_table

# Define the product tuple
products_table_test = (1, 1, "Plantera Burger", "A perfect looking gluten free burger.", Decimal('7.99'), 1, 1)

# Call the function and print the result
result = check_product_description(products_table_test)
print(result)  # This will print True if the description matches