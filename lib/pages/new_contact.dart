
import 'dart:io';

import 'package:contact_manager1/main.dart';
import 'package:contact_manager1/models/contact_model.dart';
import 'package:contact_manager1/provider/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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
  Gender? gender ;
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
              Column(
            children: [
              Card(
                elevation: 5.0,
                child: _imagePath ==null? const Icon(
                    Icons.person ,size: 100.0,
                ): Image.file(
                  File(_imagePath!),
                  width: 100 ,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                      onPressed: (){
                        _getImage(ImageSource.camera) ;
                      },
                      icon: const Icon(Icons.camera),
                      label: const Text('Capture'),
                  ),
                  OutlinedButton.icon(
                    onPressed: (){
                      _getImage(ImageSource.camera) ;
                    },
                    icon: const Icon(Icons.browse_gallery),
                    label: const Text('Gallery'),
                  ),
                ],
              ),
          ],
        ),
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
              Text(_selectedDate== null?
              'No date Choosen' : getFormattedDate(_selectedDate!)!),
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
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              value: _group,
              hint: const Text('Select Group'),
                isExpanded: true,
                items:groups.map((group)=>DropdownMenuItem<String>(
                  value: group,
                  child: Text(group),
                )).toList(),
                onChanged: (value){
                    setState(() {
                      _group = value ;
                    });
                },
                validator:(value){
                if (value == null || value.isEmpty){
                  return'please select a group';
                }
          }
            ),

      ),
    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Select Gender'),
              ),

              Row(
                children: [

                  Radio<Gender>(
                      value: Gender.Male,
                      groupValue: gender ,
                      onChanged: (value){
                        setState(() {
                          gender = value!;
                        });
                      }
                  ),
                  Text(Gender.Male.name),

                  Radio<Gender>(
                      value: Gender.Female,
                      groupValue: gender ,
                      onChanged: (value){
                        setState(() {
                          gender = value!;
                        });
                      }
                  ),
                  Text(Gender.Female.name),

                  Radio<Gender>(
                      value: Gender.Others,
                      groupValue: gender ,
                      onChanged: (value){
                        setState(() {
                          gender = value!;
                        });
                      }
                  ),
      Text(Gender.Others.name)
                ],
              ),
    ],
    ),
    ),
    );
  }

  void save() {
    if(gender == null ){
      showMsg(context, 'Please select your Gender');
      return ;
    }
    if(_formKey.currentState!.validate()){
        final contact = ContactModel(
            name: _nameController.text,
            mobile: _mobileController.text,
            email: _emailController.text,
            address: _addressController.text,
            website: _webController.text.isEmpty? null:_webController.text,
            group: _group!,
            gender: gender!.name,
            image: _imagePath,
            dob: getFormattedDate(_selectedDate)
        );
        context.read<ContactProvider>().addContact(contact)
            .then((value) {
              showMsg(context, 'saved');
              Navigator.pop(context);
        })
            .catchError((error){
              showMsg(context, error.toString());

        });
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

  Future<void> _getImage (ImageSource source) async {
    final xFile = await ImagePicker().pickImage(source:  source);
    if(xFile!=null){
      setState(() {
        _imagePath = xFile.path;
      });
    }
  }
}
