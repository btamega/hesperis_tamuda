import 'package:flutter/material.dart';

import '../include/navbar.dart';
class ArchivePage extends StatelessWidget {
  const ArchivePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Archives Page'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}