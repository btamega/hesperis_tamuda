import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/models/api_response.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/pdf_reader.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';

class Archive19301939 extends StatefulWidget {
  const Archive19301939({ Key? key }) : super(key: key);

  @override
  State<Archive19301939> createState() => _Archive19301939State();
}

class _Archive19301939State extends State<Archive19301939> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text("Hespéris (1930-1939)", style: GoogleFonts.ibarraRealNova(),),
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
                      const url = 'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201930.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                      );
                      },
                      child: Column(children: const[
                        Text("Hespéris", textAlign: TextAlign.center,),
                        Image(image: AssetImage("assets/images/1936ht.jpg"),),
                        Text("1930\n", textAlign: TextAlign.center,),
                      ]),
                  ),
                ],
              ),
          ),
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
                      const url = 'https://hesperis-tamuda.com/Downloads/1930-1939/Hespéris Tamuda 1931.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                      );
                      },
                      child: Column(children: const[
                        Text("Hespéris", textAlign: TextAlign.center,),
                        Image(image: AssetImage("assets/images/1931ht.jpg"),),
                        Text("1931\n", textAlign: TextAlign.center,),
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
                      const url = 'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201932.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                      );
                      },
                      child: Column(children: const[
                        Text("Hespéris ", textAlign: TextAlign.center,),
                        Image(image: AssetImage("assets/images/1932ht.jpg"),),
                        Text("1932\n", textAlign: TextAlign.center,),
                      ]),
                  ),
                ],
              ),
          ),
          Container(
            padding: const EdgeInsets.all(25),
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
                      const url = 'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201933.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                      );
                      },
                      child: Column(children: const[
                        Text("Hespéris", textAlign: TextAlign.center,),
                        Image(image: AssetImage("assets/images/1933ht.jpg"),),
                        Text("1933\n", textAlign: TextAlign.center,),
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
                      const url = 'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201934.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                      );
                      },
                      child: Column(children: const[
                        Text("Hespéris", textAlign: TextAlign.center,),
                        Image(image: AssetImage("assets/images/1934ht.jpg"),),
                        Text("1934\n", textAlign: TextAlign.center,),
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
                      const url = 'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201935.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                      );
                      },
                      child: Column(children: const[
                        Text("Hespéris", textAlign: TextAlign.center,),
                        Image(image: AssetImage("assets/images/1935ht.jpg"),),
                        Text("1935", textAlign: TextAlign.center,),
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
                      const url = 'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201936.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                      );
                      },
                      child: Column(children: const[
                        Text("Hespéris", textAlign: TextAlign.center,),
                        Image(image: AssetImage("assets/images/1936ht.jpg"),),
                        Text("1936", textAlign: TextAlign.center,),
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
                      const url = 'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201937.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                      );
                      },
                      child: Column(children: const[
                        Text("Hespéris", textAlign: TextAlign.center,),
                        Image(image: AssetImage("assets/images/1937ht.jpg"),),
                        Text("1937", textAlign: TextAlign.center,),
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
                      const url = 'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201938.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                      );
                      },
                      child: Column(children: const[
                        Text("Hespéris", textAlign: TextAlign.center,),
                        Image(image: AssetImage("assets/images/1938ht.jpg"),),
                        Text("1938", textAlign: TextAlign.center,),
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
                      const url = 'https://hesperis-tamuda.com/Downloads/1930-1939/Hesp%C3%A9ris%20Tamuda%201939.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                      );
                      },
                      child: Column(children: const[
                        Text("Hespéris", textAlign: TextAlign.center,),
                        Image(image: AssetImage("assets/images/1939ht.jpg"),fit: BoxFit.fill,),
                        Text("1939", textAlign: TextAlign.center,),
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

