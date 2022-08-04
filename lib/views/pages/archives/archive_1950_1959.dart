import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/models/api_response.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/pdf_reader.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';

class Archive19501959 extends StatefulWidget {
  const Archive19501959({ Key? key }) : super(key: key);

  @override
  State<Archive19501959> createState() => _Archive19501959State();
}

class _Archive19501959State extends State<Archive19501959> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Hespéris (1950-1959)", style: GoogleFonts.ibarraRealNova(),),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1950.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1950ht.jpg"),),
                      Text("1950\n", textAlign: TextAlign.center,),
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
                  onTap: () async {
                    showDialog(context: context, builder: (context){
                      return const Center(
                        child:CircularProgressIndicator() ,
                      );
                    });
                    const url = 'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1951.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1951ht.png"),),
                      Text("1951\n", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1952.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris ", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1952ht.png"),),
                      Text("1952\n", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1953.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1953ht.jpg"),),
                      Text("1953\n", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1954.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1954ht.jpg"),),
                      Text("1954\n", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1955.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1955ht.png"),),
                      Text("1955", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1956.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1956ht.jpg"),),
                      Text("1956", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1957.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1957ht.jpg"),),
                      Text("1957", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1958.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1958ht.jpg"),),
                      Text("1958", textAlign: TextAlign.center,),
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
                    const url = 'https://hesperis-tamuda.com/Downloads/1950-1959/Hespéris Tamuda 1959.pdf';
                    final file = await PDFApi.loadNetwork(url);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1959ht.jpg"),fit: BoxFit.fill,),
                      Text("1959", textAlign: TextAlign.center,),
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

