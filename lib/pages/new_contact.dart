
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/helper_function.dart';

class NewContactPage extends StatefulWidget {
  static const String routeName ='/new';
  const NewContactPage({super.key});

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addressController = TextEditingController();
  final _webController = TextEditingController();
  DateTime? _selectedDate;
  String? _group;
  String? _imagePath;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Contact'),
        actions: [
          IconButton(onPressed: save, icon: Icon(Icons.save)),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 4.0,
            ),
            children: [
        Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Contact Name(required)',
            prefixIcon: Icon(Icons.person),
          ),
          validator: (value){
            if(value ==null || value.isEmpty ){
              return 'Please provide a contact name';
            }
            return null;

          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: TextFormField(
          controller: _mobileController,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Mobile Number(required)',
            prefixIcon: Icon(Icons.call),
          ),
          validator: (value){
            if(value ==null || value.isEmpty ){
              return 'Please provide a mobile number';
            }
            return null;

          },

        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email Address (required)',
            prefixIcon: Icon(Icons.email),
          ),
          validator: (value){
            if(value ==null || value.isEmpty ){
              return 'Please provide an email';
            }
            return null;

          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: TextFormField(
          controller: _addressController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: ' Address(required)',
            prefixIcon: Icon(Icons.location_on),
          ),
          validator: (value){
            if(value ==null || value.isEmpty ){
              return 'Please provide a street Address';
            }
            return null;

          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: TextFormField(
          controller: _webController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'web address',
            prefixIcon: Icon(Icons.web),
          ),
          validator: (value){
            return null;
          },
        ),
      ),

      Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: _selectDateOfBirth,
                child: const Text('Select Date Of Birth'),
              ),
              Text(_selectedDate== null? 'No date Choosen' : getFormattedDate(_selectedDate!)),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 5.0,
      ),
      Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),

      ),
    )


    ],
    ),
    ),
    );
  }

  void save() {
    if(_formKey.currentState!.validate()){

    }
  }

  void _selectDateOfBirth() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if(date!=null){
      setState(() {
        _selectedDate = date;
      });
    }
  }
}
