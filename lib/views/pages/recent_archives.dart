import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/constant.dart';
import 'package:hesperis_tamuda/models/volume.dart';
import 'package:hesperis_tamuda/services/data_service.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/archive_list.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';

class RecentArchives extends StatefulWidget {
  const RecentArchives({ Key? key }) : super(key: key);

  @override
  State<RecentArchives> createState() => _RecentArchivesState();
}

class _RecentArchivesState extends State<RecentArchives> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
        onTap: _onItemTapped,
        ),
      body: FutureBuilder<Volume>(
            future: fetchVolume(),
            builder: (context,snapshot){
              if(snapshot.hasData){
              return GridView.builder(
                itemCount: snapshot.data!.data.length,
                itemBuilder: (context,index1){
                  return Container(
                    padding: const EdgeInsets.all(10),
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
                }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: (200 / 350),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(20),
                      scrollDirection: Axis.vertical,
                );
              }else if(snapshot.hasError){
                return Center(child:Text(serverError+"\n"+snapshot.error.toString()));
              }
              else{
                return const Center(child: CircularProgressIndicator(),);
              }
            }
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