
import 'package:contact_manager1/pages/contact_details_page.dart';
import 'package:contact_manager1/pages/contact_home.dart';
import 'package:contact_manager1/pages/new_contact.dart';
import 'package:contact_manager1/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=>ContactProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: ContactHome.routeName,
      routes: {
        ContactHome.routeName:(context)=> const ContactHome(),
        NewContactPage.routeName:(context)=> const NewContactPage(),
        DetailsPage.routeName:(context)=> const DetailsPage(),
      },
    );
  }
}

