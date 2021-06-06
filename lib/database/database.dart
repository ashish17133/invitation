import 'package:flutter/material.dart';
import 'package:invitation/model/people.dart';
import 'package:sqflite/sqflite.dart';

Person person = Person();

class Daaatabase {
  static String tablename = "Person";
  static String tablecol1 = "id";
  static String tablecol2 = "name";
  static String tablecol3 = "address";
  static String tablecol4 = "phone";
  static String tablecol5 = "status";
  static Database db;
  int getVersion() => 1;

  Future<void> initialize() async {
    if (db != null) {
      return;
    }
    try {
      String path = (await getDatabasesPath()) + "todo";
      db = await openDatabase(path, version: getVersion(), onCreate: oncreete);
      print("Database created successfully");
    } catch (e) {
      print("Error in creating database $e");
    }
  }

  static Future<void> oncreete(Database db, int version) async {
    db.execute("CREATE TABLE $tablename("
        "$tablecol1 INT PRIMARY KEY,"
        "$tablecol2 TEXT,"
        "$tablecol3 TEXT,"
        "$tablecol4 TEXT,"
        "$tablecol5 TEXT"
        ")");
  }

  static Future<void> inseert(Person people) async {
    try {
      var intvalue =
          await db.rawQuery("SELECT MAX(id)+1 AS $tablecol1 FROM $tablename");
      var integervalue = intvalue.first[tablecol1];
      print(integervalue);
      db.rawInsert(
          "INSERT INTO $tablename($tablecol1,$tablecol2,$tablecol3,$tablecol4,$tablecol5)"
          "VALUES(?,?,?,?,?)",
          [
            (integervalue == null) ? 1 : integervalue,
            people.name,
            people.address,
            people.number,
            people.status
          ]);
      print("Value entered successfully");
    } catch (e) {
      print("Error occured while inserting $e");
    }
  }

  static Future<void> deletee(String nametodel) async {
    db.rawDelete('DELETE FROM $tablename WHERE $tablecol2=?', [nametodel]);
    print("Data $nametodel successfully deleted");
  }

  static Future<List<Person>> getdata() async {
    var tablevalue = await db.query("$tablename");
    List<Person> people = [];
    for (int i = 0; i <= tablevalue.length - 1; i++) {
      people.add(Person(
          id: tablevalue[i]['$tablecol1'],
          name: tablevalue[i]['$tablecol2'],
          address: tablevalue[i]['$tablecol3'],
          number: tablevalue[i]['$tablecol4'],
          status: tablevalue[i]['$tablecol5']));
    }
    print(people);
    return people;
  }

  static Future<void> update(String originame, String changename,
      String changeaddress, String phonenumber, String changestatus) async {
    await db.rawUpdate(
        "UPDATE $tablename SET $tablecol2=?,$tablecol3=?,$tablecol4=?,$tablecol5=? WHERE $tablecol2=?",
        [changename, changeaddress, phonenumber, changestatus, originame]);
  }
}
