import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/models/api_response.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/pdf_reader.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';

class Archive19701979 extends StatefulWidget {
  const Archive19701979({ Key? key }) : super(key: key);

  @override
  State<Archive19701979> createState() => _Archive19701979State();
}

class _Archive19701979State extends State<Archive19701979> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Hespéris Tamuda (1970-1979)", style: GoogleFonts.ibarraRealNova(),),
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
        childAspectRatio: (200 / 357),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(13),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1970-1979/Hesperis-Tamuda 1970.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1972.png"),),
                      Text("1970\n", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
          Container(
            padding: const EdgeInsets.all(13),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1970-1979/Hesperis-Tamuda 1971.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1971.png"),),
                      Text("1971\n", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all(),),
          padding: const EdgeInsets.all(13),
          child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    showDialog(context: context, builder: (context){
                      return const Center(
                        child:CircularProgressIndicator() ,
                      );
                    });
                    const url = 'https://hesperis-tamuda.com/Downloads/1970-1979/Hesperis-Tamuda 1972.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1972.png"),),
                      Text("1972\n", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(13),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1970-1979/Hespéris-Tamuda 1973.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1972.png"),),
                      Text("1973\n", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(18),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1970-1979/Hespéris-Tamuda 1974.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1974.png"),),
                      Text("1974\n", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1970-1979/Hespéris-Tamuda 1975.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1975.png"),),
                      Text("1975", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1970-1979/Hespéris-Tamuda 1976-1977.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1976-77.png"),),
                      Text("1976-77", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1970-1979/Hespéris-Tamuda 1978_1979.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1978-79.png"),),
                      Text("1978-79", textAlign: TextAlign.center,),
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

