import 'package:flutter/material.dart';

import '../pages/home.dart';

class NavBar extends StatelessWidget {
  const NavBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
      color: Colors.blueGrey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           const Image(image: AssetImage('assets/images/logo-hespéris.png')),
            ListTile(
              leading: const Icon(Icons.home),
              
              title: const Text("HOME"),
              onTap: () {const HomePage();},
            ),
            const ListTile(
              leading: Icon(Icons.more_vert),

              title:  Text("ABOUT"),
            ),
            const ListTile(
              leading:  Icon(Icons.people),

              title:  Text("EDITORIAL COMMITTEE"),
            ),
            const ListTile(
              leading: Icon(Icons.info),

              title:  Text("RECOMMANDATIONS"),
            ),
            const ListTile(
              leading: Icon(Icons.archive),

              title:  Text("ARCHIVES"),
            ),
            const ListTile(
              leading: Icon(Icons.archive),

              title:  Text("LAST ISSUES"),
            ),
            const ListTile(
              leading: Icon(Icons.contacts),

              title:  Text("CONTACT"),
            ),
            // ListTile(
            //   leading: const Icon(Icons.notifications),

            //   title: const Text("EDITORIAL COMMITTEE"),
            //   trailing: ClipOval(
            //     child:Container(
            //       color: Colors.red,
            //     width: 20,
            //     height : 20,
            //     child: const Center(
            //       child: Text(
            //         '9',
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 12
            //         ),
            //       ),
            //     ),
            //     ),
            //   ),
              
            // ),
            const ListTile(
              leading: Icon(Icons.settings),

              title:  Text("Paramètres"),
            ),
            const ListTile(
              leading: Icon(Icons.logout),

              title:  Text("Se déconnecter"),
            ),
        ],
      ),
      ),
    );
  }
}