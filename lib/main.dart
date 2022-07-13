import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/menu/navBar.dart';
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
    return Scaffold(
       drawer: const NavBar(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
     
      body: const Center(
       
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
