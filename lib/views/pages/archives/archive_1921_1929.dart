import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/pdf_reader.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1940_1949.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1950_1959.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1960_1969.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1970_1979.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1980_1989.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1990_1999.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_2000_2009.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_2010_2019.dart';

class Archive19201929 extends StatefulWidget {
  const Archive19201929({ Key? key }) : super(key: key);

  @override
  State<Archive19201929> createState() => _Archive19201929State();
}

class _Archive19201929State extends State<Archive19201929> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Hespéris (1921-1929)", style: GoogleFonts.ibarraRealNova(),),
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
        padding: const EdgeInsets.all(22),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: (200 / 358),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(24.3),
            decoration: BoxDecoration(border: Border.all(),),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PDFReader()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1921ht.jpg"),),
                      Text("1921\n", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(),),
          padding: const EdgeInsets.all(24.3),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive20102019()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris ", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1922 TOME II FASC.1-2-3.jpg"),),
                      Text("1922\n", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(23),
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive20002009()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1923 TOMEIII FASC.1-2-3-4.jpg"),),
                      Text("1923\n", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(23),
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive19901999()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1924 TOME IV FASC.1-2-3-4.jpg"),),
                      Text("1924\n", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(19),
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive19801989()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1925 TOMEV FASC.1-2-3-4.jpg"),),
                      Text("1925", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(19),
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive19701979()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1922 TOME II FASC.1-2-3.jpg"),),
                      Text("1926", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(19),
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive19601969()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1927 TOME VII FASC.1-2-3-4.jpg"),),
                      Text("1927", textAlign: TextAlign.center,),
                    ]),
                ),

              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(19),
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive19501959()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1928 TOME VIII FASC.1-2-3.jpg"),),
                      Text("1928", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(19),
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive19401949()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1929 TOME IX FASC.1-2-3.jpg"),fit: BoxFit.fill,),
                      Text("1929", textAlign: TextAlign.center,),
                    ]),
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

