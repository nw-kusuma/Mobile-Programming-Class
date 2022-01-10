// ignore_for_file: unused_field

import 'dart:io';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../models/sqlitedata.dart';



class DbHelper {
  static DbHelper _dbHelper = DbHelper._createObject();
  static late Database _database;  

  DbHelper._createObject();

  factory DbHelper() {
    return _dbHelper = DbHelper._createObject();
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'contacts.db';
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return todoDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE contact (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          fname TEXT,
          lname TEXT,
          phone TEXT,
          email TEXT)
      ''');
  }

  Future<Database> get database async {
    return _database = await initDb();
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await database;
    var mapList = await db.query('contact', orderBy: 'fname');
    return mapList;
  }

  Future<int> insert(Contact object) async {
    Database db = await database;
    int count = await db.insert('contact', object.toMap());
    return count;
  }

  Future<int> update(Contact object) async {
    Database db = await database;
    int count = await db.update('contact', object.toMap(), 
                                where: 'id=?',
                                whereArgs: [object.id]);
    return count;
  }

  Future<int> delete(int id) async {
    Database db = await database;
    int count = await db.delete('contact', 
                                where: 'id=?', 
                                whereArgs: [id]);
    return count;
  }
  
  Future<List<Contact>> getContactList() async {
    var contactMapList = await select();
    int count = contactMapList.length;
    List<Contact> contactList = <Contact>[];
    for (int i=0; i<count; i++) {
      contactList.add(Contact.fromMap(contactMapList[i]));
    }
    return contactList;
  }
}