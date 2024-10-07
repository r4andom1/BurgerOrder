def test_home(client):
    response = client.get("/")
    assert b"<title>Welcome to Four Guys</title>" in response.data