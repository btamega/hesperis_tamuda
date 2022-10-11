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
import 'package:hesperis_tamuda/views/pages/user/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Archive19901999 extends StatefulWidget {
  const Archive19901999({Key? key}) : super(key: key);

  @override
  State<Archive19901999> createState() => _Archive19901999State();
}

class _Archive19901999State extends State<Archive19901999> {
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
            "Hespéris Tamuda (1990-1999)",
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
          childAspectRatio: (200 / 350),
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
                          'https://hesperis-tamuda.com/Downloads/1990-1999/Hespéris-Tamuda 1990.pdf';
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
                        image: AssetImage("assets/images/1990.png"),
                      ),
                      Text(
                        "1990\n",
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
                          'https://hesperis-tamuda.com/Downloads/1990-1999/Hespéris-Tamuda 1991.pdf';
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
                        image: AssetImage("assets/images/1991.jpg"),
                      ),
                      Text(
                        "1991\n",
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
                          'https://hesperis-tamuda.com/Downloads/1990-1999/Hespéris-Tamuda 1992.pdf';
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
                        image: AssetImage("assets/images/1992.png"),
                      ),
                      Text(
                        "1992\n",
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
                          'https://hesperis-tamuda.com/Downloads/1990-1999/Hespéris-Tamuda 1993.pdf';
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
                        image: AssetImage("assets/images/1993.png"),
                      ),
                      Text(
                        "1993\n",
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
                          'https://hesperis-tamuda.com/Downloads/1990-1999/Hespéris-Tamuda 1994.pdf';
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
                        image: AssetImage("assets/images/1994.png"),
                      ),
                      Text(
                        "1994\n",
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
                          'https://hesperis-tamuda.com/Downloads/1990-1999/Hespéris-Tamuda 1995.pdf';
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
                        image: AssetImage("assets/images/1995.png"),
                      ),
                      Text(
                        "1995",
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
                          'https://hesperis-tamuda.com/Downloads/1990-1999/Hespéris-Tamuda 1996.pdf';
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
                        image: AssetImage("assets/images/1996.png"),
                      ),
                      Text(
                        "1996",
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
                          'https://hesperis-tamuda.com/Downloads/1990-1999/Hespéris Tamuda 1997.pdf';
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
                        image: AssetImage("assets/images/1997.png"),
                      ),
                      Text(
                        "1997",
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
                          'https://hesperis-tamuda.com/Downloads/1990-1999/Hesperis-Tamuda 1998.pdf';
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
                        image: AssetImage("assets/images/1998.png"),
                      ),
                      Text(
                        "1998",
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
                          'https://hesperis-tamuda.com/Downloads/1990-1999/Hesperis-Tamuda 1999.pdf';
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
                        image: AssetImage("assets/images/1999.png"),
                        fit: BoxFit.fill,
                      ),
                      Text(
                        "1999",
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
                : UserDashboard(
                    user: user,
                  ),
          ));
        }
      } on SocketException catch (_) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        ));
      }
    }
  }
}
