import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/models/statut.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/loginScreen.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui' as ui;
import 'package:hesperis_tamuda/views/pages/user/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'errorPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final User user = User(
      id: 1,
      name: "KANNOUFA",
      email: "fkannoufa@gmail.com",
      emailVerifiedAt: "emailVerifiedAt",
      createdAt: DateTime.now());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.accueil,
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
                          AppLocalizations.of(context)!.titreHome1,
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
                                  AppLocalizations.of(context)!.paragraphe1 +
                                      "\n",
                                  textDirection: setDirection(),
                                  dropCap: DropCap(
                                    width: 100,
                                    height: 200,
                                    child: const Image(
                                      image: AssetImage(
                                          'assets/images/accueil.jpeg'),
                                    ),
                                  ),
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!.paragraphe2 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!.paragraphe3 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!.paragraphe4 +
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
}
