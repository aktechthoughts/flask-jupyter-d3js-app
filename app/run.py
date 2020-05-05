import time
# import redis
import json
from flask import Flask, render_template 

app = Flask(__name__)
# cache = redis.Redis(host='redis', port=6379)


# def get_hit_count():
#     retries = 5
#     while True:
#         try:
#             return cache.incr('hits')
#         except redis.exceptions.ConnectionError as exc:
#             if retries == 0:
#                 raise exc
#             retries -= 1
#             time.sleep(0.5)

@app.route("/bar")
def home():
    return render_template("bar.html")


@app.route("/bardata")
def data():
    jdata = {}
    with open('/app/models/bar.json', 'r') as myfile:
        jdata=myfile.read()    
    return jdata

@app.route('/')
def hello():
    count = get_hit_count()
    return 'Hello World! I have been seen {} times.\n'.format(count)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000, debug=True)

    