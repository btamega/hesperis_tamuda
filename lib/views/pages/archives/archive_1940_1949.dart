import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/models/api_response.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/pdf_reader.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';

class Archive19401949 extends StatefulWidget {
  const Archive19401949({ Key? key }) : super(key: key);

  @override
  State<Archive19401949> createState() => _Archive19401949State();
}

class _Archive19401949State extends State<Archive19401949> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Hespéris (1940-1949)", style: GoogleFonts.ibarraRealNova(),),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1940-1949/Hespéris Tamuda 1940.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1946ht.jpg"),),
                      Text("1940\n", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1940-1949/Hespéris Tamuda 1941.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1941ht.jpg"),),
                      Text("1941\n", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1940-1949/Hespéris Tamuda 1942.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris ", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1942ht.jpg"),),
                      Text("1942\n", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1940-1949/Hespéris Tamuda 1943.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1943ht.jpg"),),
                      Text("1943\n", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1940-1949/Hespéris Tamuda 1944.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1944ht.jpg"),),
                      Text("1944\n", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1940-1949/Hespéris Tamuda 1945.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1945ht.jpg"),),
                      Text("1945", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1940-1949/Hespéris Tamuda 1946.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1946ht.jpg"),),
                      Text("1946", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1940-1949/Hespéris Tamuda 1947.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1947ht.png"),),
                      Text("1947", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1940-1949/Hespéris Tamuda 1948.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1948ht.jpg"),),
                      Text("1948", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1940-1949/Hespéris Tamuda 1949.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1949ht.jpg"),fit: BoxFit.fill,),
                      Text("1949", textAlign: TextAlign.center,),
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

