import 'package:flutter/material.dart';
import '../../components/export_widgets.dart';

class FirebaseDBPage 
  extends StatefulWidget {

  @override
  _FirebaseDBPageState createState() 
      => _FirebaseDBPageState();
}

class _FirebaseDBPageState 
  extends State<FirebaseDBPage> {
  final _dbRef = FirebaseDatabase.instance.ref('Students');
  
  late String _id;
  late String _name;
  late String _email;

  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: buildAppBar("Firebase Real-Time DB"),
        body: buildBodyBackground(size, 1, 11, 40, false, 
        topChild: Container(height: 0), 
        bottomChild: Padding(
          padding: EdgeInsets.only(left:25.0, right: 25.0, top: 25.0, bottom: 5.0),
          child: Column(
            children: <Widget>[
              Expanded(flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildElevatedButtons('Create', size.width/5, onPress: _createData),
                    _buildElevatedButtons('Read', size.width/5, onPress: _readData),
                    _buildElevatedButtons('Update', size.width/5, onPress: _updateData),
                    _buildElevatedButtons('Delete', size.width/5, onPress: _deleteData),
                  ],
                ),
              ),
              Expanded(flex: 9,
                child: Column(
                  children: [
                    buildTextFormField(_idController, TextInputType.text, Colors.white,
                        'Student ID', Icons.perm_identity, isPrefix: true),
                    buildTextFormField(_nameController, TextInputType.text, Colors.white,
                        'Fullname', Icons.person, isPrefix: true, 
                        caps: TextCapitalization.words),
                    buildTextFormField(_emailController, TextInputType.text, Colors.white,
                        'Email', Icons.email, isPrefix: true),
                    // buildTextFormField(_scoreController, TextInputType.text, 
                    //     'score', '', Icons.score, isPrefix: true, 
                    //     caps: TextCapitalization.sentences),
                  ],
                ),
              ),
              Align(
                child: Image.asset("assets/images/Logo_UB_Tengah.png",
                  width: size.width * 0.90,
              ),),
            ],
          ),
        )),
      ),
    );
  }

  // create/add/insert data from textfields to database
  void _createData() {
    _id = _idController.text;
    _name = _nameController.text;
    _email = _emailController.text;

    _dbRef.child(_id).set({
        'name': _name, 
        'email': _email,
      });
    _clearTextFields();
  }

  // get/read data from database based on id textfield
  Future<void> _readData() async {
    _id = _idController.text;
    final datas = await _dbRef.child(_id).get();
    _nameController.text = datas.child('name').value.toString();
    _emailController.text = datas.child('email').value.toString();
    _unfocusTextFields();
  }

  // update/edit data in database with textfields values
  void _updateData() {
    _id = _idController.text;
    _name = _nameController.text;
    _email = _emailController.text;

    _dbRef.child(_id)
      .update({
        'name': _name, 
        'email': _email,
      });
    _clearTextFields();
  }

  // delete data in database based on id textfield
  void _deleteData() {
    _id = _idController.text;
    _dbRef.child(_id).remove();
    _clearTextFields();
  }

  void _clearTextFields(){
    _idController.clear();
    _nameController.clear();
    _emailController.clear();

    _unfocusTextFields();
  }

  void _unfocusTextFields() {
    FocusScopeNode _currentFocus = FocusScope.of(context);
    if (!_currentFocus.hasPrimaryFocus) {
      _currentFocus.unfocus();
    }
  }
 
  Widget _buildElevatedButtons(
    String _label, 
    double _width,
   {required Function() onPress}
  ){
    return Padding(
      padding: EdgeInsets.only(bottom: 7.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(_width, 40),
          elevation: 5.0,
          shadowColor: kPrimaryColor,
          primary: kPrimaryLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.5),
        ),),
        child: Text(_label, 
          style: TextStyle(
            color: kPrimaryDark,
            fontWeight: FontWeight.w700,
        ),),
        onPressed: onPress,
      ),
    );
  }  
}