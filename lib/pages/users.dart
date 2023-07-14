import 'package:flutter/material.dart';
import 'dart:math';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  Color maincolor = Color.fromARGB(255, 217, 14, 0);
  final List<User> _users =
      List<User>.generate(100, (index) => generateRandomUser());

  static User generateRandomUser() {
    final random = Random();
    final businessName = 'Business ${random.nextInt(100)}';
    final name = 'User ${random.nextInt(100)}';
    final email = 'user${random.nextInt(100)}@example.com';
    final coins = random.nextInt(100);
    final dateOfSpin =
        DateTime.now().subtract(Duration(days: random.nextInt(30)));
    final userType = UserType.values[random.nextInt(UserType.values.length)];
    return User(businessName, name, email, coins, dateOfSpin, userType);
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
                  header: Text('Users'),
                  columns: [
                    DataColumn(
                        label: Text(
                      'BUSINESS NAME',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    DataColumn(
                        label: Text('NAME',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('EMAIL',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('COINS',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('DATE OF SPIN',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('SUBSCRIPTION',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('ACTION',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  source: _UserDataSource(_users, context),
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
  final String businessName;
  final String name;
  final String email;
  final int coins;
  final DateTime dateOfSpin;
  final UserType userType;

  User(this.businessName, this.name, this.email, this.coins, this.dateOfSpin,
      this.userType);
}

class _UserDataSource extends DataTableSource {
  final List<User> _users;
  Color maincolor = Color.fromARGB(255, 217, 14, 0);
  final BuildContext context;
  _UserDataSource(this._users, this.context);

  @override
  DataRow getRow(int index) {
    final user = _users[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(user.businessName)),
        DataCell(Text(user.name)),
        DataCell(Text(user.email)),
        DataCell(Text(user.coins.toString())),
        DataCell(Text(user.dateOfSpin.toString())),
        DataCell(Text(user.userType.toString().split('.').last)),
        DataCell(Row(
          children: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.email, color: maincolor)),
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
