import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:emailjs/emailjs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class Activation extends StatefulWidget {
  @override
  
  _ActivationPageState createState() => _ActivationPageState();

}

bool _isSuccess = false;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance;

class _ActivationPageState extends State<Activation> {

   @override
  void initState(){
    super.initState();
    _getUserList();
  }

  Color maincolor = Color.fromARGB(255, 217, 14, 0);
  
  List<List<dynamic>> _UserDetails = [];
  
 Future<void> _getUserList() async{
      final snapshot = await FirebaseFirestore.instance.collection('users').where('userlevel', isEqualTo: 'entrep').get();
      final data = snapshot.docs.map((doc) {
      final id = doc.id;
      final businessname = doc['businessname'] ?? '' as String; 
      final name = doc['name'] ?? '' as String; 
      final email = doc['email'] ?? '' as String;
      final plan = doc['plan'] ?? '' as String;
      final status = doc['status'] ?? '' as String;
      return [businessname,name,email,plan,status,id];  
      }).toList();
      setState(() {
        _UserDetails = data;
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: PaginatedDataTable(
                  header: Text('Entrepreneurs'),
                  columns: [  
                     DataColumn(
                        label: Text('BUSNESS NAME',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('NAME',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('EMAIL',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('PLAN',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('STATUS',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('ACTION',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  source: _UserDataSource(_UserDetails, context),
                  rowsPerPage: 10, // Number of rows to display per page
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


enum UserType {
  INDIVIDUAL,
  STANDARD,
  BUSINESS,
}

class User {

  final String name;
  final String email;
  final String plan;
  final String status;

  User(this.name, this.email, this.plan, this.status);
}

class _UserDataSource extends DataTableSource {

  final List<dynamic> _users;
  Color maincolor = Color.fromARGB(255, 217, 14, 0);
  final BuildContext context;
  _UserDataSource(this._users, this.context);

  @override
  DataRow getRow(int index) {
    final user = _users[index];

    // Timestamp timestamp = user[3];
    // DateTime dateTime = timestamp.toDate();
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(user[0])),
        DataCell(Text(user[1])),
        DataCell(Text(user[2])),
        DataCell(Text(user[3])),
        DataCell(Text(user[4])),
        DataCell(Row(
          children: [
            IconButton(
                onPressed: () {
                  showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Center(
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Color.fromARGB(255, 7, 204, 50),
                                ),
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.check, color: Color.fromARGB(255, 7, 204, 50)),
                            )),
                      ),
                      content: Text(
                        'Are you sure you want to Appprove this user?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Colors
                                        .grey), // Set the background color
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Set the border radius
                                  ),
                                ),
                              ),
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                sendnotif(context,user[0],user[2],user[5]);
                                 Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 7, 204, 50)), // Set the background color
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Set the border radius
                                  ),
                                ),
                              ),
                              child: Text('Approve'),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                );
                  
                  
                }, icon: Icon(Icons.email, color: maincolor)),
            IconButton(
              icon: Icon(
                Icons.delete_forever,
                color: maincolor,
              ),
              onPressed: () {
                // Handle action
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Center(
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: maincolor,
                                ),
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.close, color: maincolor),
                            )),
                      ),
                      content: Text(
                        'Are you sure you want to delete this user?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(Colors
                                        .grey), // Set the background color
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Set the border radius
                                  ),
                                ),
                              ),
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                sendnotif(context, user[0],user[2],user[5]);
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(255, 133, 9,
                                            0)), // Set the background color
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // Set the border radius
                                  ),
                                ),
                              ),
                              child: Text('Delete'),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ],
        )),
      ],
    );
  }

  @override
  int get rowCount => _users.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
  
 
}

Future<void> sendnotif(context, String name,String email,String id) async {
   Map<String, dynamic> templateParams = {
          'to_email': email,
          'to_name' : name,
          'subject': 'Account activated',
        };
        try {
            await EmailJS.send(
              'service_nnhk9dt',
              'template_et2tu1f',
              templateParams,
              const Options(
                publicKey: '2D0ZM8SRsxQD08xKh',
                privateKey: 'hu1U03KjaD2In0RQYQmfj',
              ),
            );
            final snackBar = SnackBar(
                  content: const Text('User account is now active'),
                  backgroundColor: (Colors.black12),
                );
                final CollectionReference updatestatus = FirebaseFirestore.instance.collection('users');
                updatestatus.doc(id).set({'status': "approved"},SetOptions(merge: true));  
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } catch (error) {
            final snackBar = SnackBar(
                  content: Text(error.toString()),
                  backgroundColor: (Colors.black12),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
  }

  setdeleteactive(context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed:  () {
      _isSuccess = false;
     Navigator.of(context).pop();
      },
  );
  Widget continueButton = TextButton(
    child: const Text("Approve"),
    onPressed:  () {
      _isSuccess = true;
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Delete Account?"),
    content: const Text("Are you sure you want to proceed?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

