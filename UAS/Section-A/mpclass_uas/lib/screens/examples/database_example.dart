import 'package:flutter/material.dart';
import '../../export_packages.dart';
import '../../export_widgets.dart';

class FirebaseDBPage 
  extends StatefulWidget {

  @override
  _FirebaseDBPageState createState() 
      => _FirebaseDBPageState();
}

class _FirebaseDBPageState 
  extends State<FirebaseDBPage> {
  final _dbService = FirebaseDBService();
    
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _gradeController = TextEditingController();

  bool _isCreate = false;
  bool _isRead = false;
  bool _isUpdate = false;
  bool _isDelete = false;

  late String _newId; 
  String _subjectDesc = 'Student ID';
  String _selectedId = 'Student ID';
  String _selectedSubject = 'Class';
  String _selectedGrade = 'Grade';

  Map<String, String> _subjects = {};
  List<String> _studentIDs = [];
  List<String> _grades = [];

  Future<void> _getlist() async{
    _studentIDs = await _dbService.getStudentID('Students');
    _subjects = await _dbService.getSubject('Subjects', true);
    _grades = await _dbService.getGrade('Grades');
    _newId = (_studentIDs.length + 1).toString().padLeft(3, '0');
  }

  @override
  void initState() {
    _getlist();
    super.initState();
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _gradeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      endDrawer: AppDrawer(),
      appBar: AppTopBar(titleText: "Firebase Real-Time DB", showBack: true),
      body: AppBodyBackground(1, 9, 30, false, 
        topChild: Container(height: 0), 
        bottomChild: Padding(
          padding: EdgeInsets.only(left:25.0, right: 25.0, top: 20.0, bottom: 5.0),
          child: Column(
            children: <Widget>[
              Expanded(flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildElevatedButtons('Create', //size.width/5, 
                      onPress: () { 
                        resetTextFormField();
                        setState(() {
                            _isCreate = true; 
                            _isRead = _isUpdate = _isDelete = false;
                        });
                      }),
                    _buildElevatedButtons('Read', //size.width/5, 
                      onPress: () { 
                        _gradeController.clear();
                        resetTextFormField();
                        setState(() {
                            _isRead = true;
                            _isCreate = _isUpdate = _isDelete = false;
                        });
                      }),
                    _buildElevatedButtons('Update', //size.width/5, 
                      onPress: () { 
                        resetTextFormField();
                        setState(() {
                          _isUpdate = true;
                          _isCreate = _isRead = _isDelete = false;
                        });
                      }),
                    _buildElevatedButtons('Delete', //size.width/5, 
                      onPress: () { 
                        resetTextFormField();
                        setState(() {
                            _isDelete = true; 
                            _isCreate = false; _isRead = false; _isUpdate = false;
                        });
                      }),
                  ],
                ),
              ),
              Expanded(flex: 9,
                child: _isCreate  ? _buildCreateForm()
                     : _isRead    ? _buildReadForm()
                     : _isUpdate  ? _buildUpdateForm()
                     : _isDelete  ? _buildDeleteForm()
                     : Container(width: 0.0),
              ),
              Align(
                child: Image.asset("assets/images/Logo_UB_Tengah.png",
                  width: size.width * 0.6,
              )),
            ],
          ),
        ),
      ),
    );
  }

  void resetTextFormField() async{
    _idController.clear();
    _nameController.clear();
    _emailController.clear();
    _gradeController.clear();

    // setState(() {
    //     _selectedId = 'Student ID';
    //     _selectedSubject = 'Class';
    //     _selectedGrade = 'Grade';
    // });
    
    await _getlist();
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
  { required Function() onPress }
  ){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.infinity, 41.4),
        elevation: 3.0,
        shadowColor: kPrimaryColor,
        primary: kPrimaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.5),
      ),),
      child: Text(_label, textScaleFactor: 1.2, 
        style: TextStyle(
          color: kPrimaryDark,
          fontWeight: FontWeight.w700,
      ),),
      onPressed: onPress,
    );
  }  

  Widget _buildCreateForm(){
    _idController.text = _newId;
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTextFormField(_idController, TextInputType.text, 
              'Student ID', CupertinoIcons.person_fill, isReadOnly: true),
          buildTextFormField(_nameController, TextInputType.text, 
              'Fullname', CupertinoIcons.person_alt, caps: TextCapitalization.words),
          buildTextFormField(_emailController, TextInputType.text, 
              'Email', CupertinoIcons.mail_solid),
          buildDropDownFormField('Class', CupertinoIcons.rectangle_dock,
              itemLists: _subjects.entries
                          .map((e) => DropdownMenuItem(
                              child: Text(e.value),
                              value: e.key))
                          .toList(), 
              onValueChanged: (val) => setState(() { 
                _selectedSubject = val!;
                _subjectDesc = _subjects[_selectedSubject].toString();
          })),
          Row(
            children: [
              Expanded(
                child: buildDropDownFormField('Grade', CupertinoIcons.number,
                  itemLists: _grades
                              .map((val) => DropdownMenuItem(
                                  child: Text(val),
                                  value: val))
                              .toList(), 
                  onValueChanged: (val) => setState(() => _selectedGrade = val!)),
              ),
              SizedBox(width: 15.0),
              _buildElevatedButtons('Submit', //size.width/5, 
                onPress: () async {
                  await _dbService.createData('Students/${_idController.text}',
                        _nameController.text,
                        _emailController.text,
                        _selectedSubject,
                        _subjectDesc,
                        _selectedGrade
                  ).whenComplete(() { 
                      showSuccessDialog(context, "Data Added Successfully", 
                            "Student Data:\n\t${_nameController.text}\n\t${_emailController.text}\n\t$_subjectDesc ($_selectedGrade)");
                      resetTextFormField(); 
                      setState(() {
                          _idController.text = _newId;
                          _isCreate = true;
                      });
                  });
              }),
          ],),
      ],),
    );
  }

  Widget _buildReadForm(){
    return SingleChildScrollView(
      child: Column(
        children: [
          buildDropDownFormField('Student ID', CupertinoIcons.person_fill, 
            itemLists: _studentIDs
                        .map((val) => DropdownMenuItem(
                            child: Text(val),
                            value: val))
                        .toList(), 
            onValueChanged: (val) async{ 
              setState(() => _selectedId = val!);
              var _subjectList = await _dbService
                      .getSubject('Students/$_selectedId/subject', false);
              setState(() =>   _subjects = _subjectList);
          }),
          Row(
            children: [
              Expanded(
                child: SizedBox(width: double.infinity),
              ),
              _buildElevatedButtons('Get Data',  
                onPress: () async{
                  var _student = await _dbService.readData('Students/$_selectedId');

                  _nameController.text  = _student[1].toString();
                  _emailController.text = _student[2].toString();
              }),
            ],
          ),
          SizedBox(height: 10.0),
          buildTextFormField(_nameController, TextInputType.text, 
              'Fullname', CupertinoIcons.person_alt, caps: TextCapitalization.words),
          buildTextFormField(_emailController, TextInputType.text, 
              'Email', CupertinoIcons.mail_solid),
          buildDropDownFormField('Class', CupertinoIcons.rectangle_dock,
              itemLists: _subjects.entries
                          .map((e) => DropdownMenuItem(
                              child: Text(e.value),
                              value: e.key))
                          .toList(), 
              onValueChanged: (val) async{ 
                setState(() => _selectedSubject = val!);
                var _grade = await _dbService
                            .readGrade('Students/$_selectedId/subject/$_selectedSubject');
                setState(() => _gradeController.text = _grade[2].toString());
              }),
          buildTextFormField(_gradeController, TextInputType.text, 
              'Grade', CupertinoIcons.number, caps: TextCapitalization.words),
      ],),
    );
  }

  Widget _buildUpdateForm(){
    return SingleChildScrollView(
      child: Column(
        children: [
          buildDropDownFormField('Student ID', CupertinoIcons.person_fill,
              itemLists: _studentIDs
                          .map((val) => DropdownMenuItem(
                              child: Text(val),
                              value: val))
                          .toList(), 
              onValueChanged: (val) async{ 
                setState(() => _selectedId = val!);
                var _student = await _dbService.readData('Students/$_selectedId');
                // var _subjectList = await _dbService
                //               .getSubject('Students/$_selectedId/subject', false);
                // setState(() { 
                    _nameController.text = _student[1].toString();
                    _emailController.text = _student[2].toString();
                    // _subjects = _subjectList;
                // });
              }),
          buildTextFormField(_nameController, TextInputType.text, 
              'Fullname', CupertinoIcons.person_alt, caps: TextCapitalization.words),
          buildTextFormField(_emailController, TextInputType.text, 
              'Email', CupertinoIcons.mail_solid),
          buildDropDownFormField('Class', CupertinoIcons.rectangle_dock, 
              itemLists: _subjects.entries
                          .map((e) => DropdownMenuItem(
                              child: Text(e.value),
                              value: e.key))
                          .toList(), 
              onValueChanged: (val) => setState(() { 
                _selectedSubject = val!;
                _subjectDesc = _subjects[_selectedSubject].toString();
          })),
          Row(
            children: [
              Expanded(
                child: buildDropDownFormField('Grade', CupertinoIcons.number,
                  itemLists: _grades
                              .map((val) => DropdownMenuItem(
                                  child: Text(val),
                                  value: val))
                              .toList(), 
                  onValueChanged: (value) => setState(() => _selectedGrade = value!)),
              ),
              SizedBox(width: 15.0),
              _buildElevatedButtons('Submit', //size.width/5, 
                onPress: () async{
                  await _dbService
                    .updateData('Students/$_selectedId',
                        _nameController.text,
                        _emailController.text,
                        _selectedSubject,
                        _subjectDesc,
                        _selectedGrade
                  ).whenComplete(() { 
                      showSuccessDialog(context, "Data Updated Successfully", 
                            "Student Data:\n\t${_nameController.text}\n\t${_emailController.text}\n\t$_subjectDesc ($_selectedGrade)");
                      resetTextFormField();
                      setState(() => _isUpdate = true);
                  });
              }),
          ],),
      ],),
    );
  }

  Widget _buildDeleteForm(){
    return SingleChildScrollView(
      child: Column(
        children: [
          buildDropDownFormField('Student ID', CupertinoIcons.person_fill,
            itemLists: _studentIDs
                        .map((val) => DropdownMenuItem(
                            child: Text(val),
                            value: val))
                        .toList(), 
            onValueChanged: (val) async{ 
              setState(() => _selectedId = val!);
              var _student = await _dbService.readData('Students/$_selectedId');

              _nameController.text  = _student[1].toString();
              _emailController.text = _student[2].toString();
          }),
          Row(
            children: [
              Expanded(
                child: SizedBox(width: double.infinity),
              ),
              _buildElevatedButtons('Remove Data', //size.width/5, 
                onPress: () async{
                  final ConfirmDelete? del = await confirmDeleteDialog(context);
                  if (del == ConfirmDelete.delete) {
                    _dbService.deleteData('Students/$_selectedId');
                    showSuccessDialog(context, "Data Deleted Successfully", 
                          "Student Data:\n\t${_nameController.text}\n\t${_emailController.text}");
                    resetTextFormField();
                    setState(() => _isDelete = true);
                }}),
          ]),
          SizedBox(height: 10.0),
          buildTextFormField(_nameController, TextInputType.text, 
              'Fullname', CupertinoIcons.person_alt, caps: TextCapitalization.words),
          buildTextFormField(_emailController, TextInputType.text, 
              'Email', CupertinoIcons.mail_solid),
      ]),
    );
  }
}