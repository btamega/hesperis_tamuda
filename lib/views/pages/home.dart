import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
class HomePage extends StatelessWidget {
  
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
