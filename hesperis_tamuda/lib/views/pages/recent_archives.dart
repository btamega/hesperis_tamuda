import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/constant.dart';
import 'package:hesperis_tamuda/services/data_service.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/archive_list.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';

class RecentArchives extends StatefulWidget {
  const RecentArchives({Key? key}) : super(key: key);

  @override
  State<RecentArchives> createState() => _RecentArchivesState();
}

class _RecentArchivesState extends State<RecentArchives> {
  int _selectedIndex = 0;
  late Orientation orientation;
  late Size size;
  late double height;
  late double width;
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
          title: const Text("Hespéris Tamuda"),
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
            await fetchVolume(context);
          },
          child: FutureBuilder<dynamic>(
              future: fetchVolume(context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return orientation == Orientation.portrait
                      ? GridView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: snapshot.data!.data.length,
                          itemBuilder: (context, index1) {
                            return Container(
                              height: height / 2.5,
                              // padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              child: ListView(
                                physics: const ClampingScrollPhysics(),
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ArchiveListe(
                                                  idVolume: snapshot.data!
                                                      .data[index1].idVolume,
                                                  volNom: snapshot.data!
                                                          .data[index1].titre +
                                                      ' ' +
                                                      snapshot
                                                          .data!
                                                          .data[index1]
                                                          .nomVolume,
                                                )),
                                      );
                                    },
                                    child: Column(children: [
                                      Text(
                                        snapshot.data!.data[index1].titre,
                                        textAlign: TextAlign.center,
                                      ),
                                      Image.network(
                                        rootURL +
                                            '/' +
                                            snapshot.data!.data[index1].cover,
                                        // width: 300,
                                        height: height / 2.8,
                                      ),
                                      Text(
                                        snapshot.data!.data[index1].anne,
                                        textAlign: TextAlign.center,
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: width / (height),
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
                          itemCount: snapshot.data!.data.length,
                          itemBuilder: (context, index1) {
                            return Container(
                              padding: const EdgeInsets.all(19),
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              child: ListView(
                                physics: const ClampingScrollPhysics(),
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ArchiveListe(
                                                  idVolume: snapshot.data!
                                                      .data[index1].idVolume,
                                                  volNom: snapshot.data!
                                                          .data[index1].titre +
                                                      ' ' +
                                                      snapshot
                                                          .data!
                                                          .data[index1]
                                                          .nomVolume,
                                                )),
                                      );
                                    },
                                    child: Column(children: [
                                      Text(
                                        snapshot.data!.data[index1].titre,
                                        textAlign: TextAlign.center,
                                      ),
                                      Image.network(
                                        rootURL +
                                            '/' +
                                            snapshot.data!.data[index1].cover,
                                        // // width: 300,
                                        // height: height / 2.7,
                                      ),
                                      Text(
                                        snapshot.data!.data[index1].anne,
                                        textAlign: TextAlign.center,
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            );
                          },
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: width / (height / 0.32),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3,
                          ),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(20),
                          scrollDirection: Axis.vertical,
                        );
                } else if (snapshot.hasError) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/images/animation_500_l8rqndep.gif",
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
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
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
}
