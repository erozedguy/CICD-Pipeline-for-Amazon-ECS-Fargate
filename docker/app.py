from flask import Flask
import socket

app = Flask(__name__)

@app.route('/')
def hello_world():
    host_name = socket.gethostname()
    host_ip = socket.gethostbyname(host_name)

    return f'Hello, from Flask in a Docker container! -----> Private IP: {host_ip} | Hostname: {host_name}'


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')