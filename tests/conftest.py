import pytest
from BurgerOrderer import create_app, db
from BurgerOrderer.config import __init__ 

@pytest.fixture(scope="module")
def test_app():
    """Fixture for creating the Flask app with the TestingConfig"""
    app = create_app(__init__)
    with app.app_context():
        yield app

@pytest.fixture(scope="module")
def test_database(test_app):
    """Fixture for setting up the test database"""
    db.create_all()  # Create tables
    yield db
    db.session.remove()
    db.drop_all()  # Clean up after test
