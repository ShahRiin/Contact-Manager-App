


import 'package:contact_manager1/main.dart';
import 'package:contact_manager1/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import 'new_contact.dart';


class ContactHome extends StatelessWidget {
  static const String routeName ='/';
  const ContactHome({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ContactProvider>().getAllContacts();
    return Scaffold(
      appBar: AppBar(title: Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, NewContactPage.routeName),
        child: const Icon(Icons.add),
      ),
      body: Consumer<ContactProvider>(
          builder: (context , provider , child)=>ListView.builder(
            itemCount: provider.contactList.length,
              itemBuilder: (context , index){
              final contact = provider.contactList[index];
              return ListTile(
                title: Text(contact.name),
              );
              },
          )
      ),
    );
  }
}

