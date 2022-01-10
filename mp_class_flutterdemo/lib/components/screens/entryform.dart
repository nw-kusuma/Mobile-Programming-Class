// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

import '../models/sqlitedata.dart';
import '../widgets/dialogs.dart';
import '../widgets/forms.dart';



class EntryForm extends StatefulWidget {
  final Contact contact;
  EntryForm(this.contact);

  @override
  EntryFormState createState() => EntryFormState(contact);
}

class EntryFormState extends State<EntryForm> {
  Contact contact;
  EntryFormState(this.contact);

  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _phoneController = TextEditingController();  
  // TextEditingController photoController = TextEditingController();  
  final _emailController = TextEditingController();  

  bool _isEmpty() {
    if ((_fnameController.text.isEmpty && 
         _lnameController.text.isEmpty)|| 
         _phoneController.text.isEmpty || 
         _emailController.text.isEmpty) 
    {
      return true;
    } 
    return false;
  }
  
  void _onSave(BuildContext context) {
    if (contact.id == null) {
      contact = Contact(
        _fnameController.text, 
        _lnameController.text, 
        _phoneController.text,
        // photoController.text
        _emailController.text,
      );
    } else {
      contact.fname = _fnameController.text;
      contact.lname = _lnameController.text;
      contact.phone = _phoneController.text;
      // contact.photo = photoController.text;
      contact.email = _emailController.text;
    } 

    _isEmpty() ? showEmptyAlert(context) 
               : Navigator.pop(context, contact);
  }

  @override
  void initState() {
    super.initState();

    if (contact.id != null) {
      _fnameController.text = contact.fname;
      _lnameController.text = contact.lname;
      _phoneController.text = contact.phone;
      // photoController.text = contact.photo;
      _emailController.text = contact.email;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final _verticalPadding = EdgeInsets.only(top:20.0, bottom:20.0);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(133, 23, 26, 1.0),
          title: contact.id == null ? Text('Add Contact') : Text('Update Contact'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
          child: ListView(
            children: <Widget>[
              buildTextFormField(_fnameController, TextInputType.text, 
                  'Firstname', '', Icons.person, caps: TextCapitalization.words, 
                  autoFocus: true),
              buildTextFormField(_lnameController, TextInputType.text, 
                  'Lastname', '', Icons.person, caps: TextCapitalization.words),
              buildTextFormField(_phoneController, TextInputType.phone, 
                  'Phone', '+62 xxx xxxxxx', Icons.phone),
              buildTextFormField(_emailController, TextInputType.emailAddress, 
                  'Email', 'name@example.com', Icons.email),
              Padding (
                padding: _verticalPadding,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          shadowColor: Color.fromRGBO(234, 144, 45, 1.0),
                          primary: Color.fromRGBO(133, 23, 26, 1.0),
                          textStyle: TextStyle(color: Color.fromRGBO(254, 243, 172, 1.0)),
                        ),                      
                        child: Text('Save', textScaleFactor: 1.5),
                        onPressed: () => _onSave(context),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          shadowColor: Color.fromRGBO(234, 144, 45, 1.0),
                          primary: Color.fromRGBO(133, 23, 26, 1.0),
                          textStyle: TextStyle(color: Color.fromRGBO(254, 243, 172, 1.0)),
                        ),
                        child: Text('Cancel', textScaleFactor: 1.5),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}