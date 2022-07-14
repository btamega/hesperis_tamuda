import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';

import '../pages/about.dart';
import '../pages/archives.dart';
import '../pages/contact.dart';
import '../pages/editorial.dart';
import '../pages/lastIssues.dart';
import '../pages/recommandation.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(191, 7, 10, 164),
        child: ListView(
          children: <Widget> [
           const Image(image: AssetImage('assets/images/logo-hespéris.png')),
             const SizedBox(
              height: 48,
            ),
            buildMenuItem(
              text: 'HOME',
              icon: Icons.home,
              onClicked: ()=>selectedItem(context, 0),
            ),
            buildMenuItem(
              text: 'ABOUT',
              icon: Icons.more_horiz,
              onClicked: ()=>selectedItem(context, 1),
            ),
            buildMenuItem(
              text: 'EDITORIAL COMMITTEE',
              icon: Icons.people,
              onClicked: ()=>selectedItem(context, 2),
            ),
            buildMenuItem(
              text: 'RECOMMANDATIONS',
              icon: Icons.info,
              onClicked: ()=>selectedItem(context, 3),
            ),
            buildMenuItem(
              text: 'ARCHIVES',
              icon: Icons.home,
              onClicked: ()=>selectedItem(context, 4),
            ),
            buildMenuItem(
              text: 'LAST ISSUES',
              icon: Icons.home,
              onClicked: ()=>selectedItem(context, 5),
            ),
            buildMenuItem(
              text: 'CONTACT',
              icon: Icons.contacts,
              onClicked: ()=>selectedItem(context, 6),
            ),
            const SizedBox(height: 24,),
            const Divider(color: Colors.white,),
            buildMenuItem(
              text: '#hesperistamuda',
              icon: Icons.facebook,
            ),
            
          ],
        ),
      ),
    );
  }
  Widget buildMenuItem({
      required String text,
      required IconData icon,
      VoidCallback? onClicked,
    }){
      const color = Colors.white;
      const hoverColor = Colors.white;
      return ListTile(
        leading: Icon(icon,color: color,),
        title: Text(text,style: const TextStyle(color: color)),
        hoverColor: hoverColor,
        onTap: onClicked,
      );
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
      case 4:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ArchivePage(),));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LastIssuesPage(),));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ContactPage(),));
        break;
      default:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage(),));
    }
  }
}