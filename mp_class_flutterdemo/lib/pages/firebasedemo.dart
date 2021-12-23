import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../components/widgets/layouts.dart';



class FirebaseRTDemo extends StatefulWidget {
  @override
  State<FirebaseRTDemo> createState() => _FirebaseRTDemoState();
}

class _FirebaseRTDemoState extends State<FirebaseRTDemo> {
  final databaseReference = FirebaseDatabase.instance.ref();
  // final bool _active = false;

  late String _id;
  late String _name;
  late String _desc;
  // late String _result;

  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();

  void _createData() {
    // _id = _idController.text;
    databaseReference
      .child('users/$_id').set({
        'name': _name, 
        'description': _desc,
      });
  }

  void _readData() {
    //databaseReference.once().then((DataSnapshot snapshot) {
    //print('Data : ${snapshot.value}');
    //});
  }

  void _updateData() {
    // _id = _idController.text;
    databaseReference
      .child('users/$_id')
      .update({
        'name': _name, 
        'description': _desc,
      });
  }

  void _deleteData() {
    // _id = _idController.text;
    databaseReference
      .child('users/$_id').remove();
  }

  void _clearTextFields() {
    _idController.clear();
    _nameController.clear();
    _descController.clear();
    
    FocusScopeNode _currentFocus = FocusScope.of(context);
    if (!_currentFocus.hasPrimaryFocus) {
      _currentFocus.unfocus();
    }
  }

  // @override
  // void initState() {
  //   Firebase.initializeApp().whenComplete(() { 
  //     // print("completed");
  //     setState(() {});
  //   });    
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    _id = _idController.text;
    _name = _nameController.text;
    _desc = _descController.text;
    _readData();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          buildTextFormField(context, _idController, TextInputType.text, 
                            'ID', '', Icons.perm_identity),
                          buildTextFormField(context, _nameController, TextInputType.text, 
                            'Fullname', '', Icons.person, caps: TextCapitalization.words),
                          buildTextFormField(context, _descController, TextInputType.text, 
                            'Description', '', Icons.work, caps: TextCapitalization.sentences),
                        ],
                      ),
                    ),
                    addHorizontalSpace(5.0),
                    Expanded(
                      // width: size.width * 0.25,
                      child: Column(
                        children: <Widget>[
                          _buildElevatedButtons('Create', _createData, _size.width/5),
                          _buildElevatedButtons('Read', _readData, _size.width/5),
                          _buildElevatedButtons('Update', _updateData, _size.width/5),
                          _buildElevatedButtons('Delete', _deleteData, _size.width/5),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }

  Widget _buildElevatedButtons(
    String _label, 
    Function _onPress,
    double _width,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 7.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(_width, 40),
        ),
        child: Text(_label, style: TextStyle(fontWeight: FontWeight.bold)),
        onPressed: () { 
          _onPress();
          _clearTextFields();
        },
      )
    );
  }
}
