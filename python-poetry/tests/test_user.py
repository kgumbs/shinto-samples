from helloworld.model import User

def test_user():
    user = User("foo")
    assert user.name == "foo"
    assert user.name_upper == "FOO"
