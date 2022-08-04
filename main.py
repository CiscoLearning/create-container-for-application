#! /usr/bin/env python

"""
Simple Flask Application for Demonstration and Learning Purposes
Author: Barry Weiss <barweiss@cisco.com>
"""

__author__ = "Barry Weiss"
__author_email__ = "barweiss@cisco.com"
__copyright__ = "Copyright (c) 2022 Cisco System, Inc."
__license__ = "MIT"

from flask import Flask, render_template
from swanson_quote_api import swanson_quote

app = Flask(__name__)

@app.route("/", methods=['POST', 'GET'])
def index():
    '''
    A Simple Ron Swanson Quote App to Demo Something Betthern than 'Hello, World!'

    Return: index.html rendor and Ron Quote.
    '''
    quote = swanson_quote()
    return render_template("index.html", quote=quote)

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5000)
