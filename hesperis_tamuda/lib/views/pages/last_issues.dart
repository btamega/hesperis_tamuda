import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/constant.dart';
import 'package:hesperis_tamuda/models/fascicule.dart';
import 'package:hesperis_tamuda/services/exceptions.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'about.dart';
import 'archives.dart';
import 'article_list.dart';
import 'contact.dart';
import 'editorial.dart';
import 'ethic.dart';
import 'recommandation.dart';
import '../menu/language.dart';
import 'package:http/http.dart' as http;

class LastIssuesPage extends StatefulWidget {
  const LastIssuesPage({Key? key}) : super(key: key);

  @override
  State<LastIssuesPage> createState() => _LastIssuesPageState();
}

class _LastIssuesPageState extends State<LastIssuesPage> {
  late Orientation orientation;
  late Size size;
  late double height;
  late double width;
  List<dynamic> fascicules = [];
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
            AppLocalizations.of(context)!.derniersVolumes,
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
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          onTap: _onItemTapped,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await getLastIssues();
          },
          child: FutureBuilder<Fascicule>(
            future: getLastIssues(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                  itemBuilder: (BuildContext, index) {
                    return ListView.builder(
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (context, index1) {
                        return GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ArticleList(
                                                idFascicule: snapshot.data!
                                                    .data[index].idFascicule,
                                                titreFascicule: snapshot
                                                        .data!.data[index].nom +
                                                    ' ' +
                                                    snapshot.data!.data[index]
                                                        .numero +
                                                    ' (' +
                                                    snapshot.data!.data[index]
                                                        .anne +
                                                    ')',
                                              )),
                                    );
                                  },
                                  onDoubleTap: () {
                                    selectedItem(context, 0);
                                  },
                                  child: Column(children: [
                                    Text(
                                        snapshot.data!.data[index].nom +
                                            ' ' +
                                            snapshot.data!.data[index].numero,
                                        textAlign: TextAlign.center),
                                    snapshot.data!.data[index].vignettes[index1]
                                                .type ==
                                            'jaune'
                                        ? Image.network(
                                            rootURL +
                                                '/' +
                                                snapshot.data!.data[index]
                                                    .vignettes[index1].path,
                                            width: 300,
                                            height: 250)
                                        : Container(),
                                    Text(
                                      snapshot.data!.data[index].anne,
                                      textAlign: TextAlign.center,
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  itemCount: snapshot.data!.data.length,
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
                double _width = width * .25;
                if (orientation == Orientation.portrait) {
                  _width = width * .50;
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/animation_500_l8rqndep.gif",
                        width: _width,
                      ),
                      Center(
                        child: Text(
                          snapshot.error.toString(),
                          style: GoogleFonts.ibarraRealNova(
                              textStyle: const TextStyle(fontSize: 25)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
        ),
      ),
    );
  }

  Future<Fascicule> getLastIssues() async {
    try {
      final response = await http.get(Uri.parse(rootURL + '/api/lastIssues/'));
      switch (response.statusCode) {
        case 200:
          final fascicule = fasciculeFromJson(response.body.toString());
          return fascicule;
        case 400: //Bad request
          throw BadRequestException(jsonDecode(response.body)['message']);
        case 401: //Unauthorized
          throw UnAuthorizedException(jsonDecode(response.body)['message']);
        case 403: //Forbidden
          throw UnAuthorizedException(jsonDecode(response.body)['message']);
        case 404: //Resource Not Found
          throw NotFoundException(jsonDecode(response.body)['message']);
        case 500: //Internal Server Error
        default:
          throw FetchDataException(
              'Something went wrong! ${response.statusCode}');
      }
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e, context);
    }
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
}
