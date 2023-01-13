import 'dart:convert';
import 'dart:io';
import 'package:hesperis_tamuda/constant.dart';
import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/models/fascicule.dart';
import 'package:hesperis_tamuda/services/exceptions.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/pages/archives.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu/language.dart';
import 'about.dart';
import 'article_list.dart';
import 'contact.dart';
import 'editorial.dart';
import 'errorPage.dart';
import 'ethic.dart';
import 'last_issues.dart';
import 'package:http/http.dart' as http;
import 'loginScreen.dart';
import 'recent_archives.dart';
import 'recommandation.dart';
import 'user/dashboard_screen.dart';

class ArchiveListe extends StatefulWidget {
  final int idVolume;
  final String volNom;
  const ArchiveListe({Key? key, required this.idVolume, required this.volNom})
      : super(key: key);

  @override
  State<ArchiveListe> createState() => _ArchiveListeState();
}

class _ArchiveListeState extends State<ArchiveListe> {
  int _selectedIndex = 0;
  late Orientation orientation;
  late Size size;
  late double height;
  late double width;
  final Decoration decoration = BoxDecoration(
    border: Border.all(
        color: const Color(0xff3b5998), width: 4.0, style: BorderStyle.solid),
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(10.0),
      topRight: Radius.circular(10.0),
      bottomLeft: Radius.circular(10.0),
      bottomRight: Radius.circular(10.0),
    ),
    boxShadow: const [
      BoxShadow(
        color: Color(0xff3b5998),
        offset: Offset(
          5.0,
          5.0,
        ),
        blurRadius: 10.0,
        spreadRadius: 2.0,
      ),
      BoxShadow(
        color: Colors.white,
        offset: Offset(0.0, 0.0),
        blurRadius: 0.0,
        spreadRadius: 0.0,
      ),
    ],
  );
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.black87,
    backgroundColor: Colors.grey[300],
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
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
            widget.volNom,
            style: GoogleFonts.ibarraRealNova(),
          ),
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
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ],
          onTap: _onItemTapped,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await getFascicules(widget.idVolume, context);
          },
          child: FutureBuilder<dynamic>(
            future: getFascicules(widget.idVolume, context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return orientation == Orientation.portrait
                    ? GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              height: height / 2.5,
                              // padding: const EdgeInsets.all(8),
                              decoration: decoration,
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ArticleList(
                                                  idFascicule: snapshot.data!
                                                      .data[index].idFascicule,
                                                  titreFascicule: snapshot.data!
                                                          .data[index].nom +
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
                                      FutureBuilder<dynamic>(
                                          future: getFascicules(
                                              widget.idVolume, context),
                                          builder: (context, snapshot1) {
                                            if (snapshot1.hasData) {
                                              return ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemCount: 1,
                                                  itemBuilder:
                                                      (context, index1) {
                                                    return snapshot
                                                                .data!
                                                                .data[index]
                                                                .vignettes[
                                                                    index1]
                                                                .type ==
                                                            'jaune'
                                                        ? Image.network(
                                                            rootURL +
                                                                '/' +
                                                                snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .vignettes[
                                                                        index1]
                                                                    .path,
                                                            // width: 300,
                                                            height:
                                                                height * 0.3)
                                                        : Container();
                                                  });
                                            } else if (snapshot1.hasError) {
                                              double _width = width * .25;
                                              if (orientation ==
                                                  Orientation.portrait) {
                                                _width = width * .50;
                                              }
                                              return Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/animation_500_l8rqndep.gif",
                                                      width: _width,
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        snapshot1.error
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .ibarraRealNova(
                                                                textStyle:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            25)),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    Center(
                                                        child: ElevatedButton(
                                                      style: raisedButtonStyle,
                                                      onPressed: () async {
                                                        try {
                                                          bool result =
                                                              await InternetConnectionChecker()
                                                                  .hasConnection;

                                                          if (result == true) {
                                                            Navigator.of(
                                                                    context)
                                                                .push(
                                                                    MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const RecentArchives(),
                                                            ));
                                                          }
                                                        } on SocketException catch (_) {
                                                          Navigator.of(context)
                                                              .push(
                                                                  MaterialPageRoute(
                                                            builder: (context) =>
                                                                const ErrorPage(),
                                                          ));
                                                        }
                                                      },
                                                      child: const Text(
                                                          'Actualiser'),
                                                    )),
                                                  ],
                                                ),
                                              );
                                            }
                                            return SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.3,
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          }),
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
                        itemCount: snapshot.data!.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: width / (height / 1.25),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                        ),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20),
                        scrollDirection: Axis.vertical,
                      )
                    : GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.all(19),
                              decoration: decoration,
                              child: ListView(
                                physics: const ClampingScrollPhysics(),
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ArticleList(
                                                  idFascicule: snapshot.data!
                                                      .data[index].idFascicule,
                                                  titreFascicule: snapshot.data!
                                                          .data[index].nom +
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
                                      FutureBuilder<dynamic>(
                                          future: getFascicules(
                                              widget.idVolume, context),
                                          builder: (context, snapshot1) {
                                            if (snapshot1.hasData) {
                                              return ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const ClampingScrollPhysics(),
                                                  itemCount: 1,
                                                  itemBuilder:
                                                      (context, index1) {
                                                    return snapshot
                                                                .data!
                                                                .data[index]
                                                                .vignettes[
                                                                    index1]
                                                                .type ==
                                                            'jaune'
                                                        ? Image.network(
                                                            rootURL +
                                                                '/' +
                                                                snapshot
                                                                    .data!
                                                                    .data[index]
                                                                    .vignettes[
                                                                        index1]
                                                                    .path,
                                                            // width: 300,
                                                            // height: 250
                                                          )
                                                        : Container();
                                                  });
                                            } else if (snapshot1.hasError) {
                                              double _width = width * .25;
                                              if (orientation ==
                                                  Orientation.portrait) {
                                                _width = width * .50;
                                              }
                                              return Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/animation_500_l8rqndep.gif",
                                                      width: _width,
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        snapshot1.error
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .ibarraRealNova(
                                                                textStyle:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            25)),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    Center(
                                                        child: ElevatedButton(
                                                      style: raisedButtonStyle,
                                                      onPressed: () async {
                                                        try {
                                                          bool result =
                                                              await InternetConnectionChecker()
                                                                  .hasConnection;

                                                          if (result == true) {
                                                            Navigator.of(
                                                                    context)
                                                                .push(
                                                                    MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const RecentArchives(),
                                                            ));
                                                          }
                                                        } on SocketException catch (_) {
                                                          Navigator.of(context)
                                                              .push(
                                                                  MaterialPageRoute(
                                                            builder: (context) =>
                                                                const ErrorPage(),
                                                          ));
                                                        }
                                                      },
                                                      child: const Text(
                                                          'Actualiser'),
                                                    )),
                                                  ],
                                                ),
                                              );
                                            }
                                            return SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.3,
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          }),
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
                        itemCount: snapshot.data!.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: (200 / 350),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 3,
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
                      Center(
                          child: ElevatedButton(
                        style: raisedButtonStyle,
                        onPressed: () async {
                          try {
                            bool result =
                                await InternetConnectionChecker().hasConnection;

                            if (result == true) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const RecentArchives(),
                              ));
                            }
                          } on SocketException catch (_) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ErrorPage(),
                            ));
                          }
                        },
                        child: const Text('Actualiser'),
                      )),
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

  Future<dynamic> getFascicules(var idVolume, BuildContext context) async {
    try {
      final response =
          await http.get(Uri.parse(rootURL + '/api/archive/$idVolume'));
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

  Future<void> _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      try {
        bool result = await InternetConnectionChecker().hasConnection;
        if (result == true) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        }
      } on SocketException catch (_) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        ));
      }
    } else if (_selectedIndex == 1) {
      try {
        final result = await InternetAddress.lookup('www.google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SearchPage(),
          ));
        }
      } on SocketException catch (_) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        ));
      }
    } else {
      try {
        final result = await InternetAddress.lookup('www.google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String? email = prefs.getString("email");
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => email == null
                  ? const LoginScreen()
                  : const DashboardScreen()));
        }
      } on SocketException catch (_) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        ));
      }
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
