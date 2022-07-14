import 'package:flutter/material.dart';

import '../include/navbar.dart';
class LastIssuesPage extends StatelessWidget {
  const LastIssuesPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Last Issues Page'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}