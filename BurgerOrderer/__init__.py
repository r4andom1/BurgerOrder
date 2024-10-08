from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from .config import Config  # Import the configuration class

db = SQLAlchemy()

def create_app(config_class=Config):  # Use Config as default
    app = Flask(__name__)
    
    # Load the configuration from the provided config class
    app.config.from_object(config_class)
    
    db.init_app(app)  # Initialize the db with the app

    # Add your routes and other initializations here
    with app.app_context():
        # Import routes here to avoid circular imports
        from . import routes  # Adjust based on where your routes are defined

    return app
