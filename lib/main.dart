import 'package:flutter/material.dart';
import 'views/include/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hespéris Tamuda',
      // theme: ThemeData(
      //   primarySwatch: Colors.blueGrey,
        
      // ),
      color: Color.fromARGB(191, 7, 10, 164),
      //  home: MenuDashboardPage(),
     home: MyHomePage(title: 'Hespéris Tamuda'),
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
    drawer: const NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text(widget.title),
    ),
   );
      
  }
  
}

