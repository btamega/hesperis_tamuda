import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/menu/leftNavBar.dart';
import 'views/menu/rightNavBar.dart';
import 'views/pages/home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hespéris Tamuda',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Hespéris Tamuda'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: Text(widget.title),
        bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'HOME'),
              Tab(text: 'ABOUT'),
              Tab(text: 'EDITORIAL COMMITTEE'),
              Tab(text: 'RECOMMANDATIONS'),
              Tab(text: 'ARCHIVES'),
              Tab(text: 'LAST ISSUES'),
              Tab(text: 'CONTACT'),
            ],
          ),
        centerTitle: true,
      ),
      endDrawer: const DropDownMenu(),
      body: const SafeArea(
       bottom: false,
       child: TabBarView(
        children: [
          HomePage(),
          AboutPage(),
          EditorialCommitteePage(),
          RecommandationPage(),
          ArchivePage(),
          LastIssuesPage(),
          ContactPage(),
        ]
       ),
      )
      ),
    );
  }
}
