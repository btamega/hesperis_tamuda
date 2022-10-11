import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/models/statut.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu/language.dart';
import 'package:url_launcher/url_launcher.dart';

import 'errorPage.dart';
import 'loginScreen.dart';
import 'user/dashboard.dart';

class PublicationEthicPage extends StatefulWidget {
  const PublicationEthicPage({Key? key}) : super(key: key);

  @override
  State<PublicationEthicPage> createState() => _PublicationEthicPageState();
}

class _PublicationEthicPageState extends State<PublicationEthicPage> {
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
            AppLocalizations.of(context)!.titreEthique,
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.titreEthique,
                          style: GoogleFonts.ibarraRealNova(
                            textStyle: const TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(fontSize: 22),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                              .ethiqueParagraphe_1_1 +
                                          " ",
                                      style: GoogleFonts.ibarraRealNova(
                                        textStyle: const TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                              .ethiqueParagraphe_1_2 +
                                          " ",
                                      style: GoogleFonts.ibarraRealNova(
                                        textStyle: const TextStyle(
                                            fontSize: 22.0,
                                            color: Color.fromARGB(
                                                255, 34, 80, 220)),
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => launchUrl(Uri.parse(
                                            'https://publicationethics.org/')),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context)!.ethiqueAuteurs +
                                    "\n",
                                textAlign: setTextDirection(),
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 28.0,
                                    ),
                                    color: const Color(0xff000000)),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                      .ethiqueOriginalite,
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                          fontSize: 20.0,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_2 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                      .ethiquePublication,
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                          fontSize: 20.0,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_3 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                      .ethiqueReconnaissance,
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                          fontSize: 20.0,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_4 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                      .ethiqueCopyright,
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                          fontSize: 20.0,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(fontSize: 22),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                          .ethiqueParagraphe_5,
                                      style: GoogleFonts.ibarraRealNova(
                                        textStyle: const TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                              .ethiquePoint_1_link +
                                          ". ",
                                      style: GoogleFonts.ibarraRealNova(
                                        textStyle: const TextStyle(
                                            fontSize: 22.0,
                                            color: Color.fromARGB(
                                                255, 34, 80, 220)),
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => launchUrl(Uri.parse(
                                            'https://creativecommons.org/licenses/by/4.0/')),
                                    ),
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                              .ethiqueParagraphe_5_1 +
                                          "\n\n",
                                      style: GoogleFonts.ibarraRealNova(
                                        textStyle: const TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                          .ethiquePoint_1_1,
                                      style: GoogleFonts.ibarraRealNova(
                                        textStyle: const TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                              .ethiquePoint_1_link +
                                          " ",
                                      style: GoogleFonts.ibarraRealNova(
                                        textStyle: const TextStyle(
                                            fontSize: 22.0,
                                            color: Color.fromARGB(
                                                255, 34, 80, 220)),
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => launchUrl(Uri.parse(
                                            'https://creativecommons.org/licenses/by/4.0/')),
                                    ),
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                              .ethiquePoint_1_2 +
                                          "\n\n",
                                      style: GoogleFonts.ibarraRealNova(
                                        textStyle: const TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                              .ethiquePoint_2_1 +
                                          " ",
                                      style: GoogleFonts.ibarraRealNova(
                                        textStyle: const TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                              .hesperis +
                                          " ",
                                      style: GoogleFonts.ibarraRealNova(
                                        textStyle: const TextStyle(
                                            fontSize: 22.0,
                                            color: Color.fromARGB(
                                                255, 34, 80, 220)),
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => _onItemTapped(0),
                                    ),
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                              .ethiquePoint_2_2 +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                        textStyle: const TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                  AppLocalizations.of(context)!.ethiquePoint_3 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!.ethiquePaternite,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_6 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!.ethiquePoint_4 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!.ethiquePoint_5 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!.ethiquePoint_6 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!.ethiquePoint_7 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_7 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!.ethiqueAuteur,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_8 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!
                                    .ethiqueReconnaissanceFinancement,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_9 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!
                                    .ethiqueDivulgation,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_10 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!.ethiqueErreur,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_11 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!.ethiqueReviseur +
                                    "\n",
                                textAlign: setTextDirection(),
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 28.0,
                                    ),
                                    color: const Color(0xff000000)),
                              ),
                              Text(
                                AppLocalizations.of(context)!.ethiqueErreur,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_11 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!.ethiqueProcessus,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_12 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(fontSize: 22),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                              .hesperis +
                                          " ",
                                      style: GoogleFonts.ibarraRealNova(
                                        textStyle: const TextStyle(
                                            fontSize: 22.0,
                                            color: Color.fromARGB(
                                                255, 34, 80, 220)),
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => _onItemTapped(0),
                                    ),
                                    TextSpan(
                                      text: AppLocalizations.of(context)!
                                              .ethiqueParagraphe_13 +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                        textStyle: const TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context)!
                                    .ethiqueContribution,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_14 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!
                                    .ethiqueNonQualifie,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_15 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!
                                    .ethiqueConfidentialite,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_16 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!.ethiqueNorme,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_17 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!
                                    .ethiqueReconnaissance,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_18 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!.ethiqueConflit,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_19 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!.ethiqueEditeur +
                                    "\n",
                                textAlign: setTextDirection(),
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 28.0,
                                    ),
                                    color: const Color(0xff000000)),
                              ),
                              Text(
                                AppLocalizations.of(context)!.ethiqueDecision,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_20 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!.ethiqueFrancJeu,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_21 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!
                                    .ethiqueConfidentialite,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_22 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                              Text(
                                AppLocalizations.of(context)!
                                    .ethiqueDivulgation,
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                    color: const Color(0xff000000)),
                                textAlign: setTextDirection(),
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                          .ethiqueParagraphe_23 +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
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

  setTextDirection() {
    if (Localizations.localeOf(context).toString() == 'ar') {
      return TextAlign.right;
    } else {
      return TextAlign.left;
    }
  }
}
