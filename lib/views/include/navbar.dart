import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../pages/about.dart';
import '../pages/archives.dart';
import '../pages/contact.dart';
import '../pages/editorial.dart';
import '../pages/ethic.dart';
import '../pages/lastIssues.dart';
import '../pages/recommandation.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color:const Color(0xff3b5998),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget> [
           const Image(image: AssetImage('assets/images/logo-hespéris.png')),
             const SizedBox(
              height: 48,
            ),
            buildMenuItem(
              text: AppLocalizations.of(context)!.accueil,
              icon: Icons.home,
              onClicked: ()=>selectedItem(context, 0),
            ),
            buildMenuItem(
              text: AppLocalizations.of(context)!.a_propos,
              icon: Icons.more_horiz,
              onClicked: ()=>selectedItem(context, 1),
            ),
            buildMenuItem(
              text: AppLocalizations.of(context)!.comiteEditorial,
              icon: Icons.people,
              onClicked: ()=>selectedItem(context, 2),
            ),
            buildMenuItem(
              text: AppLocalizations.of(context)!.recommandation,
              icon: Icons.info,
              onClicked: ()=>selectedItem(context, 3),
            ),
            buildMenuItem(
              text: AppLocalizations.of(context)!.titreEthique,
              icon: Icons.publish,
              onClicked: ()=>selectedItem(context, 4),
            ),
            buildMenuItem(
              text: AppLocalizations.of(context)!.archive,
              icon: Icons.archive,
              onClicked: ()=>selectedItem(context, 5),
            ),
            buildMenuItem(
              text: AppLocalizations.of(context)!.derniersVolumes,
              icon: Icons.archive,
              onClicked: ()=>selectedItem(context, 6),
            ),
            buildMenuItem(
              text: AppLocalizations.of(context)!.contact,
              icon: Icons.contacts,
              onClicked: ()=>selectedItem(context, 7),
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