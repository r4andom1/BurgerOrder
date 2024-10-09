# test_app.py
import unittest
from app import app

class FlaskAppTests(unittest.TestCase):

    def client_test(self):
        self.app = app.test_client()
        self.app.testing = True

    def test_home_page(self):
        response = self.app.get('/')
        print(response)


if __name__ == '__main__':
    unittest.main()
