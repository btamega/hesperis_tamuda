import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/constant.dart';
import 'package:hesperis_tamuda/models/volume.dart';
import 'package:hesperis_tamuda/services/data_service.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/pages/archive_list.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1921_1929.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1930_1939.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1940_1949.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1950_1959.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1960_1969.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1970_1979.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1980_1989.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_1990_1999.dart';
import 'package:hesperis_tamuda/views/pages/archives/archive_2000_2009.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../menu/language.dart';
import 'about.dart';
import 'archives/archive_2010_2019.dart';
import 'contact.dart';
import 'editorial.dart';
import 'ethic.dart';
import 'last_issues.dart';
import 'recommandation.dart';
class ArchivePage extends StatefulWidget {
  const ArchivePage({ Key? key }) : super(key: key);

  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
 
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.archive, style: GoogleFonts.ibarraRealNova(),),
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
        padding: const EdgeInsets.all(19),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: (200 / 350),
        children: <Widget>[
          FutureBuilder<Volume>(
            future: fetchVolume(),
            builder: (context,snapshot){
              if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.data.length,
                itemBuilder: (context,index1){
                  return Container(
                    padding: const EdgeInsets.all(19),
                    decoration: BoxDecoration(border: Border.all(),),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ArchiveListe(idVolume: snapshot.data!.data[index1].idVolume, volNom: snapshot.data!.data[index1].titre+' '+snapshot.data!.data[index1].nomVolume,)),
                            );
                            },
                            child: Column(children:[
                               Text(snapshot.data!.data[index1].titre, textAlign: TextAlign.center,),
                               Image.network(
                                          rootURL+'/'+snapshot.data!.data[index1].cover,
                                          width: 300,
                                          height:250
                                        ),
                               Text(snapshot.data!.data[index1].anne, textAlign: TextAlign.center,),
                            ]),
                        ),
                      ],
                    ),
                );
                }
                );
              }else if(snapshot.hasError){
                return Text(serverError+"\n"+snapshot.error.toString());
              }
              else{
                return const Center(child: CircularProgressIndicator(),);
              }
            }
            ),
           
        //   Container(
        //     padding: const EdgeInsets.all(19),
        //     decoration: BoxDecoration(border: Border.all(),),
        //     child: Column(
        //       children: [
        //         InkWell(
        //           onTap: (){
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(builder: (context) => const ArchiveListe()),
        //             );
        //             },
        //             child: Column(children: const[
        //               Text("Hespéris-Tamuda", textAlign: TextAlign.center,),
        //               Image(image: AssetImage("assets/images/cover2020.gif"),),
        //               Text("(2020-2021)\n", textAlign: TextAlign.center,),
        //             ]),
        //         ),
        //       ],
        //     ),
        // ),
        Container(
          decoration: BoxDecoration(border: Border.all(),),
          padding: const EdgeInsets.all(19),
          // color: Colors.teal[100],
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive20102019()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris-Tamuda ", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/2001-2.png"),),
                      Text("(2010-2019)\n", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(19),
          // color: Colors.teal[300],
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive20002009()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris-Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/2001-2.png"),),
                      Text("(2000-2009)\n", textAlign: TextAlign.center,),
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
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive19901999()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris-Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1991.jpg"),),
                      Text("(1990-1999)\n", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(19),
          // color: Colors.teal[400],
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive19801989()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris-Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1980-81.png"),),
                      Text("(1980-1989)\n", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(19),
          // color: Colors.teal[400],
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive19701979()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris-Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1972.png"),),
                      Text("(1970-1979)\n", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(19),
          // color: Colors.teal[300],
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive19601969()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris-Tamuda", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1966.png"),),
                      Text("(1960-1969)\n", textAlign: TextAlign.center,),
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
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive19501959()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1952ht.png"),),
                      Text("(1950-1959)\n", textAlign: TextAlign.center,),
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
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive19401949()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1943ht.jpg"),fit: BoxFit.fill,),
                      Text("(1940-1949)\n", textAlign: TextAlign.center,),
                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(21),
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive19301939()),
                    );
                    },
                    child: Column(children: const[
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image: AssetImage("assets/images/1931ht.jpg"),),
                      Text("(1930-1939)\n", textAlign: TextAlign.center,),

                    ]),
                ),
              ],
            ),
        ),
        Container(
          padding: const EdgeInsets.all(19),
          // color: Colors.teal[400],
          decoration: BoxDecoration(border: Border.all(),),
          child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Archive19201929()),
                    );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:const [
                      Text("Hespéris", textAlign: TextAlign.center,),
                      Image(image:  AssetImage("assets/images/1921ht.jpg"),),
                      Text("(1921-1929)", textAlign: TextAlign.center,),

                    ],
                    
                    ),
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

  void getItemAndNavigate(int idVolume, BuildContext context) {
    
  }
  
}