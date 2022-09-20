import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ElevatedCardExample extends StatelessWidget {
  Items item1 = new Items(
      title: "My profile",
      subtitle: "Check your profile now!",
      // event: "3 Events");
      // icon: Icon(Icons.portrait),
  );

  Items item2 = new Items(
    title: "Download history",
    subtitle: "Download your history now!",
    // event: "4 Items",
    // icon: Icon(Icons.download),
  );
  Items item3 = new Items(
    title:  "Navigation history",
    subtitle: "Check your navigation!",
    // event: "",
  //   icon: Icon(Icons.pages),
  );
  Items item4 = new Items(
    title: "My messages",
    subtitle: "Check your messages!",
    // icon: Icon(Icons.message),
  );
  Items item5 = new Items(
    title: "Settings",
    subtitle: "",
    // event: "4 Items",
  //  icon: Icon(Icons.message),
  );
  
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5];
    var color = 0xFF0091F6;
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return Container(
            decoration: BoxDecoration(
              color: Color(color),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Image.asset(data.icon, width: 42),
                SizedBox(height: 14),
                Text(
                  data.title,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  data.subtitle,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Color.fromARGB(255, 142, 236, 236),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                // SizedBox(height: 14),
                // // Text(
                // //   data.event,
                // //   style: GoogleFonts.openSans(
                // //     textStyle: TextStyle(
                // //       color: Colors.white70,
                // //       fontSize: 11,
                // //       fontWeight: FontWeight.w600,
                // //     ),
                // //   ),
                // // ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Items {
  String title;
  String subtitle;
  // String event;
  // String icon;
  Items({required this.title, required this.subtitle});
}


