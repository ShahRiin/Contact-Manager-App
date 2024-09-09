
import 'package:flutter/material.dart';

import 'new_contact.dart';


class ContactHome extends StatelessWidget {
  static const String routeName ='/';
  const ContactHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, NewContactPage.routeName),
        child: const Icon(Icons.add),
      ),
    );
  }
}
