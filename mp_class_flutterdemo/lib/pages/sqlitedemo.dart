import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import '../components/screens/entryform.dart';
import '../components/widgets/dialogs.dart';
import '../components/widgets/layouts.dart';
import '../components/models/sqlitedata.dart';
import '../components/helpers/sqlitedbhelper.dart';



class ContactView extends StatefulWidget {
  @override
  ContactViewState createState() => ContactViewState();
}

class ContactViewState extends State<ContactView>{ 
  // with AutomaticKeepAliveClientMixin<ContactView>{
  late int _count;
 
  final DbHelper _dbHelper = DbHelper();
  late List<Contact> _contactList; 

  // @override
  // bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _updateListView();
    _contactList = <Contact>[];
  } 

  void _updateListView() {
    final Future<Database> _dbFuture = _dbHelper.initDb();
    _dbFuture.then((database) {
      Future<List<Contact>> _contactListFuture = _dbHelper.getContactList();
      _contactListFuture.then((contactList) {
        setState(() {
          _contactList = contactList;
          _count = contactList.length;
        });
      });
    });
  }

  void _addContact(Contact object) async {
    int _result = await _dbHelper.insert(object);
    if (_result > 0) {
      _updateListView();
    }
  }

  void _editContact(Contact object) async {
    int _result = await _dbHelper.update(object);
    if (_result > 0) {
      _updateListView();
    }
  }

  void _deleteContact(Contact object) async {
    int _result = await _dbHelper.delete(object.id!);
    if (_result > 0) {
      _updateListView();
    }
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return Scaffold(
      body: _buildListView(),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.add),
        tooltip: 'Add new contact',
        backgroundColor: Color.fromRGBO(133, 23, 26, 1.0),
        onPressed: () async {
          var contact = await navigateToEntryForm(context, null);
          if (contact != null) _addContact(contact);
        },
      ),
    );
  }

  Future<Contact?> navigateToEntryForm(BuildContext context, Contact? contact) async {
    contact ??= Contact('', '', '', '');
    var result = await Navigator.push(context,
      MaterialPageRoute(builder: (context) => EntryForm(contact!)) 
    );
    return result;
  }

  Widget _buildListView() {
    _count = (_contactList.isNotEmpty) ? _contactList.length : 0;
    return ListView.builder(
      itemCount: _count,
      itemBuilder: (context, index) {
        String name = _contactList[index].fname.isNotEmpty 
                    ? _contactList[index].fname
                    : _contactList[index].lname;
        return Card(
          color: Color.fromRGBO(254, 243, 172, 1.0),
          shadowColor: Color.fromRGBO(234, 144, 45, 1.0),
          elevation: 5.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromRGBO(133, 23, 26, 1.0),
              child: Icon(Icons.people, color: Color.fromRGBO(254, 243, 172, 1.0)),
            ),
            title: Text(name, 
              style: Theme.of(context).textTheme.subtitle1),
            subtitle: Text(_contactList[index].phone),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.delete_rounded, 
                    color: Color.fromRGBO(234, 144, 45, 1.0)),
                  onPressed: () async {
                    final ConfirmDelete? del = await confirmDeleteDialog(context);
                    if (del == ConfirmDelete.Delete) {
                      _deleteContact(_contactList[index]);
                    }
                  }   
                ),
              ],
            ),
            onTap: () async {
              final DetailEdit? detail = await 
                    showDetailDialog(context, _buildDetailView(context, index));
              if (detail == DetailEdit.Edit) {
                var contact = await navigateToEntryForm(context, _contactList[index]);
                if (contact != null) _editContact(contact);
              } else if (detail == DetailEdit.Delete) {
                final ConfirmDelete? del = await confirmDeleteDialog(context);
                if (del == ConfirmDelete.Delete) {
                  _deleteContact(_contactList[index]);
                }              
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildDetailView(BuildContext context, int index){
    String _fullName = _contactList[index].fname + ' ' + _contactList[index].lname;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 75.0,
          backgroundColor: Color.fromRGBO(234, 144, 45, 1.0),
          // child: Icon(CupertinoIcons.person_alt_circle, size: 150,),
          backgroundImage: AssetImage('assets/images/circle_profile.png'),
        ),
        SizedBox(height: 25.0),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(_fullName,
            style: TextStyle(
              fontSize: 25.0, 
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(133, 23, 26, 1.0),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        buildCardDetail(context, _contactList[index].phone, Icons.phone),
        buildCardDetail(context, _contactList[index].email, Icons.email),
      ],
    );
  }
}