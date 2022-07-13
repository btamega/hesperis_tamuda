import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
      color: Colors.blueGrey,
      child: ListView(
        
        children: const [
          
          // const Image(
          //   accountName: Text('Hespéris Tamuda'), 
          //   // accountEmail: Text("bougarytamega77@gmail.com"),
          //   currentAccountPicture: CircleAvatar(
          //     child: ClipOval(
          //     child: Image(
          //       image: AssetImage(
          //         '../assets/images/logo hespéris.png',
          //         package: 'flutter_gallery_assets',
          //       )
          //     ),
          //     ),
          //   ),
          //   ),
            ListTile(
              leading: Icon(Icons.home),
              
              title: Text("HOME"),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.more_vert),

              title: Text("ABOUT"),
            ),
            ListTile(
              leading: Icon(Icons.people),

              title: Text("EDITORIAL COMMITTEE"),
            ),
            ListTile(
              leading: Icon(Icons.info),

              title: Text("RECOMMANDATIONS"),
            ),
            ListTile(
              leading: Icon(Icons.archive),

              title: Text("ARCHIVES"),
            ),
            ListTile(
              leading: Icon(Icons.archive),

              title: Text("LAST ISSUES"),
            ),
            ListTile(
              leading: Icon(Icons.contacts),

              title: Text("CONTACT"),
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
            ListTile(
              leading: Icon(Icons.settings),

              title: Text("Paramètres"),
            ),
            ListTile(
              leading: Icon(Icons.logout),

              title: Text("Se déconnecter"),
            ),
        ],
      ),
      ),
    );
  }
}