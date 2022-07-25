import 'package:flutter/material.dart';

import '../pages/about.dart';
import '../pages/archives.dart';
import '../pages/contact.dart';
import '../pages/editorial.dart';
import '../pages/lastIssues.dart';
import '../pages/recommandation.dart';
class Header extends StatelessWidget {
  const Header({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return DefaultTabController(
      length: 7,
      child: Scaffold(
      // drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("Hespéris Tamuda"),
        bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.home),text: 'HOME'),
              Tab(icon: Icon(Icons.more),text: 'ABOUT'),
              Tab(icon: Icon(Icons.people),text: 'EDITORIAL COMMITTEE'),
              Tab(icon: Icon(Icons.info),text: 'RECOMMANDATIONS'),
              Tab(icon: Icon(Icons.archive),text: 'ARCHIVES'),
              Tab(icon: Icon(Icons.archive),text: 'LAST ISSUES'),
              Tab(icon: Icon(Icons.contacts),text: 'CONTACT'),
            ],
          ),
        centerTitle: true,
      ),
      body:const SafeArea(
       bottom: false,
       child: TabBarView(
        children: [
          TestPage(),
          AboutPage(),
          EditorialCommitteePage(),
          RecommandationPage(),
          ArchivePage(),
          LastIssuesPage(),
          ContactPage(),
        ]
       ),
      ),
     )
     );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}