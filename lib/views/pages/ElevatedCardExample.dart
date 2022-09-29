import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/views/pages/about.dart';
import 'package:hesperis_tamuda/views/pages/navigation_history.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/user/profil.dart';
import 'package:hesperis_tamuda/models/statut.dart';






class elevatedCardExample extends StatefulWidget {
final User user;
   
  const elevatedCardExample({Key? key, required this.user}) : super(key: key);

  @override
  State<elevatedCardExample> createState() => _elevatedCardExampleState();
}
  @override
  class _elevatedCardExampleState extends State<elevatedCardExample> {
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
    Items item1 = Items(
      title: "My profile",
      subtitle: "Check your profile now!",
      icon: Icons.portrait,
      page:  UserProfil(user: widget.user ),
      
  );

  Items item2 =  Items(
    title: "Download history",
    subtitle: "Download your history now!",
    icon: Icons.download,
    page: const ProfilePage(),
    
  );
  Items item3 = Items(
    title:  "Navigation history",
    subtitle: "Check your navigation!",
    icon: Icons.pages,
    page: const NavigationHistory(),
    
  );
  Items item4 = Items(
    title: "My messages",
    subtitle: "Check your messages!",
    icon: Icons.message,
    page: const AboutPage(),
    
  );
  Items item5 =  Items(
    title: "Settings",
    subtitle: "",
   icon: Icons.settings,
   page: const ProfilePage(),
  
  );
    List<Items> myList = [item1, item2, item3, item4, item5];
    var color = 0xff3b5998;
    return Flex(
      direction: Axis.vertical,
      children: [
        Flexible( 
          child: orientation==Orientation.portrait?GridView.count(
            childAspectRatio: 1.0,
            padding: const EdgeInsets.only(left: 16, right: 16),
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            children: myList.map((data) {
              return Container(
                decoration: BoxDecoration(
                  color: Color(color),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap:() {Navigator.of(context).push(MaterialPageRoute(builder: (context) =>   data.page,));},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     Icon(data.icon, size: 30, color: Colors.white),
                      const SizedBox(height: 14),
                      Text(
                        data.title,
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data.subtitle,
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 142, 236, 236),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    
                    ],
                  ),
                ),
              );
            }).toList(),
          ):GridView.count(
            childAspectRatio: 1.0,
            padding: const EdgeInsets.only(left: 16, right: 16),
            crossAxisCount: 4,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            children: myList.map((data) {
              return Container(
                decoration: BoxDecoration(
                  color: Color(color),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap:() {Navigator.of(context).push(MaterialPageRoute(builder: (context) =>   data.page,));},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                     Icon(data.icon, size: 30, color: Colors.white),
                      const SizedBox(height: 14),
                      Text(
                        data.title,
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        data.subtitle,
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 142, 236, 236),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}


class Items {
  String title;
  String subtitle;
  IconData icon;
  Widget page;
  // String title2;
  Items({required this.title, required this.subtitle,required this.icon,required this.page});
}



