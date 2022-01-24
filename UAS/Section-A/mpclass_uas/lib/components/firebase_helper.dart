import '../export_packages.dart';

class FirebaseDBService{
  final _dbRef = FirebaseDatabase.instance.ref();

  DatabaseReference selectDBPath(_key) {
    return _dbRef.child(_key);
  }

  Future<List<String>> getStudentID(_path) async{
    List<String> studentID = [];
    studentID = await _dbRef.child(_path).get().then((snapshot) {
      for (int i = 0; i < snapshot.children.length; i++) {
        studentID.add(snapshot.children.elementAt(i).key.toString());
      } return studentID;
    });
    return studentID;
  }

  Future<Map<String, String>> getSubject(_path, bool _global) async{
    Map<String, String> subjects = {};
    subjects = await _dbRef.child(_path).get().then((snapshot) {
      for (int i = 0; i < snapshot.children.length; i++) {
        subjects[ snapshot.children.elementAt(i).key.toString() ] = 
        _global ? snapshot.children.elementAt(i).value.toString()
                : snapshot.children.elementAt(i).child('desc').value.toString();
      } return subjects;
    });
    return subjects;
  }

  Future<List<String>> getGrade(_path) async{
    List<String> grades = [];
    grades = await _dbRef.child(_path).get().then((snapshot) {
      for (int i = 0; i < snapshot.children.length; i++) {
        grades.add(snapshot.children.elementAt(i).key.toString());
      } return grades;
    });
    return grades;
  }

  Future<void> createData(_path, _name, _email, _subjects, _subject, _grade) async{
    await _dbRef.child(_path)
    .set({
      'name': _name, 
      'email': _email,
    });    
    await _dbRef.child(_path).child('subject/$_subjects')
    .set({
      'desc' : _subject,
      'grade': _grade,
    });    
  }

  Future<void> updateData(_path, _name, _email, _subjects, _subject, _grade) async{
    await _dbRef.child(_path)
    .update({
      'name': _name, 
      'email': _email,
    });    
    await _dbRef.child(_path).child('subject/$_subjects')
    .update({
      'desc' : _subject,
      'grade': _grade,
    });    
  }

  Future<List<String?>> readData(_path) async {
    final _datas = await _dbRef.child(_path).get();
    var _student =  [ _datas.key, 
                      _datas.child('name').value.toString(), 
                      _datas.child('email').value.toString(), 
                    ];
    return _student;
  }

  Future<List<String?>> readGrade(_path) async {
    final _datas = await _dbRef.child(_path).get();
    var _grade =  [ _datas.key, 
                    _datas.child('desc').value.toString(), 
                    _datas.child('grade').value.toString(), 
                  ];
    return _grade;
  }

  void deleteData(_path) => _dbRef.child(_path).remove(); 


}