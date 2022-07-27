import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../menu/language.dart';
import 'package:url_launcher/url_launcher.dart';
class PublicationEthicPage extends StatefulWidget {
  const PublicationEthicPage({ Key? key }) : super(key: key);

  @override
  State<PublicationEthicPage> createState() => _PublicationEthicPageState();
}

class _PublicationEthicPageState extends State<PublicationEthicPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.titreEthique, style: GoogleFonts.ibarraRealNova(),),
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
                        AppLocalizations.of(context)!.titreEthique,
                        style: GoogleFonts.ibarraRealNova(
                          textStyle:const TextStyle(
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
                        children: <Widget> [
                          Text(AppLocalizations.of(context)!.ethiqueParagraphe_1_1, 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,), color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          InkWell(
                            child: Text(
                              AppLocalizations.of(context)!.ethiqueParagraphe_1_2,
                              style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,), color: const Color.fromARGB(255, 34, 80, 220)), textAlign:TextAlign.start
                            ),
                            onTap: () => launchUrl(Uri.parse('http://publicationethics.org/')),
                          ),
                          
                          Text(AppLocalizations.of(context)!.ethiqueAuteurs +"\n", 
                            textAlign: TextAlign.left,
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 28.0,),color: const Color(0xff000000)), 
                          ),
                          Text(AppLocalizations.of(context)!.paragraphe_3_Recommandation +"\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text(AppLocalizations.of(context)!.titre_1_ParaRecommandation +"\n",
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,color: Colors.red),),textAlign: TextAlign.left
                          ),
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