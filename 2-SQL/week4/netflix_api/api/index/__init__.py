from flask import Blueprint

api = Blueprint("api", __name__, static_folder="static", static_url_path="/",
                template_folder="templates")

from . import api_routes
