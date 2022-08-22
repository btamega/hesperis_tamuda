import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/services/data_service.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/profile.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../menu/language.dart';
import 'package:expandable/expandable.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
class ContactPage extends StatefulWidget {
  const ContactPage({ Key? key }) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.contact, style: GoogleFonts.ibarraRealNova(),),
        centerTitle: true,
        backgroundColor: const Color(0xff3b5998),
        actions: const [LanguagePickerWidget()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
        onTap: _onItemTapped,
        ),
        body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const <Widget>[
            Card1(),
          ],
        ),
        ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex==0) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage(),));
    } else if(_selectedIndex==1){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchPage(),));
    }else{
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage(),));
    }
  }
}

class Card1 extends StatefulWidget {
  const Card1({ Key? key }) : super(key: key);

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool isCreated = false;
  final _formKey = GlobalKey<FormState>();
  @override
   Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Column(
                    children: [
                      Text(
                        "Khalid Ben Srhir Coordinateur Scientifique",
                        style: GoogleFonts.ibarraRealNova(
                          textStyle:const TextStyle(
                           fontSize: 20.0,
                           fontWeight: FontWeight.bold,
                          //  color: Color(0xff3b5998),
                        ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                    ],
                  )
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: const Padding(
                    padding:  EdgeInsets.all(10),
                    child: Text(
                      "Formulaire de contact",
                      // style: Theme.of(context).textTheme.body2,
                    )),
                collapsed:  Column(
                 children: [
                  ListTile(
                  leading:const Icon(Icons.email,color: Colors.red,),
                  title: const Text("khalidbensrhir@gmail.com", style: TextStyle(color: Colors.blue),),
                  onTap:() {
                      final Uri params = Uri(
                      scheme: 'mailto',
                      path: 'khalidbensrhir@gmail.com',
                    );
                    final url = params.toString();
                    // ignore: deprecated_member_use
                      launch(url);
                    }, 
                ),
                 const ListTile(
                  leading:  Icon(Icons.gps_fixed,color: Colors.blue,),
                  title:  Text("Faculté de Lettre et des Sciences Humaines BP 1040 Rabat Maroc",),
                  onTap: null,
                ),
                 ],
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                       Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: _emailController,
                                  enableSuggestions: true,
                                  decoration: const InputDecoration(
                                    hintText: "Adresse Email"
                                  ),
                                  autocorrect:true ,
                                  keyboardType:TextInputType.emailAddress ,
                                  validator: (value){
                                    if(value == null || value.isEmpty){
                                      return "Email field can not be empty";
                                    }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                                      return "Your email doesn't match the email standart";
                                    }
                                    else{
                                      return null;
                                    }
                                  },
                                  ),
                                  TextFormField(
                                  controller: _userNameController,
                                  enableSuggestions: true,
                                  decoration: const InputDecoration(
                                    hintText: "Votre Nom"
                                  ),
                                  autocorrect:true ,
                                  keyboardType:TextInputType.name ,
                                  validator: (value){
                                    if(value == null ||value.isEmpty){
                                      return "Username can not be empty";
                                    }else if(!RegExp(r"^[a-z A-Z]+$").hasMatch(value)){
                                      return "Incorrect username";
                                    }
                                    else{
                                      return null;
                                    }
                                  },
                                  ),
                                  TextFormField(
                                    controller: _messageController,
                                    validator: (value){
                                    if(value!.isEmpty){
                                      return "Body can not be empty";
                                    }else{
                                      return null;
                                    }
                                  },
                                  enableSuggestions: true,
                                  decoration: const InputDecoration(
                                    hintText: "Message",
                                    // border: InputBorder.none
                                  ),
                                  maxLines: 10,
                                  autocorrect:true ,
                                  keyboardType:TextInputType.multiline ,
                                  
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        try {
                                          setState(() {
                                          createCommentaire(_emailController.text,_userNameController.text,_messageController.text);
                                        } );
                                        AwesomeDialog(
                                        context: context,
                                        headerAnimationLoop: true,
                                        animType: AnimType.BOTTOMSLIDE,
                                        title: 'INFO',
                                        desc:AppLocalizations.of(context)!.messageSent,
                                        btnOkOnPress: () {
                                          Navigator.of(context).pop();
                                        },
                                      ).show();
                                        } catch (e) {
                                          AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.ERROR,
                                        animType: AnimType.RIGHSLIDE,
                                        headerAnimationLoop: true,
                                        title: 'Error',
                                        desc:
                                            e.toString(),
                                        btnOkOnPress: () {},
                                        btnOkColor: Colors.red,
                                      ).show();
                                        }
                                        
                                      }else{
                                        AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.ERROR,
                                        animType: AnimType.RIGHSLIDE,
                                        headerAnimationLoop: true,
                                        title: 'Error',
                                        desc:
                                            'Error, try again !',
                                        btnOkOnPress: () {},
                                        btnOkColor: Colors.red,
                                      ).show();
                                      }
                                    },
                                    style: TextButton.styleFrom(backgroundColor: Colors.red, primary: Colors.white),
                                    child: const Text("Envoyer"),
                                    ),
                              ],
                              
                            ),
                          ),
                          ),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}