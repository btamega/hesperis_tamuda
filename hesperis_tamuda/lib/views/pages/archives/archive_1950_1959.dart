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

class Archive19501959 extends StatefulWidget {
  const Archive19501959({Key? key}) : super(key: key);

  @override
  State<Archive19501959> createState() => _Archive19501959State();
}

class _Archive19501959State extends State<Archive19501959> {
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
            "Hespéris (1950-1959)",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1950.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              height: height * 0.324,
                              fit: BoxFit.fitWidth,
                              image:
                                  const AssetImage("assets/images/1950ht.jpg"),
                            ),
                            const Text(
                              "1950\n",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1951.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1951ht.png"),
                            ),
                            Text(
                              "1951\n",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1952.pdf';
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
                              "Hespéris ",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1952ht.png"),
                            ),
                            Text(
                              "1952\n",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1953.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1953ht.jpg"),
                            ),
                            Text(
                              "1953\n",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1954.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1954ht.jpg"),
                            ),
                            Text(
                              "1954\n",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1955.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1955ht.png"),
                            ),
                            Text(
                              "1955",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1956.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1956ht.jpg"),
                            ),
                            Text(
                              "1956",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1957.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1957ht.jpg"),
                            ),
                            Text(
                              "1957",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1958.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1958ht.jpg"),
                            ),
                            Text(
                              "1958",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1959.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1959ht.jpg"),
                              fit: BoxFit.fill,
                            ),
                            Text(
                              "1959",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1950.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              height: height * 0.88,
                              image:
                                  const AssetImage("assets/images/1950ht.jpg"),
                            ),
                            const Text(
                              "1950\n",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1951.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1951ht.png"),
                            ),
                            Text(
                              "1951\n",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1952.pdf';
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
                              "Hespéris ",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1952ht.png"),
                            ),
                            Text(
                              "1952\n",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1953.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1953ht.jpg"),
                            ),
                            Text(
                              "1953\n",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1954.pdf';
                            final file = await PDFApi.loadNetwork(url);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PDFViewerPage(file: file, fileUrl: url)),
                            );
                          },
                          child: Column(children: [
                            Text(
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              height: height * 0.9,
                              image: AssetImage("assets/images/1954ht.jpg"),
                            ),
                            Text(
                              "1954\n",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1955.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1955ht.png"),
                            ),
                            Text(
                              "1955",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1956.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1956ht.jpg"),
                            ),
                            Text(
                              "1956",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1957.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1957ht.jpg"),
                            ),
                            Text(
                              "1957",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1958.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1958ht.jpg"),
                            ),
                            Text(
                              "1958",
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
                                'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1959.pdf';
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
                              "Hespéris",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              image: AssetImage("assets/images/1959ht.jpg"),
                              fit: BoxFit.fill,
                            ),
                            Text(
                              "1959",
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
