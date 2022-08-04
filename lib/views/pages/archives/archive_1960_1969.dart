import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/models/api_response.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/pdf_reader.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';

class Archive19601969 extends StatefulWidget {
  const Archive19601969({ Key? key }) : super(key: key);

  @override
  State<Archive19601969> createState() => _Archive19601969State();
}

class _Archive19601969State extends State<Archive19601969> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Hespéris Tamuda (1960-1969)", style: GoogleFonts.ibarraRealNova(),),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1960-1969/Hespéris-Tamuda 1960.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1962.png"),),
                      Text("1960\n", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1960-1969/Hespéris-Tamuda 1961.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1961.jpg"),),
                      Text("1961\n", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1960-1969/Hespéris-Tamuda 1962.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1962.png"),),
                      Text("1962\n", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1960-1969/Hespéris-Tamuda 1963.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1962.png"),),
                      Text("1963\n", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1960-1969/Hespéris-Tamuda 1964.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1964.png"),),
                      Text("1964\n", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1960-1969/Hespéris-Tamuda 1965.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1965.png"),),
                      Text("1965", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1960-1969/Hespéris-Tamuda 1966.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1966.png"),),
                      Text("1966", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1960-1969/Hesperis-Tamuda 1967.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1967.png"),),
                      Text("1967", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1960-1969/Hesperis-Tamuda 1968.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1968.png"),),
                      Text("1968", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1960-1969/Hesperis-Tamuda 1969.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1969.png"),fit: BoxFit.fill,),
                      Text("1969", textAlign: TextAlign.center,),
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

