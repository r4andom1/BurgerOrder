import pytest

from BurgerOrderer import app, db

pytest.fixture()
def test_app():
    app = app("sqlite://")

    with app.app_context():
        db.create_all()

    yield app

@pytest.fixture()
def client(app):
    return app.test_client()