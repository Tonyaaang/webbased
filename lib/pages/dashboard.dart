import 'package:flutter/material.dart';
import 'package:webbased/pages/startpage.dart';
import 'package:webbased/pages/transaction.dart';
import 'package:webbased/pages/Activation.dart';
import 'package:webbased/pages/users.dart';


class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Color maincolor = Color.fromARGB(255, 217, 14, 0);
  int _selectedIndex = 0;
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TAPSIMAN'),
        backgroundColor: maincolor,
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            selectedLabelTextStyle: TextStyle(color: maincolor),
            onDestinationSelected: _onItemTapped,
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.dashboard,
                    color: Color.fromARGB(255, 217, 14, 0)),
                label: Text('Dashboard'),
              ),
              NavigationRailDestination(
                icon:
                    Icon(Icons.check_circle_outline_sharp, color: Color.fromARGB(255, 217, 14, 0)),
                label: Text('Activation'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.shopping_cart,
                    color: Color.fromARGB(255, 217, 14, 0)),
                label: Text('Products'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people,
                    color: Color.fromARGB(255, 217, 14, 0)),
                label: Text('Users'),
              ),
              // NavigationRailDestination(
              //   icon: Icon(Icons.settings,
              //       color: Color.fromARGB(255, 217, 14, 0)),
              //   label: Text('Settings'),
              // ),
            ],
          ),
          Expanded(
            child: Container(
              child: _buildPageContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent() {
    switch (_selectedIndex) {
      case 0:
        return StartPage();
      case 1:
        return Activation();
      case 2:
        return TransactionPage();
      case 3:
        return Users();

      default:
        return Container();
    }
  }
}
