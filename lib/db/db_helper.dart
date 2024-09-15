import 'package:contact_manager1/models/contact_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'as path;

class DbHelper {
  final createTableContact = '''create table $tableContact(
  $tblContactColId integer primary key autoincrement,
  $tblContactColName text,
  $tblContactColEmail text,
  $tblContactColMobile text,
  $tblContactColAddress text,
  $tblContactColDob text,
  $tblContactColGender text,
  $tblContactColImage text,
  $tblContactColWebsite text,
  $tblContactColFavourite integer ,
  $tblContactColGroup text 
  )''';

  Future<Database> _open() async {
    final rootPath = await getDatabasesPath();
    final dbPath = path.join(rootPath, 'contact.db');
    return openDatabase(dbPath, version: 1, onCreate: (db, version) async {
      try {
        await db.execute(createTableContact);
      }
      catch (e) {
        print('Eroor creating table $e ');
      }
    },
    );
  }

  Future<int> insertContact(ContactModel contact) async {
    final db = await _open();
    return db.insert(tableContact, contact.toMap());
  }

  Future<List <ContactModel>> getAllContacts() async {
    final db = await _open();
    final mapList = await db.query(tableContact ,
        orderBy: tblContactColName
    );
    return List.generate(
        mapList.length, (index) => ContactModel.fromMap(mapList[index]));
  }

}





class ContactProvider with ChangeNotifier {
  List<ContactModel> _contactList = [];

  List<ContactModel> get contactList => _contactList;
  final _db = DbHelper();

  Future<void> initializeDatabase() async {
    await _db._open();
  }

  Future<int> addContact(ContactModel contact) {
    return _db.insertContact(contact);
  }

}

