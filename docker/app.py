from flask import Flask
import flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    ip_adress = flask.request.remote_addr
    return f'Hello, from Flask in a Docker container! -----> Private IP: {ip_adress}'


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')