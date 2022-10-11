import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/models/statut.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:hesperis_tamuda/views/pages/errorPage.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hesperis_tamuda/views/pages/user/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu/language.dart';
import 'dart:ui' as ui;

import 'loginScreen.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
            AppLocalizations.of(context)!.a_propos,
            style: GoogleFonts.ibarraRealNova(),
          ),
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
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          onTap: _onItemTapped,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Column(
                      children: [
                        Text(
                          getText(),
                          style: GoogleFonts.ibarraRealNova(
                            textStyle: const TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3b5998),
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(children: <Widget>[
                              DropCapText(
                                  AppLocalizations.of(context)!
                                          .paragraphe_1_About +
                                      "\n",
                                  textDirection: setDirection(),
                                  dropCap: DropCap(
                                    width: 100,
                                    height: 140,
                                    child: const Image(
                                      image:
                                          AssetImage('assets/images/about.jpg'),
                                    ),
                                  ),
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_2_About +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_3_About +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_4_About +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_5_About +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_6_About +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_7_About +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_8_About +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_9_About +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_10_About +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_11_About +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_12_About +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_13_About +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_14_About +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                            ])),
                      ],
                    ),
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

  setDirection() {
    if (Localizations.localeOf(context).toString() == 'ar') {
      return ui.TextDirection.rtl;
    } else {
      return ui.TextDirection.ltr;
    }
  }

  String getText() {
    if (Localizations.localeOf(context).toString() == 'ar') {
      return AppLocalizations.of(context)!.titreAbout1 + "\n";
    } else {
      return "Hespéris-Tamuda " +
          AppLocalizations.of(context)!.titreAbout1 +
          "\n";
    }
  }
}
