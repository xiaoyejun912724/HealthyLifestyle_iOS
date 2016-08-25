#!/usr/local/bin/python3

import sqlite3

print('running insert_meridian.py')

path = "../04_database/Acupoint.db"
connect = sqlite3.connect(path)

list = [{"cnname":"手太阴肺经"},
        {"cnname":"手厥阴心包经"},
        {"cnname":"手少阴心经"},
        {"cnname":"手阳明大肠经"},
        {"cnname":"手少阳三焦经"},
        {"cnname":"手太阳小肠经"},
        {"cnname":"足太阴脾经"},
        {"cnname":"足厥阴肝经"},
        {"cnname":"足少阴肾经"},
        {"cnname":"足阳明胃经"},
        {"cnname":"足少阳胆经"},
        {"cnname":"足太阳膀胱经"}]
for data in list:
    sql = 'INSERT INTO "Meridian" ("cnname") VALUES ("' + data["cnname"] + '")'
    connect.execute(sql);
connect.commit();
print("insert table Meridian success")

connect.close();
