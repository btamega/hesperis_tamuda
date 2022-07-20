import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
class AboutPage extends StatefulWidget {
  const AboutPage({ Key? key }) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('ABOUT', style: GoogleFonts.ibarraRealNova(),),
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
                        "Hespéris-Tamuda or the March of History",
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
                            "To create a scientific journal is to create a way of being alive. But since man is only a creature, it is not enough for him to say “be” to something for it to be. When launching a journal, developers never know if it will disappear after a few deliveries/releases or if it will register in time and survive.\n", 
                            dropCap: DropCap(
                            width: 100,
                            height: 140,
                            child: const Image(image: AssetImage('assets/images/about.jpg'),),
                            ),
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                        ),
                        Text("This may have been the case with Hespéris. Held on the baptismal font by the highest authorities of the French Protectorate, endowed with necessary material means, animated by a team of scientists who were each in his specialty a figurehead, Hespéris, it is true, had, at the beginning, all the assets for it. But there was also a good chance it would fizzle out.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                         Text("It was too closely linked, at its birth in 1921, to the work of the Protectorate. The goal was to continue to probe into the mysteries of the protected society; taking over a country necessitated the possession of its secrets. This work was first conducted by the French Scientific Mission since 1904.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                        Text("In this land teeming with life and greenery, Hercules lived one of his adventures. In fact, “Hespéris” in Greek means sunset or the west. This is the exact translation of the Arabic word “Ma Ghrib.” Playing on words, the colonizer let appear the desire that tapped him to detach Morocco from its Arab-Muslim roots to better fix it in the movement of Europe.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Early on, however, the journal proved viable. Objective scientific research took precedence over the colonial enterprise. Scholars of the caliber of a Lévi-Provençal, a Georges Colin, or an Émile Laoust were not men to let themselves be dragged out of the truth. In addition, the journal was born at a convenient time. It responded to a dual cultural need. On the protector’s side, the time had come to move from punctual intelligence research to in-depth scientific research. On the side of the protected, it was necessary to question themselves by opening the school of modernity. Historians like ʿAbderraḥmāne Ibn Zaydāne, Abbāss Ibn Brāhim At-taʿārjī or Moḥammed Dāwūd were at work.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Hespéris lived devoting itself to the study of Morocco and its Maghreb and Andalusian environment. The orientation that the founding team gave it put the review out of the time allotted to the Protectorate. The Journal became by its holding one of the facades of the twentieth-century Moroccan. To continue to assume the publication was one of the responsibilities of the Faculty of Letters, created within the University Mohammed V, after the independence (1957). A team was formed where, progressively, took the step of the Moroccan researchers. Once Morocco regained its territorial unity, it was decided to merge into a single journal Hespéris, which was published in the former French zone, and Tamuda, which appeared in the former Spanish zone. Hence the new name of Hespéris-Tamuda. “Tamuda” is an ancient Amazigh village whose remains are visible to the southeast of Tetouan.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("The linchpin of this new stage and this new synthesis was our late colleague, Germain Ayache. Who better than he could ensure the continuation of such a publication and maintain it at a higher scientific level? Who better than he, an anti-colonialist militant suppressed for his commitment and his struggle, could safeguard past loyalties and create new ones? Associate of the French university and Moroccan Jew, proud of his Arab-Berber culture, he was able to ensure, with tenacity and self-sacrifice, the link between colonial time and the era of sovereignty recovered.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("After his death in 1990, another team I have the honor to coordinate, was formed to carry the torch. We are the generation of the promoters who must assume the double heritage. We inherited a historical school doubly rooted in Andalusian culture and in the Moroccan tradition. We are the grandsons of Abu-ʿObeyd Al-Bakrī or Ibn Al-Khatīb as much as those of Ibn Abī Zarʿ or Abū Al-Qāsim Az-Zayyānī. But we are also grateful disciples of our French and Spanish masters who have trained us in modern methodology and made us know the tremendous scientific capital that is theirs from Herodotus to the current production that keeps opening up new tracks to investigation.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Faithful to this double heritage, we wanted the journal to be as much a means of publicizing Moroccan research in the human sciences as a meeting place for foreign researchers. It can be written in four languages: Arabic, French, Spanish and English. It is another pledge to maintain the literary and methodological rigor at a high level. So it is always awaited and read by the international scientific community.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Moreover, the Faculty of Letters has decided to republish since the first deliveries. To possess the complete collection is to have at hand a sort of encyclopedia providing precise data on almost everything concerning Morocco in particular and the Muslim West in general, in terms of history, geography, sociology or linguistics.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Thanks to this Faculty, one can get a detailed and global perspective of ​​the Moroccan personality. The parable of the tree, which was loved by King Hassan II, finds its various justifications. The African roots, the junction with the European shore since ancient times, the links with the East, before and after Islam, are attested in length of pages and booklets. Hespéris-Tamuda is the scientific materialization of this parable that says in a word what has been the past and what must be the future. In other words, a destiny, where the past, loaded with determination, is a guarantee of the future. All in all, the colonial page was a kind of storm as violent as fleeting that allowed us to make a new start in history. We learned to look at ourselves with a critical eye. Hespéris-Tamuda is one of the most fruitful illustrations of this approach. That’s why it is still alive. Time has made it a kind of institution. By publishing this special issue on the occasion of the 50th anniversary of its creation, the Faculty of Arts and Humanities of Rabat, editor of the journal, wants to highlight the weight of this institution.\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("Brahim Boutaleb, Hespéris-Tamuda. Vol. XLII. Fascicule unique 2007, 11-13\n", 
                            style: GoogleFonts.ibarraRealNova(textStyle:const TextStyle(fontSize: 20.0,),color: const Color(0xff000000)), textAlign:TextAlign.justify
                          ),
                          Text("On the occasion of the 50th anniversary of creation, the Faculty of Arts and Humanities of Rabat\n", 
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