// ignore_for_file: unnecessary_getters_setters

class Contact {
  int? _id;
  String _fname = '';
  String _lname = '';
  String _phone = '';
  // String _photo;
  String _email = '';

  Contact(
    this._fname, 
    this._lname, 
    this._phone, 
    // this._photo,
    this._email, 
  );

  Contact.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _fname = map['fname'];
    _lname = map['lname'];
    _phone = map['phone'];
    // _photo = map['photo'];
    _email = map['email'];
  }

  int? get id => _id;
  String get fname => _fname;
  String get lname => _lname;
  String get phone => _phone;
  // String get photo => _photo;
  String get email => _email;

  set fname(String value) => _fname = value;
  set lname(String value) => _lname = value;
  set phone(String value) => _phone = value;
  // set photo(String value) => _photo = value;
  set email(String value) => _email = value;
  
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = _id;
    map['fname'] = _fname;
    map['lname'] = _lname;
    map['phone'] = _phone;
    // map['photo'] = _photo;
    map['email'] = _email;
    return map;
  }  
}