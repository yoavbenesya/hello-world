import os

from flask import Flask, jsonify

APP_VERSION = os.getenv("APP_VERSION", "0.0.0-dev")

app = Flask(__name__)


@app.get("/")
def hello():
    return jsonify(message="Hello, World!", version=APP_VERSION)


@app.get("/version")
def version():
    return jsonify(version=APP_VERSION)


@app.get("/health")
def health():
    return jsonify(status="ok")
