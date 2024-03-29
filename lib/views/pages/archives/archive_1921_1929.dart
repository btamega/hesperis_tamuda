import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/models/api_response.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/pdf_reader.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';

class Archive19201929 extends StatefulWidget {
  const Archive19201929({ Key? key }) : super(key: key);

  @override
  State<Archive19201929> createState() => _Archive19201929State();
}

class _Archive19201929State extends State<Archive19201929> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
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
                    onTap: () async {
                      showDialog(context: context, builder: (context){
                        return const Center(
                          child:CircularProgressIndicator() ,
                        );
                      });
                      const url = 'https://hesperis-tamuda.com/Downloads/1921-1929/Hesp%C3%A9ris%20Tamuda%201921.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
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
                    onTap: () async {
                      showDialog(context: context, builder: (context){
                        return const Center(
                          child:CircularProgressIndicator() ,
                        );
                      });
                      const url = 'https://hesperis-tamuda.com/Downloads/1921-1929/Hesp%C3%A9ris%20Tamuda%201922.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
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
                    onTap: () async {
                      showDialog(context: context, builder: (context){
                        return const Center(
                          child:CircularProgressIndicator() ,
                        );
                      });
                      const url = 'https://hesperis-tamuda.com/Downloads/1921-1929/Hesp%C3%A9ris%20Tamuda%201923.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
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
                    onTap: () async{
                      showDialog(context: context, builder: (context){
                        return const Center(
                          child:CircularProgressIndicator() ,
                        );
                      });
                      const url = 'https://hesperis-tamuda.com/Downloads/1921-1929/Hesp%C3%A9ris%20Tamuda%201924.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
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
                    onTap: () async{
                      showDialog(context: context, builder: (context){
                        return const Center(
                          child:CircularProgressIndicator() ,
                        );
                      });
                      const url = 'https://hesperis-tamuda.com/Downloads/1921-1929/Hesp%C3%A9ris%20Tamuda%201925.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
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
                    onTap: () async{
                      showDialog(context: context, builder: (context){
                        return const Center(
                          child:CircularProgressIndicator() ,
                        );
                      });
                      const url = 'https://hesperis-tamuda.com/Downloads/1921-1929/Hesp%C3%A9ris%20Tamuda%201926.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
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
                    onTap: () async{
                      showDialog(context: context, builder: (context){
                        return const Center(
                          child:CircularProgressIndicator() ,
                        );
                      });
                      const url = 'https://hesperis-tamuda.com/Downloads/1921-1929/Hesp%C3%A9ris%20Tamuda%201927.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
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
                    onTap: () async{
                      showDialog(context: context, builder: (context){
                        return const Center(
                          child:CircularProgressIndicator() ,
                        );
                      });
                      const url = 'https://hesperis-tamuda.com/Downloads/1921-1929/Hesp%C3%A9ris%20Tamuda%201928.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
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
                    onTap: () async{
                      showDialog(context: context, builder: (context){
                        return const Center(
                          child:CircularProgressIndicator() ,
                        );
                      });
                      const url = 'https://hesperis-tamuda.com/Downloads/1921-1929/Hesp%C3%A9ris%20Tamuda%201929.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
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

