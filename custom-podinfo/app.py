from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route('/', methods=['GET'])
def index():
    pod_name = os.environ.get('POD_NAME', 'Unknown')
    pod_ip = os.environ.get('POD_IP', 'Unknown')
    return jsonify({
        'Pod Name': pod_name,
        'Pod IP': pod_ip
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
