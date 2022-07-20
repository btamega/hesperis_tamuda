import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
class RecommandationPage extends StatefulWidget {
  const RecommandationPage({ Key? key }) : super(key: key);

  @override
  State<RecommandationPage> createState() => _RecommandationPageState();
}

class _RecommandationPageState extends State<RecommandationPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('RECOMMANDATIONS', style: GoogleFonts.ibarraRealNova(),),
        centerTitle: true,
        backgroundColor: const Color(0xff3b5998),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
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
                        "How to Submit and Rules of Editing",
                        style: GoogleFonts.ibarraRealNova(
                          textStyle:const TextStyle(
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
                        child: Column(
                        children: <Widget> [
                          
                          Text("Contributions submitted for publication in the journal are unpublished. They have not been published previously either in print or on the Internet in any other language and have not been submitted to other journals at the same time. Manuscripts must be written in the original language (Arabic, French, English, Spanish) in electronic format in Word format, with the following parameters: font Times New Roman, 12 points (09 in the notes, which must appear at the bottom of the page, numbered in correlation with Arabic numerals), simple interlinear separation (in text and notes) and 3 cm of lateral margins. The last page should include the summary and keywords, all translated into English, French, Spanish, and Arabic. The length of the abstract will be between 100 and 150 words and will describe the purpose of the research, the methodology used, the most outstanding results and the main conclusions. Send your articles to the following email address: (khalidbensrhir@gmail.com)\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,), color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Each article will be evaluated by the editorial committee and, in case of agreement, it will be sent anonymously to at least two ad hoc readers. The latter may either recommend accepting the article as it is, or ask for modifications, or recommend not to retain the article. In case of request for modifications, the article will be submitted a second time to the evaluators.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("In addition to the detailed style sheet below, we kindly ask our contributors to consult the last three issues of Hespéris-Tamuda published after 2016 to become familiar with the system recently adopted by Hespéris-Tamuda. This system is a bit difficult to apply at the beginning, especially for manuscripts written in French, Spanish and Arabic.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("References System\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.red),),textAlign: TextAlign.left
                          ),
                          Text("Use the Chicago Manual of Style Reference System. Be careful, there are two citation systems linked to the Chicago style: the classic method and the author / date method. For the sake of precision and clarity we have opted for the classic method (or traditional) that uses reference notes at the bottom of the page and not at the end of the document, which return the reader to a bibliography.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Each article must be accompanied by an identification sheet of the quadrilingual article (French, English, Spanish and Arabic) with the title of the article (in four languages), the names of authors in the desired order, a short notice of presentation of each of the authors (5 lines maximum), a summary of 100 or 150 signs with 5-6 key words (in the four languages).\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Footnotes\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.red),),textAlign: TextAlign.left
                          ),
                          Text("It is essential to use automatic continuous numbering with the footnotes. Note calls are preferably placed at the end of the sentence and simply inserted in the text (no parentheses). The note call in the text always comes after the punctuation mark. Example: “as Ibn Khaldoun wrote.” 8 In the footnote itself, the automatically generated number is followed by a space and then the contents of the note. The title of the article and the subtitles can not have a footnote.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Bibliography\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.red),),textAlign: TextAlign.left
                          ),
                          Text("The bibliography must be presented in alphabetical order. All sources are listed in the alphabetical order of the name of the author, regardless of the type of document (articles, books, websites, etc.). If the same author appears several times in the bibliography, we organize its works from the most recent to the oldest. The bibliography is single-spaced and requires a paragraph (i.e. tab) of approximately 1 cm at the beginning of the second line and subsequent lines of each reference.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Illustrations\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.red),),textAlign: TextAlign.left
                          ),
                          Text("The photographs and graphics that accompany the text should be of as good quality as possible (300 dpi minimum). Photocopies are not accepted. The photographs must be provided as scanned files in high definition, in .jpg format. The graphics are the subject of a separate file from the text and are transmitted as an image in .jpg format. The tables are designed directly in the article file (Word).\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Specify the legend, the reference of origin and the placement in the text of the illustrations. Provide permission to reproduce and preferably use royalty-free iconography. The illustrations must be introduced by captions in the form of a short description or the title of the work. Legends start with Figure and are followed by a number and then a dot. The numbering is sequential from the beginning. Rather than including the source in a bibliography, it is inserted directly into the legend, following the description if there is one, or as the only legend. It must contain the name of the person who produced the illustration, its title, the date of production and the provenance of the illustration, quoted according to the appropriate method for the format of the source (book, journal, periodical, etc.) . If it is an image subject to copyright and permission has been obtained for reuse, it must be mentioned by adding Reproduced with permission of ... followed by the source from where comes the picture.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Transliteration of Arabic words\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.red),),textAlign: TextAlign.left
                          ),
                          Text("The transliteration system of Arabic words used in Hespéris-Tamuda is as follows:\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          const Image(image: AssetImage('assets/images/table.png')),
                          Text("Style sheet for guidance based on the Chicago Manual of Style (2016) end note\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Books\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.red),),textAlign: TextAlign.left
                          ),
                          Text("references to books in footnotes\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Daniel Rivet, Histoire du Maroc (Paris: Fayard, 2012), 46-8.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Philippe Leveau, Pierre Sillières et Jean-Pierre Vallat, Campagnes de la Méditerranée romaine. Série Bibliothèque d’Archéologie (Paris: Hachette, 1993), 79\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Nicolas Lamare, Les fontaines monumentales en Afrique romaine. Collection de l’École Française de Rome, 557 (Rome: École Française de Rome, 2019), 123.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Mohammed Naciri, Désirs de ville (Rabat: Economie Critique, 2017), 456.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("An-Nāṣirī, Aḥmad ibn Khālid. Kitāb al-Istiqṣā li Akhbār duwal al-Maghrib al-Aqṣā. Taḥqīq wa taʿlīq Aḥmad An-Nāṣirī, Ashrafa ʿalayhi Muḥammad Ḥajjī, Ibrāhīm Būṭālib wa Aḥmad at-Tawfīq, vol. IV (Ar-Ribāṭ: Manshūrāt wizārat ath-thaqāfa wa al-ittiṣāl, 2001), 150.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Books\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("references to books in footnotes\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Daniel Rivet, Histoire du Maroc (Paris: Fayard, 2012), 46-8.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Philippe Leveau, Pierre Sillières et Jean-Pierre Vallat, Campagnes de la Méditerranée romaine. Série Bibliothèque d’Archéologie (Paris: Hachette, 1993), 79\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Nicolas Lamare, Les fontaines monumentales en Afrique romaine. Collection de l’École Française de Rome, 557 (Rome: École Française de Rome, 2019), 123.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Mohammed Naciri, Désirs de ville (Rabat: Economie Critique, 2017), 456.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("An-Nāṣirī, Aḥmad ibn Khālid. Kitāb al-Istiqṣā li Akhbār duwal al-Maghrib al-Aqṣā. Taḥqīq wa taʿlīq Aḥmad An-Nāṣirī, Ashrafa ʿalayhi Muḥammad Ḥajjī, Ibrāhīm Būṭālib wa Aḥmad at-Tawfīq, vol. IV (Ar-Ribāṭ: Manshūrāt wizārat ath-thaqāfa wa al-ittiṣāl, 2001), 150.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Abbreviated bibliographical references in footnotes\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Rivet, Histoire, 46-8.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Leveau, Sillières et Vallat, Campagnes, 79.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Lamare, Les fontaines, 123.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Naciri, Désirs, 456.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("An-Nāṣirī, Kitāb al-Istiqṣā, IV. 150.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Bibliography at the end of the article (in alphabetical and chronological order)\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("An-Nāṣirī, Aḥmad ibn Khālid. Kitāb al-Istiqṣā li Akhbār duwal al-Maghrib al-Aqṣā. Taḥqīq wa taʿlīq Aḥmad An-Nāṣirī, Ashrafa ʿalayhi Muḥammad Ḥajjī, Ibrāhīm Būṭālib wa Aḥmad at-Tawfīq, vol. IV. Ar-Ribāṭ: Manshūrāt wizārat ath-thaqāfa wa al-ittiṣāl, 2001.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Lamare, Nicolas. Les fontaines monumentales en Afrique romaine. Collection de l’École Française de Rome, 557. Rome: École Française de Rome, 2019.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Leveau, Philippe Pierre Sillières et Jean-Pierre Vallat. Campagnes de la Méditerranée romaine. Série Bibliothèque d’Archéologie. Paris: Hachette, 1993.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Naciri, Mohammed. Désirs de ville. Rabat: Economie Critique, 2017.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Rivet, Daniel. Histoire du Maroc. Paris: Fayard, 2012.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Article forming part of a collective work\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.red)),
                          ),
                          Text("Dans les notes de bas de pages, faire référence à des pages spécifiques et, dans la bibliographie, au début et à la fin du chapitre ou de la partie du livre.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("References to the article in the footnotes\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Hédi Fareh, “L’Afrique face aux catastrophes naturelles: l’apport de la documentation,” in In Africa et in Hispania: Études sur l’huile africaine, ed. Abdellatif Mrabet et José Remesal Rodríguez, Collecció Instrumenta, 25 (Barcelona: Publicacions i Edicions Universitat de Barcelona, 2007), 151-53.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Jörg Linstädter, “The Epipalaeolithic Neolithic transition in the eastern Rif Mountains and the lower Moulouya valley, Morocco,” in The Last Hunter-Gatherers and the First Farming Communities in the South of the Iberian Peninsula and North of Morocco. Proceedings of the workshop Faro 2.-4.11.2009. ed. Juan Francisco Gibaja Bao, António Faustino Carvalho, Nuno F. Bicho, Promotoria Monográphica 15 (Faro: Universidade de Algarve, 2011), 91.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Laurent Callegarin et al., “Les thermes de la domus 1 de Rirha (Sidi Slimane, Maroc),” in L’eau dans les villes du Maghreb et leur territoire à l’époque romaine. Actes du colloque international organisé à Bordeaux, 6-8 décembre 2012, ed. Véronique Brouquier-Reddé et Frédéric Hurlet, collection Mémoires, 54 (Bordeaux: Ausonius Éditions, 2018), 182.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("References to the article in the footnotes\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Fareh, “L’Afrique,” 151-53.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Linstädter, “The Epipalaeolithic,” 91.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Fareh, “L’Afrique,” 151-53.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Callegarin et al. “Les thermes,” 172.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Bibliography at the end of the article (in alphabetical and chronological order)\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Callegarin, Laurent, Abdelfattah Ichkhakh, Mohamed Kbiri Alaoui, Claire-Anne De Chazelles, Véronique Mathieu, Aïcha Amina Malek, Alexandra Dardenay, Zahra Qninba, Bidaouia Belkamel, Séverine Sanz-Laliberté, Chrisrian Darles, Jean-Baptiste Pineau et M’hamed Alilou. “Les thermes de la domus 1 de Rirha (Sidi Slimane, Maroc).” In L’eau dans les villes du Maghreb et leur territoire à l’époque romaine. Actes du colloque international organisé à Bordeaux, 6-8 décembre 2012. Véronique Brouquier-Reddé et Frédéric Hurlet (eds.), Collection Mémoires 54, 163-92. Bordeaux: Ausonius Éditions, 2018.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Fareh, Hédi. “L’Afrique face aux catastrophes naturelles: l’apport de la documentation.” In In Africa et in Hispania: Études sur l’huile africaine, ed. Abdellatif Mrabet et José Remesal Rodríguez, Collecció Instrumenta 25, 145-67. Barcelona: Publicacions i Edicions Universitat de Barcelona, 2007.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Linstädter, Jörg. “The Epipalaeolithic Neolithic transition in the eastern Rif Mountains and the lower Moulouya valley, Morocco.” In The Last Hunter-Gatherers and the First Farming Communities in the South of the Iberian Peninsula and North of Morocco. Proceedings of the workshop Faro 2.-4.11.2009, ed. Juan Francisco Gibaja Bao, António Faustino Carvalho, Nuno F. Bicho, Promotoria Monográphica 15, 89-98. Faro: Universidade de Algarve, 2011.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Wāḥidī, ʿAlī. “Liksūs: mīnāʾ li taṣnīʿ wa taṣdīr al-asmāk.” In al-Baḥr fī tārīkhi al-Maghrib. Tansīq Ruqayya blmuqaddam, Silsilat an-nadawāt 7, 201-8. Al-Muḥammadiya: Manshūrāt Kulliyat al-Ādāb wa al-ʿulūm al-Insāniyya, 1999.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Translated works\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.red)),
                          ),
                          Text("References in the footnotes\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Emily Gottreich, Le Mellah de Marrakech, un espace judéo-musulman en partage. Traduction de Mohamed Hatimi, série Textes Traduits 19 (Rabat: Faculté des Lettres et Sciences Humaines, 2016), 41.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("The abbreviated reference at the bottom of the page\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Gottreich, Le Mellah, 41.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Bibliography at the end of the article (in alphabetical and chronological order)\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Gottreich, Emily. Le Mellah de Marrakech, un espace judéo-musulman en partage. Traduction de Mohamed Hatimi, série Textes Traduits 19. Rabat: Faculté des Lettres et Sciences Humaines, 2016.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Articles published in scientific journals\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.red)),
                          ),
                          Text("References in the footnotes\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Philippe Leveau, “L’environnement de l’Afrique dans l’Antiquité. Climat et société, un état de la question,” IKOSIM 5 (2016): 64.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Layla Es-Sadra,“L’habitat au Maroc à l’époque antique,” Le Jardin des Hespérides 10 (2019): 39.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Rachid Cheddadi et al., “A History of human impact on Moroccan Mountain landscapes,” in African archaeological Review 32 (2015): 235.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Patrice Cressier et Abdelaziz Touri, “Le long voyage des chapiteaux du Royal Golf de Dar Es-Salam à Rabat. Utilisation et réutilisation d’un élément clef de l’architecture islamique d’Occident en époque moderne et contemporaine,” Hespéris-Tamuda LIV, 1 (2019): 43.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("The abbreviated reference at the bottom of the page\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Leveau, “L’environnement,” 64.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Es-Sadra,“L’habitat,” 39.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Rachid Cheddadi et al., “A History,” 235.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Cressier et Touri, “Le long voyage,” 43.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Bibliography at the end of the article (in alphabetical and chronological order)\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Cheddadi, Rachid, Majda Nourelbait, Ouafaa Bouaissa, Jala Tabel, Ali Rhoujjati, José Antonio López-Sáez, Francisca Alba-Sánchez, Carla Khater, Aziz Ballouche, Laurent Dezileau and Henry Lamb. “A History of human impact on Moroccan Mountain landscapes.” African archaeological Review 32 (2015): 233-48.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Cressier, Patrice et Abdelaziz Touri. “Le long voyage des chapiteaux du Royal Golf de Dar Es-Salam à Rabat. Utilisation et réutilisation d’un élément clef de l’architecture islamique d’Occident en époque moderne et contemporaine.” Hespéris-Tamuda LIV, 1 (2019): 41-64.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Es-Sadra, Layla. “L’habitat au Maroc à l’époque antique.” Le Jardin des Hespérides 10 (2019): 38-40.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Leveau, Philippe. “L’environnement de l’Afrique dans l’Antiquité. Climat et société, un état de la question.” IKOSIM 5 (2016): 57-75.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Articles published in scientific journals\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.red),),textAlign: TextAlign.left
                          ),
                          Text("References in footnotes\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Cécile Allinne, “Les villes romaines face aux inondations. La place des données archéologiques dans l’étude des risques fluviaux,” Géomorphologie: relief, processus, environnement [En ligne], 13, n°1 (2007), mis en ligne le 01 avril 2009, consulté le 30 avril 2017. URL: http://géomorphologie.revues.org/674 ; DOI: 10.4000/géomorphologie, 674.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("The abbreviated reference at the bottom of the page\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Allinne, “Les villes.”\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Bibliography at the end of the article (in alphabetical and chronological order)”\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Allinne, Cécile. “Les villes romaines face aux inondations. La place des données archéologiques dans l’étude des risques fluviaux.” Géomorphologie: relief, processus, environnement [En ligne], 13, n°1 (2007), mis en ligne le 01 avril 2009, consulté le 30 avril 2017. URL: http://géomorphologie.revues.org/674 ; DOI: 10.4000/géomorphologie, 674.”\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Article published in a newspaper”\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.red)),
                          ),
                          Text("La référence à ce type de référence est limitée aux références et n’est pas incluse dans la bibliographie.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("References in footnotes”\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Pierre Norat, “la jeunesse du tiers monde,” Le Peuple, 8 décembre, 1960.”\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("The abbreviated reference at the bottom of the page”\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Norat, “la jeunesse.””\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Book Reviews”\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.red)),
                          ),
                          Text("References in footnotes”\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Diana K. Davis, “Les mythes environnementaux de la colonisation Française au Maghreb,”\nCompte-rendu de Guillaume Blanc, Développement durable et territoire [En ligne], vol. 4, n°2, juillet 2013, mis en ligne le 10 juillet 2013,\nconsulté le 16 juillet 2013. URL:http://developpementdurable. Revues.org /9851.\nAkagawa Natsuko and Smith Laurajane (ed.), “Safeguarding Intangible Heritage: Practices and Politics,” Compte-rendu de Asmae Alkacimi, Hespéris-Tamuda LIV, 3 (2019): 377-83.”\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("The abbreviated reference at the bottom of the page”\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Davis, “Les mythes.” Natsuko and Laurajane (ed.), “Safeguarding,” 490.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Bibliography at the end of the article (in alphabetical and chronological order)\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Davis, Diana K. “Les mythes environnementaux de la colonisation Française au Maghreb.” Compte-rendu de Guillaume Blanc, Développement durable et territoire [En ligne], vol. 4, n°2, juillet 2013, mis en ligne le 10 juillet 2013, consulté le 16 juillet 2013. URL:http://developpementdurable. Revues.org /9851. Natsuko, Akagawa and Smith Laurajane (ed.). “Safeguarding Intangible Heritage: Practices and Politics.” Compte-rendu de Mustapha Nami, Hespéris-Tamuda LIV 1 (2019): 490.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("(Ph.D) Thesis and Doctorat dissertations\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.red)),
                          ),
                          Text("References in footnotes”\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Fadoua Nekkal, “La carte archéologique du Rif oriental et projet de la mise en valeur de la plaine de Guerouaou,” (Mémoire de fin d’études de l’Institut National des Sciences de l’Archéologie et du Patrimoine à Rabat, 2008), 56-8. Néjat Brahmi, “Volubilis: Approche religieuse d’une cité de Maurétanie Tingitane (Milieu Ier - fin IIIe siècles apr. J.-C.)” (Thèse pour obtenir le grade de docteur, Université du Maine-Le Mans, U.F.R Lettres, langues et sciences humaines, 2008), 120-4. Amina-Aïcha Malek, “Le sentiment de la nature dans les domus de l’Afrique romaine, IIe-Ve s,” (Thèse pour obtenir le doctorat en Archéologie, École des Hautes Études en Sciences Sociales à Paris, 1999), 44-7.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("The abbreviated reference at the bottom of the page\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Nekkal, “La carte,” 56-8. Brahmi, “Volubilis” 120-4. Malek, “Le sentiment” 44-7.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Bibliography at the end of the article (in alphabetical and chronological order)\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                          ),
                          Text("Brahmi, Néjat. “Volubilis: Approche religieuse d’une cité de Maurétanie Tingitane (Milieu Ier - fin IIIe siècles apr. J.-C.).” Thèse pour obtenir le grade de docteur, Université du Maine-Le Mans, U.F.R Lettres, langues et sciences humaines, 2008. Malek, Amina-Aïcha. “Le sentiment de la nature dans les domus de l’Afrique romaine, IIe-Ve s.” Thèse pour obtenir le doctorat en Archéologie, École des Hautes Études en Sciences Sociales à Paris, 1999. Nekkal, Fadoua. “La carte archéologique du Rif oriental et projet de la mise en valeur de la plaine de Guerouaou.” Mémoire de fin d’études de l’Institut National des Sciences de l’Archéologie et du Patrimoine à Rabat, 2008.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                        ]
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex==0) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage(),));
    } else if(_selectedIndex==1){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchPage(),));
    }else{
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage(),));
    }
  }
}