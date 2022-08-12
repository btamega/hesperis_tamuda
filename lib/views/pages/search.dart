import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/models/article.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 0;
  Icon customIcon = const Icon(Icons.search);
  late Widget customSearchBar=const Text("SEARCH"); 
  // Future<List<Article>> articles = getArticles();
  @override
  void initState() {
    customSearchBar = const Text("SEARCH");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: customSearchBar,
        centerTitle: true,
        backgroundColor: const Color(0xff3b5998),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
          onPressed: () {
            setState(() {
              if (customIcon.icon == Icons.search) {
              customIcon = const Icon(Icons.cancel);
              customSearchBar = const ListTile(
              leading: Icon(
                Icons.search,
                color: Colors.white,
                size: 28,
              ),
              title: TextField(
                decoration: InputDecoration(
                hintText: 'Tapez votre recherche...',
                hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontStyle: FontStyle.italic,
                ),
                border: InputBorder.none,
                ),
                style: TextStyle(
                color: Colors.white,
                ),
              ),
              );
              } else {
              customIcon = const Icon(Icons.search);
              customSearchBar = const Text('SEARCH');
              }
              });
          },
          icon: customIcon,
          )
          ],
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
      body: FutureBuilder<List<Article>>(
          // future: getArticles(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: MediaQuery.of(context).size.height / 450,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 1,
              ),
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index) {
                return Card(
                  child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        color: const Color.fromRGBO(222,226,230,0.5),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            // Row(
                            //   children: <Widget>[
                            //     Expanded(
                            //       child: Text(snapshot.data![index].titre, textAlign: TextAlign.left,
                            //       style: const TextStyle(color:Color(0xff2796bd)),),
                            //     ),
                            //     Expanded(
                            //       child: Text(snapshot.data![index].nbrePage, textAlign: TextAlign.right),
                            //     ),
                            //   ],
                            // ),
                            // Expanded(
                            //   child: ListTile(
                            //     title: Text(snapshot.data![index].idFascicule.toString()+"\n\n", textAlign: TextAlign.left,),
                            //     )
                            // ),
                            // Expanded(
                            //   child: Text('Date de publication: '+snapshot.data![index].datePublication, textAlign: TextAlign.left,)
                            // ),
                          ],
                        )
                        
                      ),
                      ),
                  );
                },
              );
              } else if (snapshot.hasError) {
                debugPrint("has no data");
                return SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child:  Center(
                  child: Text('${snapshot.error}'),
                ),
              );
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
          }
          ),
    );
  }
// Future<List<Article>> getArticles()async{
//     const url ='https://b366-105-67-7-186.eu.ngrok.io/fascicule/2022001/article/list';
//     final response = await http.get(Uri.parse(url));
//     final body = jsonDecode(response.body);
    
//       if (body!=null) {
//         List<Article> articles = [];
//         for (var item in body) {
//         Article article = Article(
//           idArticle: item['id_articles'], 
//           idFascicule: item['id_fascicule'], 
//           idSommaire: item['id_sommaire'],
//           titre: item['Titre'], 
//           nbrePage:item['Nbre_Page'], 
//           lienTelechargement: item['Lien_Telechargement'], 
//           datePublication: item['Date_Publication'], 
//           auteurs: []
//         );
//         articles.add(article);
//       }
//       return articles;
//       }else {
//         throw Exception('Failed to load Fascicule');
//       }

//     }
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