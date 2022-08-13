import 'package:hesperis_tamuda/constant.dart';
import 'package:hesperis_tamuda/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/models/volume.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/pages/archives.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
import '../menu/language.dart';
import 'about.dart';
import 'article_list.dart';
import 'contact.dart';
import 'editorial.dart';
import 'ethic.dart';
import 'last_issues.dart';
import 'recommandation.dart';
class ArchiveListe extends StatefulWidget {
  final int idVolume;
  final String volNom;
  const ArchiveListe({ Key? key, required this.idVolume, required this.volNom }) : super(key: key);

  @override
  State<ArchiveListe> createState() => _ArchiveListeState();
}

class _ArchiveListeState extends State<ArchiveListe> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(widget.volNom, style: GoogleFonts.ibarraRealNova(),),
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
        body:FutureBuilder<Volume>(
           future: getFascicules(widget.idVolume),
          builder: (context, snapshot) {
                  if (snapshot.hasData) {
                        return GridView.builder(
                          padding: const EdgeInsets.all(20),
                          itemCount: snapshot.data!.data[0].fascicules!.length,
                            itemBuilder: (context, index1) { 
                              return Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(border: Border.all(),),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ArticleList(
                                          idFascicule: snapshot.data!.data[0].fascicules![index1].idFascicule, 
                                          titreFascicule: snapshot.data!.data[0].fascicules![index1].nom+' '+snapshot.data!.data[0].fascicules![index1].numero+' ('+snapshot.data!.data[0].fascicules![index1].anne+')',)
                                          ),
                                      );
                                      },
                                      onDoubleTap: (){
                                      selectedItem(context, 0);
                                      },
                                      child: Column(children:[
                                        Text(snapshot.data!.data[0].fascicules![index1].nom+' '+snapshot.data!.data[0].fascicules![index1].numero, 
                                        textAlign: TextAlign.center),
                                        Image.network(
                                          rootURL+'/'+snapshot.data!.data[0].cover,
                                          width: 300,
                                          height:250
                                        ),
                                        Text(snapshot.data!.data[0].fascicules![index1].anne, textAlign: TextAlign.center,),
                                      ]),
                                  ),
                                ],
                              ),
                          );
                             }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (200 / 350),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                          ),
                            
                            );
                  } else if(snapshot.hasError){
                    return Text(serverError+"\n"+snapshot.error.toString());
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
        )
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
}