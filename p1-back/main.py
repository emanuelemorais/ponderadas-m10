from flask import Flask, request, jsonify
import sqlite3
import jwt
from flask_swagger_ui import get_swaggerui_blueprint
from functools import wraps

SWAGGER_URL = "/documentation"
API_URL = "/static/swagger.json"

SWAGGER_BLUEPRINT = get_swaggerui_blueprint(
    SWAGGER_URL,
    API_URL,
    config={
        'app_name': 'To-Do API Sync'
    }
)

app = Flask(__name__)

app.register_blueprint(SWAGGER_BLUEPRINT, url_prefix=SWAGGER_URL)

app.config['SECRET_KEY'] = 'secret'

def auth(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        token = request.headers.get('Authorization')
        if not token:
            return jsonify({'message': 'Token is missing!'}), 401
        try:
            data = jwt.decode(token.split()[1], app.config['SECRET_KEY'], algorithms=['HS256'])
        except:
            return jsonify({'message': 'Token is invalid!'}), 401

        return f(*args, **kwargs)

    return decorated

@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    username = data.get('username')
    password = data.get('password')

    if not username or not password:
        return jsonify({'message': 'Username and Password are required!'}), 401

    con = sqlite3.connect("./database/sqlite.db")
    cur = con.cursor()

    cur.execute("SELECT * FROM users WHERE username = ? AND password = ?", (username, password))
    user = cur.fetchone()

    if user:
        token = jwt.encode({'username': username}, app.config['SECRET_KEY'], algorithm='HS256')
        return jsonify({'token': token})

    return jsonify({'message': 'Invalid Username or Password!'}), 401

@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    username = data.get('username')
    password = data.get('password')
    if not username or not password:
        return jsonify({'message': 'Username and Password are required!'}), 400
    con = sqlite3.connect("./database/sqlite.db")
    cur = con.cursor()
    cur.execute("INSERT INTO users (username, password) VALUES (?, ?)", (username, password))
    con.commit()

    return jsonify({"status": "success"})

@app.route('/allTasks', methods=['GET'])
@auth
def retrieveTasks():
    con = sqlite3.connect("./database/sqlite.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM tasks")
    tasks = cur.fetchall()
    return jsonify({"tasks": tasks})


@app.route('/createTask', methods=['POST'])
@auth
def createTask():
    con = sqlite3.connect("./database/sqlite.db")
    cur = con.cursor()
    data = request.get_json()
    title = data['title']
    description = data['description']
    cur.execute("INSERT INTO tasks (title, description) VALUES (?, ?)", (title, description))
    con.commit()
    return "success"

@app.route('/removeTask', methods=['DELETE'])
@auth
def removeTask():
    con = sqlite3.connect("./database/sqlite.db")
    cur = con.cursor()
    id = request.args.get('id')
    cur.execute("DELETE FROM tasks WHERE id = ?", (id))
    con.commit()
    return "success"

@app.route('/updateTask', methods=['PUT'])
@auth
def modifyTask():
    con = sqlite3.connect("./database/sqlite.db")
    cur = con.cursor()
    data = request.get_json()
    id = data['id']
    title = data['title']
    description = data['description']
    cur.execute("UPDATE tasks SET description = ?, title = ? WHERE id = ?", (description, title, id))
    con.commit()
    return "success"

if __name__ == '__main__':
    app.run(debug=True, port=3000, host="0.0.0.0")
