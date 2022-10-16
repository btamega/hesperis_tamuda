import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/models/api_response.dart';
import 'package:hesperis_tamuda/models/statut.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/errorPage.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/loginScreen.dart';
import 'package:hesperis_tamuda/views/pages/pdf_reader.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:hesperis_tamuda/views/pages/user/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Archive20002009 extends StatefulWidget {
  const Archive20002009({Key? key}) : super(key: key);

  @override
  State<Archive20002009> createState() => _Archive20002009State();
}

class _Archive20002009State extends State<Archive20002009> {
  int _selectedIndex = 0;
  final User user = User(
      id: 1,
      name: "KANNOUFA",
      email: "fkannoufa@gmail.com",
      emailVerifiedAt: "emailVerifiedAt",
      createdAt: DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(
            "Hespéris Tamuda (2000-2009)",
            style: GoogleFonts.ibarraRealNova(),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff3b5998),
          actions: const [LanguagePickerWidget()],
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          onTap: _onItemTapped,
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(22),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: (200 / 357),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                      const url =
                          'https://hesperis-tamuda.com/Downloads/2000-2009/1-2001.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PDFViewerPage(file: file, fileUrl: url)),
                      );
                    },
                    child: Column(children: const [
                      Text(
                        "Hespéris Tamuda",
                        textAlign: TextAlign.center,
                      ),
                      Image(
                        image: AssetImage("assets/images/2001-1.png"),
                      ),
                      Text(
                        "2001-1",
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                      const url =
                          'https://hesperis-tamuda.com/Downloads/2000-2009/2-2001.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PDFViewerPage(file: file, fileUrl: url)),
                      );
                    },
                    child: Column(children: const [
                      Text(
                        "Hespéris Tamuda",
                        textAlign: TextAlign.center,
                      ),
                      Image(
                        image: AssetImage("assets/images/2001-2.png"),
                      ),
                      Text(
                        "2001-2",
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              padding: const EdgeInsets.all(13),
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                      const url =
                          'https://hesperis-tamuda.com/Downloads/2000-2009/Hespéris Tamuda 2007.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PDFViewerPage(file: file, fileUrl: url)),
                      );
                    },
                    child: Column(children: const [
                      Text(
                        "Hespéris Tamuda",
                        textAlign: TextAlign.center,
                      ),
                      Image(
                        image: AssetImage("assets/images/2001-2.png"),
                      ),
                      Text(
                        "2007",
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                      const url =
                          'https://hesperis-tamuda.com/Downloads/2000-2009/Hespéris Tamuda 2008.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PDFViewerPage(file: file, fileUrl: url)),
                      );
                    },
                    child: Column(children: const [
                      Text(
                        "Hespéris Tamuda",
                        textAlign: TextAlign.center,
                      ),
                      Image(
                        image: AssetImage("assets/images/2001-1.png"),
                      ),
                      Text(
                        "2008",
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                      const url =
                          'https://hesperis-tamuda.com/Downloads/2000-2009/Hespéris-Tamuda 2009.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PDFViewerPage(file: file, fileUrl: url)),
                      );
                    },
                    child: Column(children: const [
                      Text(
                        "Hespéris Tamuda",
                        textAlign: TextAlign.center,
                      ),
                      Image(
                        image: AssetImage("assets/images/2001-2.png"),
                      ),
                      Text(
                        "2009",
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
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
