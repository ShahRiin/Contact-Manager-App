import 'package:contact_manager1/db/db_helper.dart';
import 'package:contact_manager1/models/contact_model.dart';
import 'package:flutter/foundation.dart';

class ContactProvider with ChangeNotifier{
  List<ContactModel>_contactList =[];
  List<ContactModel>get contactList => _contactList;
final _db= DbHelper();
  Future<void>addContact(ContactModel contact)async{
    final rowId = await _db.insertContact(contact);
    contact.id = rowId ;
    _contactList.add(contact);
    notifyListeners();
  }
   getAllContacts()async{
    _contactList = await _db.getAllContacts();
    notifyListeners();
  }
}