from flask import Flask, request, jsonify
import sqlite3
import jwt
from flask_swagger_ui import get_swaggerui_blueprint

SWAGGER_URL = "/documentation"
API_URL = "/static/swagger.json"

SWAGGER_BLUEPRINT = get_swaggerui_blueprint(
    SWAGGER_URL,
    API_URL,
    config={
        'app_name': 'To-Do API'
    }
)

app = Flask(__name__)

app.register_blueprint(SWAGGER_BLUEPRINT, url_prefix=SWAGGER_URL)


@app.route('/allTasks', methods=['GET'])
def retrieveTasks():
    con = sqlite3.connect("./database/sqlite.db")
    cur = con.cursor()
    cur.execute("SELECT * FROM tasks")
    tasks = cur.fetchall()
    return jsonify({"tasks": tasks})


@app.route('/createTask', methods=['POST'])
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
def removeTask():
    con = sqlite3.connect("./database/sqlite.db")
    cur = con.cursor()
    id = request.args.get('id')
    cur.execute("DELETE FROM tasks WHERE id = ?", (id))
    con.commit()
    return "success"

@app.route('/updateTask', methods=['PUT'])
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
    app.run(debug=True, port=5000)
