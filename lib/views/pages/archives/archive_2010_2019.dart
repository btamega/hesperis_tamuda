import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/constant.dart';
import 'package:hesperis_tamuda/models/volume.dart';
import 'package:hesperis_tamuda/services/data_service.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/archive_list.dart';
import 'package:hesperis_tamuda/views/pages/article_list.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';

class Archive20102019 extends StatefulWidget {
  const Archive20102019({Key? key}) : super(key: key);

  @override
  State<Archive20102019> createState() => _Archive20102019State();
}

class _Archive20102019State extends State<Archive20102019> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text("Hespéris Tamuda (2010-2019)"),
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
        body: FutureBuilder<Volume>(
            future: getArchives(2010, 2019),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: snapshot.data!.data.length,
                  itemBuilder: (context, index1) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              if (int.parse(snapshot.data!.data[index1].anne) <
                                  2016) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ArticleList(
                                            idFascicule: snapshot
                                                .data!
                                                .data[index1]
                                                .fascicules![0]
                                                .idFascicule,
                                            titreFascicule: snapshot
                                                    .data!
                                                    .data[index1]
                                                    .fascicules![0]
                                                    .nom +
                                                ' ' +
                                                snapshot.data!.data[index1]
                                                    .fascicules![0].numero +
                                                ' (' +
                                                snapshot.data!.data[index1]
                                                    .fascicules![0].anne +
                                                ')',
                                          )),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ArchiveListe(
                                            idVolume: snapshot
                                                .data!.data[index1].idVolume,
                                            volNom: snapshot
                                                    .data!.data[index1].titre +
                                                ' ' +
                                                snapshot.data!.data[index1]
                                                    .nomVolume,
                                          )),
                                );
                              }
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
                                  width: 300,
                                  height: 250),
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
                return Center(
                    child:
                        Text(serverError + "\n" + snapshot.error.toString()));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
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
