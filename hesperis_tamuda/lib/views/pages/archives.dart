import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1921_1929.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1930_1939.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1940_1949.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1950_1959.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1960_1969.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1970_1979.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1980_1989.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1990_1999.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_2000_2009.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/recent_archives.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu/language.dart';
import 'about.dart';
import 'archives/archive_2010_2019.dart';
import 'contact.dart';
import 'editorial.dart';
import 'errorPage.dart';
import 'ethic.dart';
import 'last_issues.dart';
import 'loginScreen.dart';
import 'recommandation.dart';
import 'user/dashboard_screen.dart';

class ArchivePage extends StatefulWidget {
  const ArchivePage({Key? key}) : super(key: key);

  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
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
            AppLocalizations.of(context)!.archive,
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
            ? RefreshIndicator(
                onRefresh: () async {},
                child: GridView.count(
                  physics: const ClampingScrollPhysics(),
                  primary: false,
                  padding: const EdgeInsets.all(19),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: width / (height / 1.19),
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      height: height,
                      // padding: const EdgeInsets.all(19),
                      decoration: decoration,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RecentArchives()),
                              );
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: const [
                                  Text(
                                    "Hespéris-Tamuda",
                                    textAlign: TextAlign.center,
                                  ),
                                  Image(
                                    // height: 260,
                                    image: AssetImage(
                                        "assets/images/cover2020.gif"),
                                  ),
                                  Text(
                                    "(2020-2021)\n",
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
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive20102019()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris-Tamuda ",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                // height: 275,
                                image: AssetImage("assets/images/2001-2.png"),
                              ),
                              Text(
                                "(2010-2019)\n",
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
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive20002009()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris-Tamuda",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                // height: 275,
                                image: AssetImage("assets/images/2001-2.png"),
                              ),
                              Text(
                                "(2000-2009)\n",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height / 2.5,
                      // padding: const EdgeInsets.all(19),
                      decoration: decoration,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19901999()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris-Tamuda",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                // height: 275,
                                image: AssetImage("assets/images/1991.jpg"),
                              ),
                              Text(
                                "(1990-1999)\n",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height / 2.5,
                      // padding: const EdgeInsets.all(19),
                      // color: Colors.teal[400],
                      decoration: decoration,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19801989()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris-Tamuda",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                // height: 275,
                                image: AssetImage("assets/images/1980-81.png"),
                              ),
                              Text(
                                "(1980-1989)\n",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height / 2.5,
                      // padding: const EdgeInsets.all(19),
                      // color: Colors.teal[400],
                      decoration: decoration,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19701979()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris-Tamuda",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                // height: 275,
                                image: AssetImage("assets/images/1972.png"),
                              ),
                              Text(
                                "(1970-1979)\n",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height / 2.5,
                      // padding: const EdgeInsets.all(19),
                      // color: Colors.teal[300],
                      decoration: decoration,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19601969()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris-Tamuda",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                // height: 275,
                                image: AssetImage("assets/images/1966.png"),
                              ),
                              Text(
                                "(1960-1969)\n",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height / 2.5,
                      // padding: const EdgeInsets.all(19),
                      decoration: decoration,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19501959()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                // height: 275,
                                image: AssetImage("assets/images/1952ht.png"),
                              ),
                              Text(
                                "(1950-1959)\n",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height / 2.5,
                      // padding: const EdgeInsets.all(19),
                      decoration: decoration,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19401949()),
                              );
                            },
                            child: Column(children: [
                              const Text(
                                "Hespéris",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                height: height * 0.32,
                                image: const AssetImage(
                                    "assets/images/1943ht.jpg"),
                                fit: BoxFit.fill,
                              ),
                              const Text(
                                "(1940-1949)\n",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height / 2.5,
                      // padding: const EdgeInsets.all(8),
                      decoration: decoration,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19301939()),
                              );
                            },
                            child: Column(children: [
                              const Text(
                                "Hespéris",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                height: height * 0.322,
                                image: const AssetImage(
                                    "assets/images/1931ht.jpg"),
                              ),
                              const Text(
                                "(1930-1939)\n",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height / 2.5,
                      // padding: const EdgeInsets.all(19),
                      // color: Colors.teal[400],
                      decoration: decoration,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19201929()),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  "Hespéris",
                                  textAlign: TextAlign.center,
                                ),
                                Image(
                                  height: height * 0.32,
                                  image: const AssetImage(
                                      "assets/images/1921ht.jpg"),
                                ),
                                const Text(
                                  "(1921-1929)",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : RefreshIndicator(
                onRefresh: () async {},
                child: GridView.count(
                  physics: const ClampingScrollPhysics(),
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  childAspectRatio: (200 / 350),
                  children: <Widget>[
                    Container(
                      height: height,
                      // padding: const EdgeInsets.all(19),
                      decoration: decoration,
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RecentArchives()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris-Tamuda",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                // height: height,
                                image:
                                    AssetImage("assets/images/cover2020.gif"),
                              ),
                              Text(
                                "(2020-2021)\n",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: decoration,
                      height: height,
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive20102019()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris-Tamuda ",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                image: AssetImage("assets/images/2001-2.png"),
                              ),
                              Text(
                                "(2010-2019)\n",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height / 2.5,
                      // color: Colors.teal[300],
                      decoration: decoration,
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive20002009()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris-Tamuda",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                image: AssetImage("assets/images/2001-2.png"),
                              ),
                              Text(
                                "(2000-2009)\n",
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
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19901999()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris-Tamuda",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                image: AssetImage("assets/images/1991.jpg"),
                              ),
                              Text(
                                "(1990-1999)\n",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height / 2.5,
                      // color: Colors.teal[400],
                      decoration: decoration,
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19801989()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris-Tamuda",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                image: AssetImage("assets/images/1980-81.png"),
                              ),
                              Text(
                                "(1980-1989)\n",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height / 2.5,
                      // color: Colors.teal[400],
                      decoration: decoration,
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19701979()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris-Tamuda",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                image: AssetImage("assets/images/1972.png"),
                              ),
                              Text(
                                "(1970-1979)\n",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height / 2.5,
                      // color: Colors.teal[300],
                      decoration: decoration,
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19601969()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris-Tamuda",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                image: AssetImage("assets/images/1966.png"),
                              ),
                              Text(
                                "(1960-1969)\n",
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
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19501959()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                image: AssetImage("assets/images/1952ht.png"),
                              ),
                              Text(
                                "(1950-1959)\n",
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
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19401949()),
                              );
                            },
                            child: Column(children: const [
                              Text(
                                "Hespéris",
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                image: AssetImage("assets/images/1943ht.jpg"),
                                fit: BoxFit.fill,
                              ),
                              Text(
                                "(1940-1949)\n",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // height: height * .1,
                      height: height / 2.5,
                      decoration: decoration,
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19301939()),
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
                                "(1930-1939)\n",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height / 2.5,
                      // color: Colors.teal[400],
                      decoration: decoration,
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Archive19201929()),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: const [
                                Text(
                                  "Hespéris",
                                  textAlign: TextAlign.center,
                                ),
                                Image(
                                  image: AssetImage("assets/images/1921ht.jpg"),
                                ),
                                Text(
                                  "(1921-1929)",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AboutPage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const EditorialCommitteePage(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const RecommandationPage(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ArchivePage(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const LastIssuesPage(),
        ));
        break;
      case 7:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ContactPage(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const PublicationEthicPage(),
        ));
        break;
      default:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
    }
  }

  void getItemAndNavigate(int idVolume, BuildContext context) {}
}
