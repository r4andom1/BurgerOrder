@app.route("/burgers")
def burgers():
    """ Burgers test page """
    conn = connect()
    cursor = conn.cursor()
    cursor.execute("SELECT name, description, price FROM toppings")
    toppings = cursor.fetchall()
    cursor.close()
    conn.close()

    html = "<h1>Toppings</h1>\n<ul>\n"

    for topping in toppings:
        html += f"<li><strong>{topping[0]}</strong>: {topping[1]} - {topping[2]}</li>\n"

    html += "</ul>"

    return html