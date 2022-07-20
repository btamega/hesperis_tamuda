import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('HOME', style: GoogleFonts.ibarraRealNova(),),
        centerTitle: true,
        backgroundColor: const Color(0xff3b5998),
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Column(
                    children: [
                      Text(
                        "A Centenary Review Facing the Challenges of Change",
                        style: GoogleFonts.ibarraRealNova(
                          textStyle:const TextStyle(
                           fontSize: 28.0,
                           fontWeight: FontWeight.bold,
                           color: Color(0xff3b5998),
                        ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                        children: <Widget> [
                           DropCapText(
                            "The academic journal Hespéris was founded in 1921, only a year after the creation of the Institut des Hautes Etudes Marocaines in Rabat by the French protectorate authorities. The balance sheet of this publication until 1959 totals the production of 47 volumes, with one or more issues per year containing background articles, historical and geographical studies, unpublished documents, as well as reviews of new publications on Morocco and the Muslim West. The Spanish protectorate authorities in the Khalifian Zone (northern Morocco) had created a similar review entitled Tamuda, which published texts of the same nature as Hespéris in Spanish.\n", 
                            dropCap: DropCap(
                            width: 100,
                            height: 200,
                            child: const Image(image: AssetImage('assets/images/accueil.jpeg'),),
                            ),
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                        ),
                        Text("After the independence of Morocco and the creation of the Faculty of Arts and Humanities in Rabat in 1957, Hespéris was merged with Tamuda, which appeared in Tetouan, in 1960 thus giving birth to Hespéris-Tamuda. It was the beginning of an academic and multidisciplinary journal devoted to the study of Morocco and the dissemination of knowledge relating to its society, history, culture and the social sciences of the Muslim West and the Mediterranean. Hespéris-Tamuda has been published annually since 1960 in one or more fascicles, with the emergence of articles and book reviews written in Arabic from 1991 onwards.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                        Text("While remaining faithful to its spirit of scientific rigor under the patronage of the current dean of the Faculty of Arts and Humanities of Rabat Professor Jamal Eddine El Hani since the beginning of 2015, Hespéris-Tamuda has published original articles, papers on bibliographical and archival studies and book reviews in Arabic, French, English and Spanish. The emphasis has been on the multidisciplinary enlargement of its scientific and editorial committee, both nationally and internationally, with the adoption of a new strategy based on openness to other fields of research in the human and social sciences. Morocco’s premium academic journal has been put on the rails of international indexing, as was the case recently with Thomson Reuters Web of Science Core Collection located in Philadelphia (USA).\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                        Text("Published by the Faculty of Arts and Humanities (Mohammed V University Rabat, Morocco), Hespéris-Tamuda (Annual ISSN: 0018-1005) has been selected to feature in the products and services of Clarivate Analytics since 2016. The journal has been indexed in the category titled Emerging Sources Citation Index (ESCI). In the future, Hespéris-Tamuda could be submitted for inclusion in other Clarivate Analytics products and services to be able to better meet the needs of researchers around the world. In this year (2021), the journal celebrated the centenary of its existence with new scientific activities, in collaboration with major partners, in Morocco, Europe, and the United States.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                        ]
                        )
                      ),
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
}