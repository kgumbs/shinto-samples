import pytest
from helloworld.helloworld import app as flask_app

def test_index_route():
    client=flask_app.test_client()
    response=client().get('/')

    assert response.status_code == 200
    assert response.data.decode('utf-8') == 'Hello, World!'