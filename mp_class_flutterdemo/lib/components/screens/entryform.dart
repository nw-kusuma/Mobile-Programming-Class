// ignore_for_file: unnecessary_null_comparison 
// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:mp_class_flutterdemo/components/models/contacts.dart';
import 'package:mp_class_flutterdemo/components/widgets/dialogs.dart';
import 'package:mp_class_flutterdemo/components/widgets/layouts.dart';



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
  Widget build(BuildContext context) {
    if (contact.id != null) {
      _fnameController.text = contact.fname;
      _lnameController.text = contact.lname;
      _phoneController.text = contact.phone;
      // photoController.text = contact.photo;
      _emailController.text = contact.email;
    }
    final _verticalPadding = EdgeInsets.only(top:20.0, bottom:20.0);
    return Scaffold(
      appBar: AppBar(
        title: contact == null ? Text('Add Contact') : Text('Update Contact'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
        child: ListView(
          children: <Widget>[
            buildTextFormField(context, _fnameController, 
              TextInputType.text, 'Firstname', '', Icons.person, 
              autoFocus: true, caps: TextCapitalization.words),
            buildTextFormField(context, _lnameController, 
              TextInputType.text, 'Lastname', '', Icons.person, 
              caps: TextCapitalization.words),
            buildTextFormField(context, _phoneController, 
              TextInputType.phone, 'Phone', '+62 xxx xxxxxx', Icons.phone),
            buildTextFormField(context, _emailController, 
              TextInputType.emailAddress, 'Email', 'name@example.com', Icons.email),
            Padding (
              padding: _verticalPadding,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColorDark,
                        textStyle: TextStyle(color: Theme.of(context).primaryColorLight),
                      ),                      
                      child: Text('Save', textScaleFactor: 1.5),
                      onPressed: () => _onSave(context),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColorDark,
                        textStyle: TextStyle(color: Theme.of(context).primaryColorLight)),                      
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
    );
  }
}