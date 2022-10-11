import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/models/statut.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../include/navbar.dart';
import '../menu/language.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import 'errorPage.dart';
import 'home.dart';
import 'loginScreen.dart';
import 'search.dart';
import 'user/dashboard.dart';

class EditorialCommitteePage extends StatefulWidget {
  const EditorialCommitteePage({Key? key}) : super(key: key);

  @override
  State<EditorialCommitteePage> createState() => _EditorialCommitteePageState();
}

class _EditorialCommitteePageState extends State<EditorialCommitteePage> {
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
            AppLocalizations.of(context)!.comiteEditorial,
            style: GoogleFonts.ibarraRealNova(),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff3b5998),
          actions: const [LanguagePickerWidget()],
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: _onItemTapped,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ]),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          AppLocalizations.of(context)!.hesperis + "\n",
                          style: GoogleFonts.ibarraRealNova(
                            textStyle: const TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3b5998),
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                                  .soustitreComiteEditorial1 +
                              "\n",
                          style: GoogleFonts.ibarraRealNova(
                            textStyle: const TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3b5998),
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                                  .soustitreComiteEditorial2 +
                              "\n",
                          style: GoogleFonts.ibarraRealNova(
                            textStyle: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3b5998),
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                                  .soustitreComiteEditorial3 +
                              "\n",
                          style: GoogleFonts.ibarraRealNova(
                            textStyle: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Color(0xff3b5998),
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .soustitreComiteEditorial4,
                          style: GoogleFonts.ibarraRealNova(
                            textStyle: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3b5998),
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                                  .soustitreComiteEditorial5 +
                              "\n",
                          style: GoogleFonts.ibarraRealNova(
                            textStyle: const TextStyle(
                              fontSize: 16.0,
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
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context)!
                                            .soustitreComiteEditorial6 +
                                        "\n",
                                    style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.red,
                                      ),
                                    ),
                                    textAlign: setTextAlign(),
                                  ),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_1_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://fr.wikipedia.org/wiki/Ahmed_Toufiq'))),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_2_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      // ignore: deprecated_member_use
                                      onTap: () => launch(
                                          'http://www.amrh.ma/?page_id=1414&lang=fr')),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_3_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_5_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://fr.wikipedia.org/wiki/Mohamed_Tozy'))),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_6_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_7_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://scholar.google.es/citations?user=N9AcRJcAAAAJ&hl=en'))),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_8_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_9_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      // ignore: deprecated_member_use
                                      onTap: () => launch(
                                          'http://chsim.ehess.fr/index.php?82')),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_10_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_11_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://www.aoi.uzh.ch/de/islamwissenschaft/personen/professoren/dennerlein.html'))),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_12_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_13_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      // ignore: deprecated_member_use
                                      onTap: () => launch(
                                          'http://crh.ehess.fr/index.php?143')),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_14_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://campusdirectory.ucsc.edu/cd_detail?uid=eburke'))),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_15_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://uam.academia.edu/BERNABELOPEZGARCIA'))),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_16_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://www.college-de-france.fr/site/henry-laurens/biographie__1.htm'))),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_17_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://uam.academia.edu/ANGELESRAMIREZ'))),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_18_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://fr.wikipedia.org/wiki/Daniel_Rivet'))),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_19_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      // ignore: deprecated_member_use
                                      onTap: () => launch(
                                          'http://chsim.ehess.fr/index.php?74')),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_20_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://anthro.ucla.edu/person/aomar-boum/'))),
                                  Text(
                                    AppLocalizations.of(context)!
                                            .comiteRedaction_ComiteEditorial +
                                        "\n",
                                    style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.red,
                                      ),
                                    ),
                                    textAlign: setTextAlign(),
                                  ),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_21_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://anthro.ucla.edu/person/aomar-boum/'))),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_22_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_23_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_24_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_25_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_26_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      // ignore: deprecated_member_use
                                      onTap: () => launch(
                                          'http://www.aui.ma/en/shss/faculty.html?itemid=289')),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_27_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_28_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://emines-ingenieur.academia.edu/HassanRadoine'))),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_29_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_30_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://acrps.academia.edu/MohammedAbattouy'))),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_31_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_32_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      // ignore: deprecated_member_use
                                      onTap: () => launch(
                                          'http://www.archeo.ens.fr/Akerraz-Aomar.html')),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_33_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_34_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_35_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://univh2m.academia.edu/Leilamaziane'))),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_36_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  Text(
                                      AppLocalizations.of(context)!
                                              .auteur_37_ComiteEditorial +
                                          "\n",
                                      style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          color: const Color(0xff000000)),
                                      textAlign: TextAlign.justify),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_38_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://competences.imist.ma/CVdetails.htm;jsessionid=1C267FCF25E76CEB61FAB8D317A61B7A?idCompetence=1419'))),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_39_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://ciham.msh-lse.fr/membres/abdallah-fili'))),
                                  InkWell(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                                .auteur_40_ComiteEditorial +
                                            "\n",
                                        style: GoogleFonts.ibarraRealNova(
                                          textStyle: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff3b5998),
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://www.sit.edu/sit_faculty/taieb-belghazi-phd/'))),
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

  setTextAlign() {
    if (Localizations.localeOf(context).toString() == 'ar') {
      return TextAlign.right;
    } else {
      return TextAlign.left;
    }
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
