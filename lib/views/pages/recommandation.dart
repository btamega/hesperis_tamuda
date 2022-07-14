import 'package:flutter/material.dart';

import '../include/navbar.dart';

class RecommandationPage extends StatelessWidget {
  const RecommandationPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Recommandation Page'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}