import pytest
from helloworld import app as flask_app

@pytest.fixture
def app():
    yield flask_app

@pytest.fixture
def client(app):
    return app.test_client()

def test_index_route():
    response = client().get('/')

    assert response.status_code == 200
    assert response.data.decode('utf-8') == 'Hello, World!'