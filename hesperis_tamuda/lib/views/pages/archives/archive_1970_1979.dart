import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/models/api_response.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/errorPage.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/loginScreen.dart';
import 'package:hesperis_tamuda/views/pages/pdf_reader.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:hesperis_tamuda/views/pages/user/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Archive19701979 extends StatefulWidget {
  const Archive19701979({Key? key}) : super(key: key);

  @override
  State<Archive19701979> createState() => _Archive19701979State();
}

class _Archive19701979State extends State<Archive19701979> {
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
          title: Text(
            "Hespéris Tamuda (1970-1979)",
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
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ],
          onTap: _onItemTapped,
        ),
        body: orientation == Orientation.portrait
            ? GridView.count(
                primary: false,
                padding: const EdgeInsets.all(22),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: (200 / 350),
                children: <Widget>[
                  Container(
                    height: height / 2.5,
                    decoration: decoration,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hesperis-Tamuda 1970.pdf';
                            final file = await PDFApi.loadNetwork(url);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PDFViewerPage(file: file, fileUrl: url)),
                            );
                          },
                          child: Column(children: [
                            const Text(
                              "Hespéris Tamuda",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              height: height * 0.305,
                              image: const AssetImage("assets/images/1972.png"),
                            ),
                            const Text(
                              "1970\n",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 2.5,
                    decoration: decoration,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hesperis-Tamuda 1971.pdf';
                            final file = await PDFApi.loadNetwork(url);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PDFViewerPage(file: file, fileUrl: url)),
                            );
                          },
                          child: Column(children: [
                            const Text(
                              "Hespéris Tamuda",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              height: height * 0.305,
                              image: const AssetImage("assets/images/1971.png"),
                            ),
                            const Text(
                              "1971\n",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: decoration,
                    height: height / 2.5,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hesperis-Tamuda 1972.pdf';
                            final file = await PDFApi.loadNetwork(url);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PDFViewerPage(file: file, fileUrl: url)),
                            );
                          },
                          child: Column(children: [
                            const Text(
                              "Hespéris Tamuda",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              height: height * 0.305,
                              image: const AssetImage("assets/images/1972.png"),
                            ),
                            const Text(
                              "1972\n",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 2.5,
                    decoration: decoration,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hespéris-Tamuda 1973.pdf';
                            final file = await PDFApi.loadNetwork(url);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PDFViewerPage(file: file, fileUrl: url)),
                            );
                          },
                          child: Column(children: [
                            const Text(
                              "Hespéris Tamuda",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              height: height * 0.305,
                              image: const AssetImage("assets/images/1972.png"),
                            ),
                            const Text(
                              "1973\n",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 2.5,
                    decoration: decoration,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hespéris-Tamuda 1974.pdf';
                            final file = await PDFApi.loadNetwork(url);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PDFViewerPage(file: file, fileUrl: url)),
                            );
                          },
                          child: Column(children: [
                            const Text(
                              "Hespéris Tamuda",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              height: height * 0.305,
                              image: const AssetImage("assets/images/1974.png"),
                            ),
                            const Text(
                              "1974\n",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 2.5,
                    decoration: decoration,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hespéris-Tamuda 1975.pdf';
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
                              image: AssetImage("assets/images/1975.png"),
                            ),
                            Text(
                              "1975",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 2.5,
                    decoration: decoration,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hespéris-Tamuda 1976-1977.pdf';
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
                              image: AssetImage("assets/images/1976-77.png"),
                            ),
                            Text(
                              "1976-77",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 2.5,
                    decoration: decoration,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hespéris-Tamuda 1978_1979.pdf';
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
                              image: AssetImage("assets/images/1978-79.png"),
                            ),
                            Text(
                              "1978-79",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : GridView.count(
                primary: false,
                padding: const EdgeInsets.all(22),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: (200 / 357),
                children: <Widget>[
                  Container(
                    height: height / 2.5,
                    decoration: decoration,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hesperis-Tamuda 1970.pdf';
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
                              image: AssetImage("assets/images/1972.png"),
                            ),
                            Text(
                              "1970\n",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 2.5,
                    decoration: decoration,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hesperis-Tamuda 1971.pdf';
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
                              image: AssetImage("assets/images/1971.png"),
                            ),
                            Text(
                              "1971\n",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: decoration,
                    height: height / 2.5,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hesperis-Tamuda 1972.pdf';
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
                              image: AssetImage("assets/images/1972.png"),
                            ),
                            Text(
                              "1972\n",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 2.5,
                    decoration: decoration,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hespéris-Tamuda 1973.pdf';
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
                              image: AssetImage("assets/images/1972.png"),
                            ),
                            Text(
                              "1973\n",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 2.5,
                    decoration: decoration,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hespéris-Tamuda 1974.pdf';
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
                              image: AssetImage("assets/images/1974.png"),
                            ),
                            Text(
                              "1974\n",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 2.5,
                    decoration: decoration,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hespéris-Tamuda 1975.pdf';
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
                              image: AssetImage("assets/images/1975.png"),
                            ),
                            Text(
                              "1975",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 2.5,
                    decoration: decoration,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hespéris-Tamuda 1976-1977.pdf';
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
                              image: AssetImage("assets/images/1976-77.png"),
                            ),
                            Text(
                              "1976-77",
                              textAlign: TextAlign.center,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 2.5,
                    decoration: decoration,
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
                                'https://hesperis-tamuda.com/Downloads/1970-1979/Hespéris-Tamuda 1978_1979.pdf';
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
                              image: AssetImage("assets/images/1978-79.png"),
                            ),
                            Text(
                              "1978-79",
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
