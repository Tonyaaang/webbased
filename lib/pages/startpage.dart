import 'dart:math';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:banner_listtile/banner_listtile.dart';
import 'package:flat_banners/flat_banners.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Color maincolor = Color.fromARGB(255, 217, 14, 0);
  final List<User> _users =
      List<User>.generate(100, (index) => generateRandomUser());

  static User generateRandomUser() {
    final random = Random();
    final businessName = 'Business ${random.nextInt(100)}';
    final name = 'User ${random.nextInt(100)}';
    final email = 'user${random.nextInt(100)}@example.com';
    final totalproducts = random.nextInt(100);

    return User(businessName, name, email, totalproducts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  SizedBox(
                    width: 290,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            maincolor,
                            Color.fromARGB(255, 247, 138, 138),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.people,
                              color: Colors.white,
                              size: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  Text(
                                    '32',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'TOTAL USERS',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 290,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            maincolor,
                            Color.fromARGB(255, 247, 138, 138),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.production_quantity_limits,
                              color: Colors.white,
                              size: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  Text(
                                    '155',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'TOTAL PRODUCTS',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 290,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(5),
                  //       gradient: LinearGradient(
                  //         begin: Alignment.topLeft,
                  //         end: Alignment.bottomRight,
                  //         colors: [
                  //           maincolor,
                  //           Color.fromARGB(255, 247, 138, 138),
                  //         ],
                  //       ),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.5),
                  //           spreadRadius: 4,
                  //           blurRadius: 5,
                  //           offset: Offset(0, 3), // changes position of shadow
                  //         ),
                  //       ],
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Icon(
                  //             Icons.money,
                  //             color: Colors.white,
                  //             size: 80,
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.only(right: 20),
                  //             child: Column(
                  //               children: [
                  //                 Text(
                  //                   '₱121,231.50',
                  //                   style: TextStyle(
                  //                       fontSize: 30,
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Colors.white),
                  //                 ),
                  //                 Text(
                  //                   'TOTAL REVENUE',
                  //                   style: TextStyle(color: Colors.white),
                  //                 )
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: 290,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            maincolor,
                            Color.fromARGB(255, 247, 138, 138),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.emoji_people_outlined,
                              color: Colors.white,
                              size: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  Text(
                                    '51',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'TOTAL INDIVIDUAL',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 290,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            maincolor,
                            Color.fromARGB(255, 247, 138, 138),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.people_outline_rounded,
                              color: Colors.white,
                              size: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  Text(
                                    '32',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'TOTAL STANDARD',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 290,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            maincolor,
                            Color.fromARGB(255, 247, 138, 138),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.nature_people_outlined,
                              color: Colors.white,
                              size: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  Text(
                                    '12',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'TOTAL BUSINESS',
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: SizedBox(
          //     width: double.infinity,
          //     child: BannerListTile(
          //       backgroundColor: Colors.blue,
          //       borderRadius: BorderRadius.circular(8),
          //       bannerPosition: BannerPosition.topRight,
          //       bannerText: 'Top 1',
          //       imageContainer: Image(
          //           image: NetworkImage(
          //               "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb1.2.1&auto=format&fit=crop&w=387&q=80"),
          //           fit: BoxFit.cover),
          //       title: Text(
          //         "Lisa",
          //         style: TextStyle(fontSize: 24, color: Colors.white),
          //         overflow: TextOverflow.ellipsis,
          //         maxLines: 1,
          //       ),
          //       subtitle: Text("A model from NY",
          //           style: TextStyle(fontSize: 13, color: Colors.white)),
          //       trailing: IconButton(
          //           onPressed: () {},
          //           icon: Icon(
          //             Icons.delete_forever,
          //             color: Colors.red,
          //           )),
          //     ),
          //   ),
          // ),
          // ScrollConfiguration(
          //   behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
          //     PointerDeviceKind.touch,
          //     PointerDeviceKind.mouse,
          //   }),
          //   child: BannerCarousel(
          //     animation: true,
          //     viewportFraction: 0.60,
          //     showIndicator: true,
          //     initialPage: 1,
          //     width: MediaQuery.of(context).size.width,
          //     customizedBanners: [
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: SizedBox(
          //           height: 200,
          //           width: MediaQuery.of(context).size.width * 0.8,
          //           child: Container(
          //             decoration: BoxDecoration(
          //               image: DecorationImage(
          //                   image: NetworkImage(
          //                       'https://t4.ftcdn.net/jpg/05/18/24/77/240_F_518247727_KqFlizvGhHMMfIVYp610OgFib3NYug8T.jpg'),
          //                   fit: BoxFit.cover),
          //               borderRadius: BorderRadius.circular(5),
          //               gradient: LinearGradient(
          //                 begin: Alignment.topLeft,
          //                 end: Alignment.bottomRight,
          //                 colors: [
          //                   maincolor,
          //                   Color.fromARGB(255, 247, 138, 138),
          //                 ],
          //               ),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.grey.withOpacity(0.5),
          //                   spreadRadius: 4,
          //                   blurRadius: 5,
          //                   offset: Offset(0, 3), // changes position of shadow
          //                 ),
          //               ],
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Center(
          //                   child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                     children: [
          //                       Text(
          //                         'Longsilog',
          //                         style: TextStyle(
          //                           color: Colors.white,
          //                           fontSize: 40,
          //                           fontWeight: FontWeight.bold,
          //                           shadows: [
          //                             Shadow(
          //                               color: Colors.black.withOpacity(0.8),
          //                               blurRadius: 3,
          //                               offset: Offset(2, 2),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                       Text(
          //                         'Rank 2 Product from Store 2',
          //                         style: TextStyle(
          //                           color: Colors.white,
          //                           shadows: [
          //                             Shadow(
          //                               color: Colors.black.withOpacity(0.8),
          //                               blurRadius: 3,
          //                               offset: Offset(2, 2),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                       Container(
          //                           decoration: BoxDecoration(
          //                               borderRadius: BorderRadius.circular(10),
          //                               color: Colors.red),
          //                           child: Padding(
          //                             padding: const EdgeInsets.symmetric(
          //                                 vertical: 8.0, horizontal: 16),
          //                             child: Text(
          //                               'Top 2',
          //                               style: TextStyle(
          //                                   color: Colors.white,
          //                                   fontSize: 20,
          //                                   fontWeight: FontWeight.bold),
          //                             ),
          //                           )),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: SizedBox(
          //           height: 200,
          //           width: MediaQuery.of(context).size.width * 0.8,
          //           child: Container(
          //             decoration: BoxDecoration(
          //               image: DecorationImage(
          //                   image: NetworkImage(
          //                       'https://t4.ftcdn.net/jpg/05/35/11/11/240_F_535111197_JW7zWAg3EnSw8z2rgwzXRaDFRdDiYNrq.jpg'),
          //                   fit: BoxFit.cover),
          //               borderRadius: BorderRadius.circular(5),
          //               gradient: LinearGradient(
          //                 begin: Alignment.topLeft,
          //                 end: Alignment.bottomRight,
          //                 colors: [
          //                   maincolor,
          //                   Color.fromARGB(255, 247, 138, 138),
          //                 ],
          //               ),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.grey.withOpacity(0.5),
          //                   spreadRadius: 4,
          //                   blurRadius: 5,
          //                   offset: Offset(0, 3), // changes position of shadow
          //                 ),
          //               ],
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Center(
          //                   child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                     children: [
          //                       Text(
          //                         'Tapsilog',
          //                         style: TextStyle(
          //                           color: Colors.white,
          //                           fontSize: 40,
          //                           fontWeight: FontWeight.bold,
          //                           shadows: [
          //                             Shadow(
          //                               color: Colors.black.withOpacity(0.8),
          //                               blurRadius: 3,
          //                               offset: Offset(2, 2),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                       Text(
          //                         'Rank 1 Product from Store 1',
          //                         style: TextStyle(
          //                           color: Colors.white,
          //                           shadows: [
          //                             Shadow(
          //                               color: Colors.black.withOpacity(0.8),
          //                               blurRadius: 3,
          //                               offset: Offset(2, 2),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                       Container(
          //                           decoration: BoxDecoration(
          //                               borderRadius: BorderRadius.circular(10),
          //                               color: Colors.red),
          //                           child: Padding(
          //                             padding: const EdgeInsets.symmetric(
          //                                 vertical: 8.0, horizontal: 16),
          //                             child: Text(
          //                               'Top 1',
          //                               style: TextStyle(
          //                                   color: Colors.white,
          //                                   fontSize: 20,
          //                                   fontWeight: FontWeight.bold),
          //                             ),
          //                           )),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: SizedBox(
          //           height: 200,
          //           width: MediaQuery.of(context).size.width * 0.8,
          //           child: Container(
          //             decoration: BoxDecoration(
          //               image: DecorationImage(
          //                   image: NetworkImage(
          //                       'https://t4.ftcdn.net/jpg/05/35/11/11/240_F_535111198_p9PZZqrovQxmi8SXC6GcrfV4iz4cd19X.jpg'),
          //                   fit: BoxFit.cover),
          //               borderRadius: BorderRadius.circular(5),
          //               gradient: LinearGradient(
          //                 begin: Alignment.topLeft,
          //                 end: Alignment.bottomRight,
          //                 colors: [
          //                   maincolor,
          //                   Color.fromARGB(255, 247, 138, 138),
          //                 ],
          //               ),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.grey.withOpacity(0.5),
          //                   spreadRadius: 4,
          //                   blurRadius: 5,
          //                   offset: Offset(0, 3), // changes position of shadow
          //                 ),
          //               ],
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Center(
          //                   child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                     children: [
          //                       Text(
          //                         'Hotsilog',
          //                         style: TextStyle(
          //                           color: Colors.white,
          //                           fontSize: 40,
          //                           fontWeight: FontWeight.bold,
          //                           shadows: [
          //                             Shadow(
          //                               color: Colors.black.withOpacity(0.8),
          //                               blurRadius: 3,
          //                               offset: Offset(2, 2),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                       Text(
          //                         'Rank 3 Product from Store 3',
          //                         style: TextStyle(
          //                           color: Colors.white,
          //                           shadows: [
          //                             Shadow(
          //                               color: Colors.black.withOpacity(0.8),
          //                               blurRadius: 3,
          //                               offset: Offset(2, 2),
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //                       Container(
          //                           decoration: BoxDecoration(
          //                               borderRadius: BorderRadius.circular(10),
          //                               color: Colors.red),
          //                           child: Padding(
          //                             padding: const EdgeInsets.symmetric(
          //                                 vertical: 8.0, horizontal: 16),
          //                             child: Text(
          //                               'Top 3',
          //                               style: TextStyle(
          //                                   color: Colors.white,
          //                                   fontSize: 20,
          //                                   fontWeight: FontWeight.bold),
          //                             ),
          //                           )),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              }),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://t4.ftcdn.net/jpg/05/35/11/11/240_F_535111197_JW7zWAg3EnSw8z2rgwzXRaDFRdDiYNrq.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              maincolor,
                              Color.fromARGB(255, 247, 138, 138),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 4,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Tapsilog',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(0.8),
                                          blurRadius: 3,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Rank 1 Product from Store 1',
                                    style: TextStyle(
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(0.8),
                                          blurRadius: 3,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.red),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 16),
                                        child: Text(
                                          'Top 1',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://t4.ftcdn.net/jpg/05/18/24/77/240_F_518247727_KqFlizvGhHMMfIVYp610OgFib3NYug8T.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              maincolor,
                              Color.fromARGB(255, 247, 138, 138),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 4,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Longsilog',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(0.8),
                                          blurRadius: 3,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Rank 2 Product from Store 2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(0.8),
                                          blurRadius: 3,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.red),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 16),
                                        child: Text(
                                          'Top 2',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://t4.ftcdn.net/jpg/05/35/11/11/240_F_535111198_p9PZZqrovQxmi8SXC6GcrfV4iz4cd19X.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              maincolor,
                              Color.fromARGB(255, 247, 138, 138),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 4,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Hotsilog',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(0.8),
                                          blurRadius: 3,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Rank 3 Product from Store 3',
                                    style: TextStyle(
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(0.8),
                                          blurRadius: 3,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.red),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 16),
                                        child: Text(
                                          'Top 3',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 900,
            width: double.infinity,
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
                    label: Text('TOTAL PRODUCTS',
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              source: _UserDataSource(_users, context),
              rowsPerPage: 10, // Number of rows to display per page
            ),
          ),
        ]),
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
  final int totalproducts;

  User(
    this.businessName,
    this.name,
    this.email,
    this.totalproducts,
  );
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
        DataCell(Text(
          user.totalproducts.toString(),
          textAlign: TextAlign.center,
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
