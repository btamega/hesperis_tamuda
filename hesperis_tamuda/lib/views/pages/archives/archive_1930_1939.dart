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

class Archive19301939 extends StatefulWidget {
  const Archive19301939({Key? key}) : super(key: key);

  @override
  State<Archive19301939> createState() => _Archive19301939State();
}

class _Archive19301939State extends State<Archive19301939> {
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
            "Hespéris (1930-1939)",
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
                childAspectRatio: (200 / 380),
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201930.pdf';
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
                              image: AssetImage("assets/images/1936ht.jpg"),
                            ),
                            Text(
                              "1930\n",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hespéris Tamuda 1931.pdf';
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
                              image: AssetImage("assets/images/1931ht.jpg"),
                            ),
                            Text(
                              "1931\n",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201932.pdf';
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
                              "Hespéris ",
                              textAlign: TextAlign.center,
                            ),
                            Image(
                              height: height * 0.333,
                              image:
                                  const AssetImage("assets/images/1932ht.jpg"),
                            ),
                            const Text(
                              "1932\n",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201933.pdf';
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
                              height: height * 0.336,
                              image:
                                  const AssetImage("assets/images/1933ht.jpg"),
                            ),
                            const Text(
                              "1933\n",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201934.pdf';
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
                              image: AssetImage("assets/images/1934ht.jpg"),
                            ),
                            Text(
                              "1934\n",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201935.pdf';
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
                              image: AssetImage("assets/images/1935ht.jpg"),
                            ),
                            Text(
                              "1935",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201936.pdf';
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
                              image: AssetImage("assets/images/1936ht.jpg"),
                            ),
                            Text(
                              "1936",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201937.pdf';
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
                              image: AssetImage("assets/images/1937ht.jpg"),
                            ),
                            Text(
                              "1937",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201938.pdf';
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
                              image: AssetImage("assets/images/1938ht.jpg"),
                            ),
                            Text(
                              "1938",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201939.pdf';
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
                              image: AssetImage("assets/images/1939ht.jpg"),
                              fit: BoxFit.fill,
                            ),
                            Text(
                              "1939",
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
                childAspectRatio: (200 / 372),
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201930.pdf';
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
                              image: AssetImage("assets/images/1936ht.jpg"),
                            ),
                            Text(
                              "1930\n",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hespéris Tamuda 1931.pdf';
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
                              image: AssetImage("assets/images/1931ht.jpg"),
                            ),
                            Text(
                              "1931\n",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201932.pdf';
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
                              image: AssetImage("assets/images/1932ht.jpg"),
                            ),
                            Text(
                              "1932\n",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201933.pdf';
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
                              image: AssetImage("assets/images/1934ht.jpg"),
                            ),
                            Text(
                              "1933\n",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201934.pdf';
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
                              image: AssetImage("assets/images/1934ht.jpg"),
                            ),
                            Text(
                              "1934\n",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201935.pdf';
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
                              image: AssetImage("assets/images/1935ht.jpg"),
                            ),
                            Text(
                              "1935",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201936.pdf';
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
                              image: AssetImage("assets/images/1936ht.jpg"),
                            ),
                            Text(
                              "1936",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201937.pdf';
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
                              image: AssetImage("assets/images/1937ht.jpg"),
                            ),
                            Text(
                              "1937",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201938.pdf';
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
                              image: AssetImage("assets/images/1938ht.jpg"),
                            ),
                            Text(
                              "1938",
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
                                'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201939.pdf';
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
                              image: AssetImage("assets/images/1939ht.jpg"),
                              fit: BoxFit.fill,
                            ),
                            Text(
                              "1939",
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
