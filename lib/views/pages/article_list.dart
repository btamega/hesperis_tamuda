import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/constant.dart';
import 'package:hesperis_tamuda/models/api_response.dart';
import 'package:hesperis_tamuda/models/article.dart';
import 'package:hesperis_tamuda/models/fascicule.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/pdf_reader.dart';
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

final List<String> imgList = [];

// ignore: must_be_immutable
class ImageDialog extends StatelessWidget {
  final String path;
  late Orientation orientation;
  late Size size;
  ImageDialog({
    Key? key,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    return Dialog(
      child: SizedBox(
        child: orientation == Orientation.landscape
            ? ListView(
                children: [
                  InteractiveViewer(
                      child: Image.network(path, fit: BoxFit.cover)),
                ],
              )
            : InteractiveViewer(child: Image.network(path, fit: BoxFit.cover)),
      ),
    );
  }
}

class ArticleList extends StatefulWidget {
  final int idFascicule;
  final String titreFascicule;

  const ArticleList(
      {Key? key, required this.idFascicule, required this.titreFascicule})
      : super(key: key);

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  late Orientation orientation;
  late Size size;
  late double height;
  late double width;
  late Fascicule fascicule;
  void setVignette() async {
    fascicule = await getSommaires();
    for (int i = 0; i < fascicule.data[0].vignettes.length; i++) {
      imgList.add(rootURL + '/' + fascicule.data[0].vignettes[i].path);
    }
  }

