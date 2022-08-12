import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui' as ui;
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int _selectedIndex = 0;
 
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.accueil, style: GoogleFonts.ibarraRealNova(),),
        centerTitle: true,
        backgroundColor: const Color(0xff3b5998),
        actions: const [LanguagePickerWidget()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        items:  const[
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
                        AppLocalizations.of(context)!.titreHome1,
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
                           DropCapText(
                            AppLocalizations.of(context)!.paragraphe1 +"\n", 
                            textDirection:setDirection() ,
                            dropCap: DropCap(
                            width: 100,
                            height: 200,
                            child: const Image(image: AssetImage('assets/images/accueil.jpeg'),),
                            ),
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                        ),
                        Text(AppLocalizations.of(context)!.paragraphe2 +"\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                        Text(AppLocalizations.of(context)!.paragraphe3 +"\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                        Text(AppLocalizations.of(context)!.paragraphe4 +"\n", 
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

  setDirection() {
    if (Localizations.localeOf(context).toString()=='ar') {
      return ui.TextDirection.rtl;
    } else {
      return ui.TextDirection.ltr;
    }
  }
}

