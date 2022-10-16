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

class Archive19801989 extends StatefulWidget {
  const Archive19801989({Key? key}) : super(key: key);

  @override
  State<Archive19801989> createState() => _Archive19801989State();
}

class _Archive19801989State extends State<Archive19801989> {
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
            "Hespéris Tamuda (1980-1989)",
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
                          'https://hesperis-tamuda.com/Downloads/1980-1989/Hesperis-Tamuda 1980-1981.pdf';
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
                        image: AssetImage("assets/images/1980-81.png"),
                      ),
                      Text(
                        "1980-1981",
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
                          'https://hesperis-tamuda.com/Downloads/1980-1989/Hesperis-Tamuda 1982-1983.pdf';
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
                        image: AssetImage("assets/images/1982-83.png"),
                      ),
                      Text(
                        "1982-1983",
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
                          'https://hesperis-tamuda.com/Downloads/1980-1989/Hesperis-Tamuda 1984.pdf';
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
                        image: AssetImage("assets/images/1982-83.png"),
                      ),
                      Text(
                        "1984",
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
                          'https://hesperis-tamuda.com/Downloads/1980-1989/Hespéris-Tamuda 1985.pdf';
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
                        image: AssetImage("assets/images/1985.png"),
                      ),
                      Text(
                        "1985",
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
                          'https://hesperis-tamuda.com/Downloads/1980-1989/Hespéris-Tamuda 1986.pdf';
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
                        image: AssetImage("assets/images/1986.png"),
                      ),
                      Text(
                        "1986",
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(19),
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
                          'https://hesperis-tamuda.com/Downloads/1980-1989/Hespéris-Tamuda 1987.pdf';
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
                        image: AssetImage("assets/images/1987.png"),
                      ),
                      Text(
                        "1987",
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(19),
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
                          'https://hesperis-tamuda.com/Downloads/1980-1989/Hespéris-Tamuda 1988-1989.pdf';
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
                        image: AssetImage("assets/images/1988-89.png"),
                      ),
                      Text(
                        "1988-1989",
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
