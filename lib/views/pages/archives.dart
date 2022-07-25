import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../menu/language.dart';
import 'about.dart';
import 'contact.dart';
import 'editorial.dart';
import 'ethic.dart';
import 'lastIssues.dart';
import 'recommandation.dart';
class ArchivePage extends StatefulWidget {
  const ArchivePage({ Key? key }) : super(key: key);

  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.archive, style: GoogleFonts.ibarraRealNova(),),
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
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
        onTap: _onItemTapped,
        ),
        body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: (200 / 350),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            // color: Colors.teal[100],
            decoration: BoxDecoration(border: Border.all(),),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    selectedItem(context, 0);
                    },
                    onDoubleTap: (){
                    selectedItem(context, 0);
                    },
                    child: Column(children: const[
                      Text("Hespéris-Tamuda (2020-2021)\n", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/about.jpg"),),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(),),
          padding: const EdgeInsets.all(8),
          // color: Colors.teal[100],
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    selectedItem(context, 3);
                    },
                    onDoubleTap: (){
                    selectedItem(context, 3);
                    },
                    child: Column(children: const[
                      Text("Hespéris-Tamuda (2010-2019)\n", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/about.jpg"),),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          // color: Colors.teal[300],
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    selectedItem(context, 4);
                    },
                    onDoubleTap: (){
                    selectedItem(context, 4);
                    },
                    child: Column(children: const[
                      Text("Hespéris-Tamuda (2000-2009)\n", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/about.jpg"),),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          // color: Colors.teal[400],
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    selectedItem(context, 5);
                    },
                    onDoubleTap: (){
                    selectedItem(context, 5);
                    },
                    child: Column(children: const[
                      Text("Hespéris-Tamuda (1990-1999)\n", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/about.jpg"),),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          // color: Colors.teal[300],
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    selectedItem(context, 6);
                    },
                    onDoubleTap: (){
                    selectedItem(context, 6);
                    },
                    child: Column(children: const[
                      Text("Hespéris-Tamuda (1980-1989)\n", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/about.jpg"),),
                    ]),
                ),
                
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          // color: Colors.teal[400],
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    selectedItem(context, 7);
                    },
                    onDoubleTap: (){
                    selectedItem(context, 7);
                    },
                    child: Column(children: const[
                      Text("Hespéris-Tamuda (1970-1979)\n", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/about.jpg"),),
                    ]),
                ),
              ],
            ),
        )
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
  void selectedItem(BuildContext context, int index){
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage(),));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AboutPage(),));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditorialCommitteePage(),));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RecommandationPage(),));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ArchivePage(),));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LastIssuesPage(),));
        break;
      case 7:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ContactPage(),));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PublicationEthicPage(),));
        break;
      default:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage(),));
    }
  }
}