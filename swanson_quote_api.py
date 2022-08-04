#! /usr/bin/env python

"""
Simple API Requests Application for Demonstration and Learning Purposes
Author: Barry Weiss <barweiss@cisco.com>
"""

__author__ = "Barry Weiss"
__author_email__ = "barweiss@cisco.com"
__copyright__ = "Copyright (c) 2022 Cisco System, Inc."
__license__ = "MIT"

from requests import get
import json

URL = "https://ron-swanson-quotes.herokuapp.com/v2/quotes"

def swanson_quote():
    '''
    Simple Swanson Quote Api

    https://github.com/jamesseanwright/ron-swanson-quotes
    :returns: A Ron Swanson Quote.
    '''
    response = get(URL)
    quote = (json.loads(response.text))
    return quote[0]

if __name__ == "__main__":
    print(swanson_quote())
