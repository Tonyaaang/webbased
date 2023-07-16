import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

List<dynamic> datalist = [];

// Stream<QuerySnapshot> searchResult() {
//   final falseRoomStream = FirebaseFirestore.instance
//       .collection('room-list')
//       .where('id', isEqualTo: 'false')
//       .snapshots();


//   final pendingRoomStream = FirebaseFirestore.instance
//       .collection('room-list')
//       .where('id', isEqualTo: 'pending')
//       .snapshots();


//   // return MergeStream([falseRoomStream, pendingRoomStream]);
// }

class _TransactionPageState extends State<TransactionPage> {
   final currentUser = FirebaseAuth.instance;


  String selected = 'usersSubscription';
  List<String> subscriptionHeader = ['NAME','TYPE', 'STATUS', 'EXPIRY'];
  List<String> topupHeader = ['NAME','DATE', 'TYPE', 'PRICE'];


  List<String> Header = [];
  // String selectedHeader=  'subscription';
  List<dynamic>ids=[];
    List<dynamic>username=[];
   List<Map<dynamic, dynamic>> _datafetch = [];
  Future<void> fetchHistory() async {
    _datafetch=[];
 final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection(selected)
            .get();
  querySnapshot.docs.forEach((doc) {
      // final String productGroup = doc.data()['product_group'];
      final Map<String, dynamic> Data = doc.data();
      setState(() {
        _datafetch.add(Data);
      });
      print('_datafetch: $_datafetch');
    });
  }

  @override
  void initState() {
    super.initState();
    Header = subscriptionHeader;
    // selected = 'subscription';
      // _getIds();
    fetchHistory();
    // _getcoin();
  }


  @override
  Widget build(BuildContext context) {
    // Header.add(subscriptionHeader);
    //  print('username: $username');
     
    print(Header);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 'usersSubscription';
                              Header = subscriptionHeader;


                              fetchHistory();
                            });
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    width: 1.0, color: Colors.deepPurple),
                                left: BorderSide(
                                    width: 1.0, color: Colors.deepPurple),
                                bottom: BorderSide(
                                    width: 1.0, color: Colors.deepPurple),
                              ),
                              color: selected == 'usersSubscription'
                                  ? Color.fromARGB(255, 133, 9,0)
                                  : Colors.white,
                            ),
                            child: Center(
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    'Subscription',
                                    style: TextStyle(
                                        color: selected == 'usersSubscription'
                                            ? Colors.white
                                            : Color.fromARGB(255, 133, 9,0)),
                                  )),
                            ),
                          ),
                        )),
                       
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 'usersTopup';
                              Header = topupHeader;
                              fetchHistory();
                            });
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    width: 1.0, color: Colors.deepPurple),
                                right: BorderSide(
                                    width: 1.0, color: Colors.deepPurple),
                                bottom: BorderSide(
                                    width: 1.0, color: Colors.deepPurple),
                              ),
                              color: selected == 'usersTopup'
                                  ? Color.fromARGB(255, 133, 9,0)
                                  : Colors.white,
                            ),
                            child: Center(
                              child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    'Topup',
                                    style: TextStyle(
                                        color: selected == 'usersTopup'
                                            ? Colors.white
                                            : Color.fromARGB(255, 133, 9,0)),
                                  )),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        color: Colors.grey[200],
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Center(child: Text('${Header[0]}'))),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Center(child: Text('${Header[1]}'))),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Center(child: Text('${Header[2]}'))),
   SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Center(child: Text('${Header[3]}')))
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      // color: Colors.pink,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if (datalist.length == 0)
                              Center(child: Text('No History')),
                            // for (int i = 0; i < datalist.length; i++)
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _datafetch.length,
                                itemBuilder: (context, i) {
                                  Map<dynamic, dynamic> data = _datafetch[i] as Map<dynamic, dynamic>;
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 3,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                             Expanded(
                                              child: Center(
                                                  child: Text(
                                           '${data['name']}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ))),
                                          Expanded(
                                              child: Center(
                                                  child: Text(
                                            selected == 'usersTopup'
                                                ? '${data['datenow']}'
                                                : selected == 'usersSubscription'
                                                    ? '${data['FROM']}'
                                                    : 'Subscribed ${data['FROM']}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ))),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              child: Container(
                                                  color: Colors.green,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20.0,
                                                            bottom: 20,
                                                            left: 8,
                                                            right: 8),
                                                    child: Center(
                                                        child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: Text(
                                                          selected ==
                                                                  'usersTopup'
                                                              ? '${data['FROM']}'
                                                              : selected ==
                                                                      'usersSubscription'
                                                                  ? 'active'
                                                                  : '${data['cost']}',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                    )),
                                                  ))),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              child: Center(
                                                  child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          selected ==
                                                                  'usersTopup'
                                                              ? '${data['cost']}'
                                                              : selected ==
                                                                      'usersSubscription'
                                                                  ? '${data['date']}'
                                                                  : '${data['datenow']}',
                                                        ),
                                                      )))),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: SizedBox(
          //     width: MediaQuery.of(context).size.width,
          //     child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: Colors.pinkAccent,
          //         ),
          //         onPressed: ()
          //             // async
          //             // {
          //             {
          //           Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => TopupList()));
          //           // _launchURL;
          //           // const url = "https://postopup.loca.lt/paymongo?topup=100";
          //           // final Uri _url = Uri.parse(url);


          //           // await launchUrl(_url, mode: LaunchMode.externalApplication);
          //           // Navigator.push(context,
          //           //     MaterialPageRoute(builder: (context) => PaymentLink()));
          //         },
          //         child: Text('TOP-UP')),
          //   ),
          // ),
        ],
      ),
    );
  }
}
