import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
class HomePage extends StatelessWidget {
  
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('HOME'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Column(
                    children: [
                       const Text(
                        "A Centenary Review Facing the Challenges of Change",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Row(
                          children:const[
                             Image(image: AssetImage('assets/images/logo-hespéris.png'),width: 200,),
                             Text("Hesperis Tamuda"),
                            // ParagraphBuilder(ParagraphStyle(textAlign: TextAlign.center)).,
                          ],
                          
                        )
                      ),
                      // ListView(
                      //   children: const <Widget> [
                      //     Image(image: AssetImage('assets/images/logo-hespéris.png')),
                      //       SizedBox(
                      //         height: 48,
                      //       ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    
    );
  }
}

