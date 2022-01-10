// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../components/widgets/forms.dart';
// import '../components/widgets/layouts.dart';



class FirebaseRTDemo extends StatefulWidget {
  @override
  State<FirebaseRTDemo> createState() => _FirebaseRTDemoState();
}

class _FirebaseRTDemoState extends State<FirebaseRTDemo> {
  final dbRef = FirebaseDatabase.instance.ref("users");
  // final bool _active = false;

  late String _id;
  late String _name;
  late String _desc;
  // late String _result;

  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();

  void _createData() {
    dbRef
      .child(_id).set({
        'id' : _id,
        'name': _name, 
        'description': _desc,
      });
  }

  Future<void> _readData() async {
    dbRef.once();
    DatabaseEvent event = await dbRef.once();
    // var keys = event.snapshot.value;
    // print(dbRef.key);
    print(event.snapshot.value);  
    //  var values = snapshot.value;

    //  for (var key in keys) {
    //    print(values[key])
    //  };
    //});
  }

  void _updateData() {
    dbRef
      .child(_id)
      .update({
        'id' : _id,
        'name': _name, 
        'description': _desc,
      });
  }

  void _deleteData() {
    dbRef
      .child(_id).remove();
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
    // _readData();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildElevatedButtons('Create', _createData, _size.width/5),
                    _buildElevatedButtons('Read', _readData, _size.width/5),
                    _buildElevatedButtons('Update', _updateData, _size.width/5),
                    _buildElevatedButtons('Delete', _deleteData, _size.width/5),
                  ],
                ),
              ),
              // addVerticalSpace(10.0),
              Flexible(
                child: Column(
                  children: [
                    buildTextFormField(_idController, TextInputType.text, 
                        'ID', '', Icons.perm_identity, isPrefix: true),
                    buildTextFormField(_nameController, TextInputType.text, 
                        'Fullname', '', Icons.person, isPrefix: true, 
                        caps: TextCapitalization.words),
                    buildTextFormField(_descController, TextInputType.text, 
                        'Description', '', Icons.work, isPrefix: true, 
                        caps: TextCapitalization.sentences),
                  ],
                ),
              ),
            ],
          ),
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
          elevation: 5.0,
          shadowColor: Color.fromRGBO(234, 144, 45, 1.0),
          primary: Color.fromRGBO(133, 23, 26, 1.0),
          textStyle: TextStyle(color: Color.fromRGBO(254, 243, 172, 1.0),
            fontWeight: FontWeight.bold),
        ),
        child: Text(_label),
        onPressed: () { 
          _onPress();
          _clearTextFields();
        },
      ),
    );
  }
}
