import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/constant.dart';
import 'package:hesperis_tamuda/services/data_service.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/archive_list.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'errorPage.dart';
import 'loginScreen.dart';
import 'user/dashboard_screen.dart';

class RecentArchives extends StatefulWidget {
  const RecentArchives({Key? key}) : super(key: key);

  @override
  State<RecentArchives> createState() => _RecentArchivesState();
}

class _RecentArchivesState extends State<RecentArchives> {
  int _selectedIndex = 0;
  late Orientation orientation;
  late Size size;
  late double height;
  late double width;
  final Decoration decoration = BoxDecoration(
    border: Border.all(
        color: const Color(0xff3b5998), width: 4.0, style: BorderStyle.solid),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(10.0),
      topRight: Radius.circular(10.0),
      bottomLeft: Radius.circular(10.0),
      bottomRight: Radius.circular(10.0),
    ),
    boxShadow: const [
      BoxShadow(
        color: Color(0xff3b5998),
        offset: Offset(
          5.0,
          5.0,
        ),
        blurRadius: 10.0,
        spreadRadius: 2.0,
      ),
      BoxShadow(
        color: Colors.white,
        offset: Offset(0.0, 0.0),
        blurRadius: 0.0,
        spreadRadius: 0.0,
      ),
    ],
  );
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black87,
    backgroundColor: Colors.grey[300],
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text("Hespéris Tamuda"),
          centerTitle: true,
          backgroundColor: const Color(0xff3b5998),
          actions: const [LanguagePickerWidget()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ],
          onTap: _onItemTapped,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await fetchVolume(context);
          },
          child: FutureBuilder<dynamic>(
              future: fetchVolume(context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return orientation == Orientation.portrait
                      ? GridView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: snapshot.data!.data.length,
                          itemBuilder: (context, index1) {
                            return Container(
                              height: height / 2.5,
                              // padding: const EdgeInsets.all(10),
                              decoration: decoration,
                              child: ListView(
                                physics: const ClampingScrollPhysics(),
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ArchiveListe(
                                                  idVolume: snapshot.data!
                                                      .data[index1].idVolume,
                                                  volNom: snapshot.data!
                                                          .data[index1].titre +
                                                      ' ' +
                                                      snapshot
                                                          .data!
                                                          .data[index1]
                                                          .nomVolume,
                                                )),
                                      );
                                    },
                                    child: Column(children: [
                                      Text(
                                        snapshot.data!.data[index1].titre,
                                        textAlign: TextAlign.center,
                                      ),
                                      Image.network(
                                        rootURL +
                                            '/' +
                                            snapshot.data!.data[index1].cover,
                                      ),
                                      Text(
                                        snapshot.data!.data[index1].anne,
                                        textAlign: TextAlign.center,
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: width / (height / 1.25),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(19),
                          scrollDirection: Axis.vertical,
                        )
                      : GridView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: snapshot.data!.data.length,
                          itemBuilder: (context, index1) {
                            return Container(
                              padding: const EdgeInsets.all(19),
                              decoration: decoration,
                              child: ListView(
                                physics: const ClampingScrollPhysics(),
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ArchiveListe(
                                                  idVolume: snapshot.data!
                                                      .data[index1].idVolume,
                                                  volNom: snapshot.data!
                                                          .data[index1].titre +
                                                      ' ' +
                                                      snapshot
                                                          .data!
                                                          .data[index1]
                                                          .nomVolume,
                                                )),
                                      );
                                    },
                                    child: Column(children: [
                                      Text(
                                        snapshot.data!.data[index1].titre,
                                        textAlign: TextAlign.center,
                                      ),
                                      Image.network(
                                        rootURL +
                                            '/' +
                                            snapshot.data!.data[index1].cover,
                                        // // width: 300,
                                        // height: height / 2.7,
                                      ),
                                      Text(
                                        snapshot.data!.data[index1].anne,
                                        textAlign: TextAlign.center,
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: width / (height / 0.32),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3,
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(20),
                          scrollDirection: Axis.vertical,
                        );
                } else if (snapshot.hasError) {
                  double _width = width * .25;
                  if (orientation == Orientation.portrait) {
                    _width = width * .50;
                  }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/animation_500_l8rqndep.gif",
                          width: _width,
                        ),
                        Center(
                          child: Text(
                            snapshot.error.toString(),
                            style: GoogleFonts.ibarraRealNova(
                                textStyle: const TextStyle(fontSize: 25)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                            child: ElevatedButton(
                          style: raisedButtonStyle,
                          onPressed: () async {
                            try {
                              bool result = await InternetConnectionChecker()
                                  .hasConnection;

                              if (result == true) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const RecentArchives(),
                                ));
                              }
                            } on SocketException catch (_) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ErrorPage(),
                              ));
                            }
                          },
                          child: const Text('Actualiser'),
                        )),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }

  Future<void> _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      try {
        final result = await InternetAddress.lookup('www.google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        }
      } on SocketException catch (_) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        ));
      }
    } else if (_selectedIndex == 1) {
      try {
        final result = await InternetAddress.lookup('www.google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SearchPage(),
          ));
        }
      } on SocketException catch (_) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        ));
      }
    } else {
      try {
        final result = await InternetAddress.lookup('www.google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String? email = prefs.getString("email");
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => email == null
                  ? const LoginScreen()
                  : const DashboardScreen()));
        }
      } on SocketException catch (_) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        ));
      }
    }
  }
}