  @override
  void initState() {
    super.initState();
    setVignette();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
      child: Scaffold(
          drawer: const NavigationDrawerWidget(),
          appBar: AppBar(
            title: Text(
              widget.titreFascicule,
              style: GoogleFonts.ibarraRealNova(),
            ),
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
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
            onTap: _onItemTapped,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await getSommaires();
            },
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 380,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 1,
                    autoPlay: true,
                  ),
                  items: imgList
                      .map((e) => ClipRRect(
                            borderRadius: const BorderRadius.horizontal(),
                            child: Stack(fit: StackFit.expand, children: [
                              InkWell(
                                onTap: () async {
                                  await showDialog(
                                      context: context,
                                      builder: (_) => ImageDialog(
                                            path: e,
                                          ));
                                },
                                child: Image.network(
                                  e,
                                  width: 500,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ]),
                          ))
                      .toList(),
                ),
                Text(
                  "Sommaire-Contents-Sumario",
                  style: GoogleFonts.ibarraRealNova(
                      textStyle: const TextStyle(
                    fontSize: 25.0,
                  )),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FutureBuilder<Fascicule>(
                          future: getSommaires(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount:
                                    snapshot.data!.data[0].sommaires.length,
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(8),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return ListView(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    children: [
                                      Text(
                                        snapshot.data!.data[0].sommaires[index]
                                            .titre,
                                        style: GoogleFonts.ibarraRealNova(
                                            textStyle:
                                                const TextStyle(fontSize: 20)),
                                        textAlign: TextAlign.left,
                                      ),
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListView(
                                            physics:
                                                const ClampingScrollPhysics(),
                                            shrinkWrap: true,
                                            children: <Widget>[
                                              FutureBuilder<Article>(
                                                  future: getArticles(
                                                      widget.idFascicule,
                                                      snapshot
                                                          .data!
                                                          .data[0]
                                                          .sommaires[index]
                                                          .idSommaire),
                                                  builder:
                                                      (context, snapshot1) {
                                                    if (snapshot1.hasData) {
                                                      return ListView.builder(
                                                          shrinkWrap: true,
                                                          physics:
                                                              const ClampingScrollPhysics(),
                                                          itemCount: snapshot1
                                                              .data!
                                                              .data
                                                              .length,
                                                          itemBuilder: (context,
                                                              index1) {
                                                            return Card(
                                                              color: const Color
                                                                      .fromARGB(
                                                                  248,
                                                                  238,
                                                                  241,
                                                                  245),
                                                              child: ListView(
                                                                shrinkWrap:
                                                                    true,
                                                                physics:
                                                                    const ClampingScrollPhysics(),
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 4,
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            showDialog(
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Center(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: const [
                                                                                        CircularProgressIndicator(),
                                                                                        Text(
                                                                                          "Un instant, nous chargeons le fichier",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(color: Color.fromARGB(255, 35, 218, 193), fontSize: 20),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                });
                                                                            final url = rootURL +
                                                                                '/Downloads/' +
                                                                                snapshot1.data!.data[index1].lienTelechargement;
                                                                            final file =
                                                                                await PDFApi.loadNetwork(url);
                                                                            Navigator.push(
                                                                              context,
                                                                              MaterialPageRoute(builder: (context) => PDFViewerPage(file: file, fileUrl: url)),
                                                                            );
                                                                            //  Navigator.of(context).pop();
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            snapshot1.data!.data[index1].titre,
                                                                            textAlign:
                                                                                TextAlign.left,
                                                                            style:
                                                                                const TextStyle(color: Color(0xff2796bd)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child: Text(
                                                                            snapshot1.data!.data[index1].nbrePage,
                                                                            textAlign: TextAlign.right),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(
                                                                        bottom:
                                                                            10),
                                                                  ),
                                                                  Align(
                                                                    child: FutureBuilder<
                                                                            Article>(
                                                                        future: getArticles(
                                                                            widget.idFascicule,
                                                                            snapshot.data!.data[0].sommaires[index].idSommaire),
                                                                        builder: (context, snapshot2) {
                                                                          if (snapshot2
                                                                              .hasData) {
                                                                            return ListView.builder(
                                                                                shrinkWrap: true,
                                                                                physics: const ClampingScrollPhysics(),
                                                                                itemCount: snapshot1.data!.data[index1].auteurs.length,
                                                                                itemBuilder: (context, index2) {
                                                                                  return Text(snapshot2.data!.data[index1].auteurs[index2].prenom + ' ' + snapshot2.data!.data[index1].auteurs[index2].nom + ' ' + snapshot2.data!.data[index1].auteurs[index2].stat.toString());
                                                                                });
                                                                          } else if (snapshot
                                                                              .hasError) {
                                                                            return Text(serverError +
                                                                                "\n" +
                                                                                snapshot.error.toString());
                                                                          }
                                                                          return SizedBox(
                                                                            height:
                                                                                MediaQuery.of(context).size.height / 1.3,
                                                                            child:
                                                                                const Center(
                                                                              child: CircularProgressIndicator(),
                                                                            ),
                                                                          );
                                                                        }),
                                                                  ),
                                                                  const Padding(
                                                                    padding: EdgeInsets.only(
                                                                        bottom:
                                                                            15),
                                                                  ),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child:
                                                                          Text(
                                                                        'Date de publication: ' +
                                                                            snapshot1.data!.data[index1].datePublication,
                                                                        textAlign:
                                                                            TextAlign.left,
                                                                      )),
                                                                ],
                                                              ),
                                                            );
                                                          });
                                                    } else if (snapshot
                                                        .hasError) {
                                                      return Center(
                                                          child: Text(serverError +
                                                              "\n" +
                                                              snapshot.error
                                                                  .toString()));
                                                    }
                                                    return SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              1.3,
                                                      child: const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    );
                                                  }),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text(serverError +
                                      "\n" +
                                      snapshot.error.toString()));
                            }
                            return SizedBox(
                              height: MediaQuery.of(context).size.height / 1.3,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    } else if (_selectedIndex == 1) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SearchPage(),
      ));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ));
    }
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AboutPage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const EditorialCommitteePage(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const RecommandationPage(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ArchivePage(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const LastIssuesPage(),
        ));
        break;
      case 7:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ContactPage(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const PublicationEthicPage(),
        ));
        break;
      default:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
    }
  }

  Future<Fascicule> getSommaires() async {
    final response = await http.get(
        Uri.parse(rootURL + '/api/fascicule/' + widget.idFascicule.toString()));
    final fascicule = fasciculeFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return fascicule;
    } else {
      return fascicule;
    }
  }

  Future<Article> getArticles(var idFascicule, var idSommaire) async {
    final response = await http.get(Uri.parse(rootURL +
        '/api/fascicule/' +
        idFascicule.toString() +
        '/sommaire/' +
        idSommaire.toString() +
        '/articles'));
    final article = articleFromJson(response.body.toString());
    if (response.statusCode == 200) {
      return article;
    } else {
      return article;
    }
  }
}
