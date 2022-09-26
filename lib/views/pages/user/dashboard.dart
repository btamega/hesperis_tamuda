import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/models/statut.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/widgets/circle_gradient_icon.dart';

import '../elevatedCardExample.dart';



class UserDashboard extends StatefulWidget {
  final User user;
  
  const UserDashboard({Key? key, required this.user}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: const Color(0xff3b5998),
          title: Text(
            widget.user.name,
                 style: TextStyle(color: const Color.fromARGB(255, 255, 254, 254).withOpacity(1.0)),
          ),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CircleGradientIcon(
                onTap: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.QUESTION,
                    headerAnimationLoop: false,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Log out',
                    desc: 'Are you sure to log out ?',
                    buttonsTextStyle: const TextStyle(color: Colors.black),
                    showCloseIcon: true,
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage(),));
                    },
                  ).show();
                },
                icon: Icons.logout,
                color: Colors.red,

                iconSize: 24,
                size: 40,
              ),
            )
          ],
          // leading: Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: CircleGradientIcon(
          //       onTap: () {
              
          //       },
          //       icon: Icons.menu,
          //       color: Colors.blue,
          //       iconSize: 24,
          //       size: 40,
          //     ),
          // ),
        ),
        extendBody: true,
      body: Padding(
      padding: const EdgeInsets.only(top: 60.0),
            // Spacer(),
            child:elevatedCardExample(user: widget.user,),
             
  ),
      ),
    );
  }

  
  }
  

 
  
  


  

 


