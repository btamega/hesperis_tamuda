import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu/language.dart';
import 'errorPage.dart';
import 'loginScreen.dart';
import 'user/dashboard_screen.dart';

class RecommandationPage extends StatefulWidget {
  const RecommandationPage({Key? key}) : super(key: key);

  @override
  State<RecommandationPage> createState() => _RecommandationPageState();
}

class _RecommandationPageState extends State<RecommandationPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.recommandation,
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
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
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
                          AppLocalizations.of(context)!.titreRecommandation,
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
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_1_Recommandation +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_2_Recommandation +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_3_Recommandation +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .titre_1_ParaRecommandation +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0, color: Colors.red),
                                  ),
                                  textAlign: TextAlign.left),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_4_Recommandation +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_5_Recommandation +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .titre_2_ParaRecommandation +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0, color: Colors.red),
                                  ),
                                  textAlign: TextAlign.left),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_6_Recommandation +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .titre_3_ParaRecommandation +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0, color: Colors.red),
                                  ),
                                  textAlign: TextAlign.left),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_7_Recommandation +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .titre_4_ParaRecommandation +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0, color: Colors.red),
                                  ),
                                  textAlign: TextAlign.left),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_8_Recommandation +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .paragraphe_9_Recommandation +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  AppLocalizations.of(context)!
                                          .titre_5_ParaRecommandation +
                                      "\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0, color: Colors.red),
                                  ),
                                  textAlign: TextAlign.left),
                              Text(
                                  "The transliteration system of Arabic words used in Hespéris-Tamuda is as follows:\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              const Image(
                                  image: AssetImage('assets/images/table.png')),
                              Text(
                                  "Style sheet for guidance based on the Chicago Manual of Style (2016) end note\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text("Books\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0, color: Colors.red),
                                  ),
                                  textAlign: TextAlign.left),
                              Text("references to books in footnotes\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Daniel Rivet, Histoire du Maroc (Paris: Fayard, 2012), 46-8.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Philippe Leveau, Pierre Sillières et Jean-Pierre Vallat, Campagnes de la Méditerranée romaine. Série Bibliothèque d’Archéologie (Paris: Hachette, 1993), 79\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Nicolas Lamare, Les fontaines monumentales en Afrique romaine. Collection de l’École Française de Rome, 557 (Rome: École Française de Rome, 2019), 123.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Mohammed Naciri, Désirs de ville (Rabat: Economie Critique, 2017), 456.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "An-Nāṣirī, Aḥmad ibn Khālid. Kitāb al-Istiqṣā li Akhbār duwal al-Maghrib al-Aqṣā. Taḥqīq wa taʿlīq Aḥmad An-Nāṣirī, Ashrafa ʿalayhi Muḥammad Ḥajjī, Ibrāhīm Būṭālib wa Aḥmad at-Tawfīq, vol. IV (Ar-Ribāṭ: Manshūrāt wizārat ath-thaqāfa wa al-ittiṣāl, 2001), 150.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "Books\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                "references to books in footnotes\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "Daniel Rivet, Histoire du Maroc (Paris: Fayard, 2012), 46-8.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Philippe Leveau, Pierre Sillières et Jean-Pierre Vallat, Campagnes de la Méditerranée romaine. Série Bibliothèque d’Archéologie (Paris: Hachette, 1993), 79\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Nicolas Lamare, Les fontaines monumentales en Afrique romaine. Collection de l’École Française de Rome, 557 (Rome: École Française de Rome, 2019), 123.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Mohammed Naciri, Désirs de ville (Rabat: Economie Critique, 2017), 456.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "An-Nāṣirī, Aḥmad ibn Khālid. Kitāb al-Istiqṣā li Akhbār duwal al-Maghrib al-Aqṣā. Taḥqīq wa taʿlīq Aḥmad An-Nāṣirī, Ashrafa ʿalayhi Muḥammad Ḥajjī, Ibrāhīm Būṭālib wa Aḥmad at-Tawfīq, vol. IV (Ar-Ribāṭ: Manshūrāt wizārat ath-thaqāfa wa al-ittiṣāl, 2001), 150.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "Abbreviated bibliographical references in footnotes\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text("Rivet, Histoire, 46-8.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Leveau, Sillières et Vallat, Campagnes, 79.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text("Lamare, Les fontaines, 123.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text("Naciri, Désirs, 456.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text("An-Nāṣirī, Kitāb al-Istiqṣā, IV. 150.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "Bibliography at the end of the article (in alphabetical and chronological order)\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "An-Nāṣirī, Aḥmad ibn Khālid. Kitāb al-Istiqṣā li Akhbār duwal al-Maghrib al-Aqṣā. Taḥqīq wa taʿlīq Aḥmad An-Nāṣirī, Ashrafa ʿalayhi Muḥammad Ḥajjī, Ibrāhīm Būṭālib wa Aḥmad at-Tawfīq, vol. IV. Ar-Ribāṭ: Manshūrāt wizārat ath-thaqāfa wa al-ittiṣāl, 2001.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Lamare, Nicolas. Les fontaines monumentales en Afrique romaine. Collection de l’École Française de Rome, 557. Rome: École Française de Rome, 2019.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Leveau, Philippe Pierre Sillières et Jean-Pierre Vallat. Campagnes de la Méditerranée romaine. Série Bibliothèque d’Archéologie. Paris: Hachette, 1993.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Naciri, Mohammed. Désirs de ville. Rabat: Economie Critique, 2017.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Rivet, Daniel. Histoire du Maroc. Paris: Fayard, 2012.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "Article forming part of a collective work\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0, color: Colors.red)),
                              ),
                              Text(
                                  "Dans les notes de bas de pages, faire référence à des pages spécifiques et, dans la bibliographie, au début et à la fin du chapitre ou de la partie du livre.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "References to the article in the footnotes\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "Hédi Fareh, “L’Afrique face aux catastrophes naturelles: l’apport de la documentation,” in In Africa et in Hispania: Études sur l’huile africaine, ed. Abdellatif Mrabet et José Remesal Rodríguez, Collecció Instrumenta, 25 (Barcelona: Publicacions i Edicions Universitat de Barcelona, 2007), 151-53.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Jörg Linstädter, “The Epipalaeolithic Neolithic transition in the eastern Rif Mountains and the lower Moulouya valley, Morocco,” in The Last Hunter-Gatherers and the First Farming Communities in the South of the Iberian Peninsula and North of Morocco. Proceedings of the workshop Faro 2.-4.11.2009. ed. Juan Francisco Gibaja Bao, António Faustino Carvalho, Nuno F. Bicho, Promotoria Monográphica 15 (Faro: Universidade de Algarve, 2011), 91.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Laurent Callegarin et al., “Les thermes de la domus 1 de Rirha (Sidi Slimane, Maroc),” in L’eau dans les villes du Maghreb et leur territoire à l’époque romaine. Actes du colloque international organisé à Bordeaux, 6-8 décembre 2012, ed. Véronique Brouquier-Reddé et Frédéric Hurlet, collection Mémoires, 54 (Bordeaux: Ausonius Éditions, 2018), 182.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "References to the article in the footnotes\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text("Fareh, “L’Afrique,” 151-53.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text("Linstädter, “The Epipalaeolithic,” 91.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text("Fareh, “L’Afrique,” 151-53.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text("Callegarin et al. “Les thermes,” 172.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "Bibliography at the end of the article (in alphabetical and chronological order)\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "Callegarin, Laurent, Abdelfattah Ichkhakh, Mohamed Kbiri Alaoui, Claire-Anne De Chazelles, Véronique Mathieu, Aïcha Amina Malek, Alexandra Dardenay, Zahra Qninba, Bidaouia Belkamel, Séverine Sanz-Laliberté, Chrisrian Darles, Jean-Baptiste Pineau et M’hamed Alilou. “Les thermes de la domus 1 de Rirha (Sidi Slimane, Maroc).” In L’eau dans les villes du Maghreb et leur territoire à l’époque romaine. Actes du colloque international organisé à Bordeaux, 6-8 décembre 2012. Véronique Brouquier-Reddé et Frédéric Hurlet (eds.), Collection Mémoires 54, 163-92. Bordeaux: Ausonius Éditions, 2018.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Fareh, Hédi. “L’Afrique face aux catastrophes naturelles: l’apport de la documentation.” In In Africa et in Hispania: Études sur l’huile africaine, ed. Abdellatif Mrabet et José Remesal Rodríguez, Collecció Instrumenta 25, 145-67. Barcelona: Publicacions i Edicions Universitat de Barcelona, 2007.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Linstädter, Jörg. “The Epipalaeolithic Neolithic transition in the eastern Rif Mountains and the lower Moulouya valley, Morocco.” In The Last Hunter-Gatherers and the First Farming Communities in the South of the Iberian Peninsula and North of Morocco. Proceedings of the workshop Faro 2.-4.11.2009, ed. Juan Francisco Gibaja Bao, António Faustino Carvalho, Nuno F. Bicho, Promotoria Monográphica 15, 89-98. Faro: Universidade de Algarve, 2011.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Wāḥidī, ʿAlī. “Liksūs: mīnāʾ li taṣnīʿ wa taṣdīr al-asmāk.” In al-Baḥr fī tārīkhi al-Maghrib. Tansīq Ruqayya blmuqaddam, Silsilat an-nadawāt 7, 201-8. Al-Muḥammadiya: Manshūrāt Kulliyat al-Ādāb wa al-ʿulūm al-Insāniyya, 1999.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "Translated works\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0, color: Colors.red)),
                              ),
                              Text(
                                "References in the footnotes\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "Emily Gottreich, Le Mellah de Marrakech, un espace judéo-musulman en partage. Traduction de Mohamed Hatimi, série Textes Traduits 19 (Rabat: Faculté des Lettres et Sciences Humaines, 2016), 41.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "The abbreviated reference at the bottom of the page\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text("Gottreich, Le Mellah, 41.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "Bibliography at the end of the article (in alphabetical and chronological order)\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "Gottreich, Emily. Le Mellah de Marrakech, un espace judéo-musulman en partage. Traduction de Mohamed Hatimi, série Textes Traduits 19. Rabat: Faculté des Lettres et Sciences Humaines, 2016.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "Articles published in scientific journals\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0, color: Colors.red)),
                              ),
                              Text(
                                "References in the footnotes\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "Philippe Leveau, “L’environnement de l’Afrique dans l’Antiquité. Climat et société, un état de la question,” IKOSIM 5 (2016): 64.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Layla Es-Sadra,“L’habitat au Maroc à l’époque antique,” Le Jardin des Hespérides 10 (2019): 39.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Rachid Cheddadi et al., “A History of human impact on Moroccan Mountain landscapes,” in African archaeological Review 32 (2015): 235.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Patrice Cressier et Abdelaziz Touri, “Le long voyage des chapiteaux du Royal Golf de Dar Es-Salam à Rabat. Utilisation et réutilisation d’un élément clef de l’architecture islamique d’Occident en époque moderne et contemporaine,” Hespéris-Tamuda LIV, 1 (2019): 43.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "The abbreviated reference at the bottom of the page\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text("Leveau, “L’environnement,” 64.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text("Es-Sadra,“L’habitat,” 39.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Rachid Cheddadi et al., “A History,” 235.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text("Cressier et Touri, “Le long voyage,” 43.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "Bibliography at the end of the article (in alphabetical and chronological order)\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "Cheddadi, Rachid, Majda Nourelbait, Ouafaa Bouaissa, Jala Tabel, Ali Rhoujjati, José Antonio López-Sáez, Francisca Alba-Sánchez, Carla Khater, Aziz Ballouche, Laurent Dezileau and Henry Lamb. “A History of human impact on Moroccan Mountain landscapes.” African archaeological Review 32 (2015): 233-48.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Cressier, Patrice et Abdelaziz Touri. “Le long voyage des chapiteaux du Royal Golf de Dar Es-Salam à Rabat. Utilisation et réutilisation d’un élément clef de l’architecture islamique d’Occident en époque moderne et contemporaine.” Hespéris-Tamuda LIV, 1 (2019): 41-64.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Es-Sadra, Layla. “L’habitat au Maroc à l’époque antique.” Le Jardin des Hespérides 10 (2019): 38-40.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Leveau, Philippe. “L’environnement de l’Afrique dans l’Antiquité. Climat et société, un état de la question.” IKOSIM 5 (2016): 57-75.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Articles published in scientific journals\n",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0, color: Colors.red),
                                  ),
                                  textAlign: TextAlign.left),
                              Text(
                                "References in footnotes\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "Cécile Allinne, “Les villes romaines face aux inondations. La place des données archéologiques dans l’étude des risques fluviaux,” Géomorphologie: relief, processus, environnement [En ligne], 13, n°1 (2007), mis en ligne le 01 avril 2009, consulté le 30 avril 2017. URL: http://géomorphologie.revues.org/674 ; DOI: 10.4000/géomorphologie, 674.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "The abbreviated reference at the bottom of the page\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text("Allinne, “Les villes.”\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Bibliography at the end of the article (in alphabetical and chronological order)”\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                  "Allinne, Cécile. “Les villes romaines face aux inondations. La place des données archéologiques dans l’étude des risques fluviaux.” Géomorphologie: relief, processus, environnement [En ligne], 13, n°1 (2007), mis en ligne le 01 avril 2009, consulté le 30 avril 2017. URL: http://géomorphologie.revues.org/674 ; DOI: 10.4000/géomorphologie, 674.”\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "Article published in a newspaper”\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0, color: Colors.red)),
                              ),
                              Text(
                                  "La référence à ce type de référence est limitée aux références et n’est pas incluse dans la bibliographie.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "References in footnotes”\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "Pierre Norat, “la jeunesse du tiers monde,” Le Peuple, 8 décembre, 1960.”\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "The abbreviated reference at the bottom of the page”\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text("Norat, “la jeunesse.””\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "Book Reviews”\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0, color: Colors.red)),
                              ),
                              Text(
                                "References in footnotes”\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "Diana K. Davis, “Les mythes environnementaux de la colonisation Française au Maghreb,”\nCompte-rendu de Guillaume Blanc, Développement durable et territoire [En ligne], vol. 4, n°2, juillet 2013, mis en ligne le 10 juillet 2013,\nconsulté le 16 juillet 2013. URL:http://developpementdurable. Revues.org /9851.\nAkagawa Natsuko and Smith Laurajane (ed.), “Safeguarding Intangible Heritage: Practices and Politics,” Compte-rendu de Asmae Alkacimi, Hespéris-Tamuda LIV, 3 (2019): 377-83.”\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "The abbreviated reference at the bottom of the page”\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "Davis, “Les mythes.” Natsuko and Laurajane (ed.), “Safeguarding,” 490.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "Bibliography at the end of the article (in alphabetical and chronological order)\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "Davis, Diana K. “Les mythes environnementaux de la colonisation Française au Maghreb.” Compte-rendu de Guillaume Blanc, Développement durable et territoire [En ligne], vol. 4, n°2, juillet 2013, mis en ligne le 10 juillet 2013, consulté le 16 juillet 2013. URL:http://developpementdurable. Revues.org /9851. Natsuko, Akagawa and Smith Laurajane (ed.). “Safeguarding Intangible Heritage: Practices and Politics.” Compte-rendu de Mustapha Nami, Hespéris-Tamuda LIV 1 (2019): 490.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "(Ph.D) Thesis and Doctorat dissertations\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0, color: Colors.red)),
                              ),
                              Text(
                                "References in footnotes”\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "Fadoua Nekkal, “La carte archéologique du Rif oriental et projet de la mise en valeur de la plaine de Guerouaou,” (Mémoire de fin d’études de l’Institut National des Sciences de l’Archéologie et du Patrimoine à Rabat, 2008), 56-8. Néjat Brahmi, “Volubilis: Approche religieuse d’une cité de Maurétanie Tingitane (Milieu Ier - fin IIIe siècles apr. J.-C.)” (Thèse pour obtenir le grade de docteur, Université du Maine-Le Mans, U.F.R Lettres, langues et sciences humaines, 2008), 120-4. Amina-Aïcha Malek, “Le sentiment de la nature dans les domus de l’Afrique romaine, IIe-Ve s,” (Thèse pour obtenir le doctorat en Archéologie, École des Hautes Études en Sciences Sociales à Paris, 1999), 44-7.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "The abbreviated reference at the bottom of the page\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "Nekkal, “La carte,” 56-8. Brahmi, “Volubilis” 120-4. Malek, “Le sentiment” 44-7.\n",
                                  style: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        fontSize: 20.0,
                                      ),
                                      color: const Color(0xff000000)),
                                  textAlign: TextAlign.justify),
                              Text(
                                "Bibliography at the end of the article (in alphabetical and chronological order)\n",
                                style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.blueAccent)),
                              ),
                              Text(
                                  "Brahmi, Néjat. “Volubilis: Approche religieuse d’une cité de Maurétanie Tingitane (Milieu Ier - fin IIIe siècles apr. J.-C.).” Thèse pour obtenir le grade de docteur, Université du Maine-Le Mans, U.F.R Lettres, langues et sciences humaines, 2008. Malek, Amina-Aïcha. “Le sentiment de la nature dans les domus de l’Afrique romaine, IIe-Ve s.” Thèse pour obtenir le doctorat en Archéologie, École des Hautes Études en Sciences Sociales à Paris, 1999. Nekkal, Fadoua. “La carte archéologique du Rif oriental et projet de la mise en valeur de la plaine de Guerouaou.” Mémoire de fin d’études de l’Institut National des Sciences de l’Archéologie et du Patrimoine à Rabat, 2008.\n",
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
