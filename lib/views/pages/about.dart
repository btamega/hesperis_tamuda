import 'package:flutter/material.dart';

import '../include/navbar.dart';
class AboutPage extends StatelessWidget {
  const AboutPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('About Page'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}