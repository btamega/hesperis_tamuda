import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/constant.dart';
import 'package:hesperis_tamuda/models/article.dart';
import 'package:hesperis_tamuda/services/data_service.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:http/http.dart' as http;
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'about.dart';
import 'archives.dart';
import 'contact.dart';
import 'editorial.dart';
import 'ethic.dart';
import 'last_issues.dart';
import 'recommandation.dart';
import 'package:carousel_slider/carousel_slider.dart';
final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'

];
class ArticleList extends StatefulWidget {
  final int idFascicule;
  const ArticleList({ Key? key, required this.idFascicule }) : super(key: key);

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  int _selectedIndex = 0;
  
  final List<Widget> imageSliders = imgList
    .map((item) => Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    'No. ${imgList.indexOf(item)} image',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    ))
    .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text("Articles", style: GoogleFonts.ibarraRealNova(),),
        centerTitle: true,
        backgroundColor: const Color(0xff3b5998),
        actions: const [LanguagePickerWidget()],
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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                 CarouselSlider(
                  
                  options: CarouselOptions(
                    height: 120,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 2,
                    autoPlay: true,
                  ),
                    items: imageSliders,
                  ),
                  FutureBuilder<List<Article>>(
                    future: getArticles(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                          itemBuilder: (BuildContext, index) {
                            return GestureDetector(
                                onTap: () {
                                  
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(border: Border.all(),),
                                  child: Column(
                                    children: [
                                      
                                      InkWell(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => ArticleList(idFascicule: snapshot.data![index].idFascicule)),
                                          );
                                          },
                                          onDoubleTap: (){
                                          selectedItem(context, 0);
                                          },
                                          child: Column(children:[
                                            Text(snapshot.data![index].titre+' '+snapshot.data![index].nbrePage, 
                                            textAlign: TextAlign.center),
                                            // Text(snapshot.data![index].annee, textAlign: TextAlign.center,),
                                          ]),
                                      ),

                                    ],
                                  ),
                              ),
                                );
                          },
                          itemCount: snapshot.data!.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (200 / 350),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(20),
                          scrollDirection: Axis.vertical,
                        );
                      } else if (snapshot.hasError) {
                        print(snapshot.error);
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
                    },
                  ),
            ],
          )
       
        )
        
        // FutureBuilder<List<Article>>(
        //         future: getArticles(),
        //         builder: (context, snapshot) {
        //           if (snapshot.hasData) {
        //             return GridView.builder(
        //               // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
        //               itemBuilder: (BuildContext, index) {
        //                 return GestureDetector(
        //                     onTap: () {
                              
        //                     },
        //                     child: Container(
        //                       padding: const EdgeInsets.all(8),
        //                       decoration: BoxDecoration(border: Border.all(),),
        //                       child: Column(
        //                         children: [
                                  
        //                           InkWell(
        //                             onTap: (){
        //                               Navigator.push(
        //                                 context,
        //                                 MaterialPageRoute(builder: (context) => ArticleList(idFascicule: snapshot.data![index].idFascicule)),
        //                               );
        //                               },
        //                               onDoubleTap: (){
        //                               selectedItem(context, 0);
        //                               },
        //                               child: Column(children:[
        //                                 Text(snapshot.data![index].titre+' '+snapshot.data![index].nbrePage, 
        //                                 textAlign: TextAlign.center),
        //                                 // Text(snapshot.data![index].annee, textAlign: TextAlign.center,),
        //                               ]),
        //                           ),

        //                         ],
        //                       ),
        //                   ),
        //                     );
        //               },
        //               itemCount: snapshot.data!.length,
        //               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //                 childAspectRatio: (200 / 350),
        //                 crossAxisSpacing: 10,
        //                 mainAxisSpacing: 10,
        //                 crossAxisCount: 2,
        //               ),
        //               shrinkWrap: true,
        //               padding: const EdgeInsets.all(20),
        //               scrollDirection: Axis.vertical,
        //             );
        //           } else if (snapshot.hasError) {
        //             print(snapshot.error);
        //             return SizedBox(
        //             height: MediaQuery.of(context).size.height / 1.3,
        //             child:  Center(
        //               child: Text('${snapshot.error}'),
        //             ),
        //           );
        //           }
        //           return SizedBox(
        //             height: MediaQuery.of(context).size.height / 1.3,
        //             child: const Center(
        //               child: CircularProgressIndicator(),
        //             ),
        //           );
        //         },
        //       ),
    
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
  Future<List<Article>> getArticles() async {
    final response = await http.get(
      Uri.parse(rootURL+'/fascicule/'+widget.idFascicule.toString()+'/article/list')
    );
    var jsonData = jsonDecode(response.body);
    if (jsonData!=null) {
        List<Article> articles =[];
      for (var item in jsonData) {
        Article article = Article(
          idArticle: item['id_articles'], 
          idFascicule: item['id_fascicule'], 
          idSommaire: item['id_sommaire'],
          titre: item['Titre'], 
          nbrePage:item['Nbre_Page'], 
          lienTelechargement: item['Lien_Telechargement'], 
          datePublication: item['Date_Publication']
          );
          articles.add(article);
          }
          return articles;
    } else {
        throw Exception('Failed to load articles');
    }
    
}
}