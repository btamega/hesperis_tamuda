import 'package:flutter/material.dart';

import '../include/navbar.dart';

class EditorialCommitteePage extends StatelessWidget {
  const EditorialCommitteePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Editorial committee Page'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
    );  
  }
}