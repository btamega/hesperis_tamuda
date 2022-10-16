import 'dart:io';
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/models/statut.dart';
import 'package:hesperis_tamuda/services/data_service.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
import 'package:hesperis_tamuda/views/pages/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'errorPage.dart';
import 'loginScreen.dart';
import 'user/dashboard_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(
            'PROFILE',
            style: GoogleFonts.ibarraRealNova(),
          ),
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
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          onTap: _onItemTapped,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                const Positioned(
                  top: 200,
                  left: -100,
                  child: SizedBox(
                    width: 300,
                    height: 200,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: -10,
                  child: SizedBox(
                    width: 200,
                    height: 100,
                  ),
                ),
                Positioned(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 80,
                      sigmaY: 80,
                    ),
                    child: Container(),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        _logo(),
                        _loginLabel(context),
                        const SizedBox(
                          height: 50,
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      color: Color(0xff8fa1b6),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  cursorColor: Colors.red,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Email field can not be empty";
                                    } else if (!RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value)) {
                                      return "Your email doesn't match the email standart";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "yourname@example.com",
                                    hintStyle: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        color: Color(0xffc5d2e1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                      ),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffdfe8f3)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Password",
                                  style: GoogleFonts.ibarraRealNova(
                                    textStyle: const TextStyle(
                                      color: Color(0xff8fa1b6),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  cursorColor: Colors.red,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password field can not be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "yourpassword",
                                    hintStyle: GoogleFonts.ibarraRealNova(
                                      textStyle: const TextStyle(
                                        color: Color(0xffc5d2e1),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                      ),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffdfe8f3)),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Color(0xff3b5998),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                Statut statut;
                                try {
                                  statut = await authenticate(
                                      _emailController.text,
                                      _passwordController.text);
                                  if (statut.error != null &&
                                      statut.error!.isNotEmpty) {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.ERROR,
                                      animType: AnimType.RIGHSLIDE,
                                      headerAnimationLoop: true,
                                      title: 'Error',
                                      desc: statut.error,
                                      btnOkOnPress: () {},
                                      btnOkColor: Colors.red,
                                    ).show();
                                  } else if (statut.error == null &&
                                      statut.success!.isNotEmpty) {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.SUCCES,
                                      headerAnimationLoop: true,
                                      animType: AnimType.BOTTOMSLIDE,
                                      title: 'SUCCESS',
                                      desc: statut.success,
                                      btnOkOnPress: () async {
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        prefs.setString(
                                            'email', statut.user!.email);
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const DashboardScreen()));
                                      },
                                    ).show();
                                  }
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } catch (e) {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.ERROR,
                                    animType: AnimType.RIGHSLIDE,
                                    headerAnimationLoop: true,
                                    title: 'Error',
                                    desc: e.toString(),
                                    btnOkOnPress: () {},
                                    btnOkColor: Colors.red,
                                  ).show();
                                }
                              } else {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.ERROR,
                                  animType: AnimType.RIGHSLIDE,
                                  headerAnimationLoop: true,
                                  title: 'Error',
                                  desc: 'Try again !',
                                  btnOkOnPress: () {},
                                  btnOkColor: Colors.red,
                                ).show();
                              }
                            },
                            child: Text(
                              AppLocalizations.of(context)!.login,
                              style: GoogleFonts.ibarraRealNova(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          AppLocalizations.of(context)!.anyAccount,
                          style: GoogleFonts.ibarraRealNova(
                            textStyle: const TextStyle(
                              color: Color(0xff909090),
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _signUpLabel(context, const Color(0xff164276)),
                        const SizedBox(
                          height: 35,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
    if (_selectedIndex == 0) {
      try {
        final result = await InternetAddress.lookup('www.google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        }
      } on SocketException catch (_) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        ));
      }
    } else if (_selectedIndex == 1) {
      try {
        final result = await InternetAddress.lookup('www.google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SearchPage(),
          ));
        }
      } on SocketException catch (_) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        ));
      }
    } else {
      try {
        final result = await InternetAddress.lookup('www.google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String? email = prefs.getString("email");
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => email == null
                  ? const LoginScreen()
                  : const DashboardScreen()));
        }
      } on SocketException catch (_) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        ));
      }
    }
  }
}

Widget _signUpLabel(BuildContext context, Color textColor) {
  return InkWell(
    child: Text(
      AppLocalizations.of(context)!.register,
      style: GoogleFonts.ibarraRealNova(
        textStyle: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
      ),
    ),
    onTap: () {
      final _formKey = GlobalKey<FormState>();
      late AwesomeDialog dialog;
      final TextEditingController _emailController = TextEditingController();
      final TextEditingController _userNameController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();
      final TextEditingController _passwordConfirmController =
          TextEditingController();
      dialog = AwesomeDialog(
        context: context,
        animType: AnimType.SCALE,
        dialogType: DialogType.INFO,
        keyboardAware: true,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)!.register,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 0,
                  color: Colors.blueGrey.withAlpha(40),
                  child: TextFormField(
                    controller: _userNameController,
                    autofocus: true,
                    minLines: 1,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Username can not be empty";
                      } else if (!RegExp(r"^[^0-9]+$").hasMatch(value)) {
                        return "Incorrect username";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: AppLocalizations.of(context)!.name,
                      prefixIcon: const Icon(Icons.text_fields),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 0,
                  color: Colors.blueGrey.withAlpha(40),
                  child: TextFormField(
                    controller: _emailController,
                    autofocus: true,
                    minLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email field can not be empty";
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Your email doesn't match the email standart";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 0,
                  color: Colors.blueGrey.withAlpha(40),
                  child: TextFormField(
                    controller: _passwordController,
                    autofocus: true,
                    obscureText: true,
                    minLines: 1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password field can not be empty";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: AppLocalizations.of(context)!.password,
                      prefixIcon: const Icon(Icons.password),
                    ),
                  ),
                ),
                FlutterPwValidator(
                  controller: _passwordController,
                  minLength: 8,
                  width: 400,
                  height: 50,
                  onSuccess: () {
                    return "Password is matched";
                  },
                  onFail: () {
                    return "NOT MATCHED";
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 0,
                  color: Colors.blueGrey.withAlpha(40),
                  child: TextFormField(
                    controller: _passwordConfirmController,
                    autofocus: true,
                    obscureText: true,
                    minLines: 1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password field can not be empty";
                      } else if (value != _passwordController.text) {
                        return "Passwords do not match";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: AppLocalizations.of(context)!.confirmPassword,
                      prefixIcon: const Icon(Icons.password),
                    ),
                  ),
                ),
                FlutterPwValidator(
                  controller: _passwordConfirmController,
                  minLength: 8,
                  width: 400,
                  height: 50,
                  onSuccess: () {
                    return "Password is matched";
                  },
                  onFail: () {
                    return "NOT MATCHED";
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                AnimatedButton(
                  isFixedHeight: false,
                  text: 'OK',
                  pressEvent: () async {
                    if (_formKey.currentState!.validate()) {
                      Statut statut;
                      try {
                        statut = await createUser(
                          _userNameController.text,
                          _emailController.text,
                          _passwordController.text,
                        );
                        if (statut.error != null && statut.error!.isNotEmpty) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            animType: AnimType.RIGHSLIDE,
                            headerAnimationLoop: true,
                            title: 'Error',
                            desc: statut.error,
                            btnOkOnPress: () {},
                            btnOkColor: Colors.red,
                          ).show();
                        } else if (statut.error == null &&
                            statut.success!.isNotEmpty) {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.SUCCES,
                            headerAnimationLoop: true,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'INFO',
                            desc: statut.success,
                            btnOkOnPress: () {
                              Navigator.of(context).pop();
                            },
                          ).show();
                        }
                      } catch (e) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.RIGHSLIDE,
                          headerAnimationLoop: true,
                          title: 'Error',
                          desc: e.toString(),
                          btnOkOnPress: () {},
                          btnOkColor: Colors.red,
                        ).show();
                      }
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.RIGHSLIDE,
                        headerAnimationLoop: true,
                        title: 'Error',
                        desc: 'Try again !',
                        btnOkOnPress: () {},
                        btnOkColor: Colors.red,
                      ).show();
                    }
                  },
                ),
                AnimatedButton(
                  isFixedHeight: false,
                  text: 'Cancel',
                  color: Colors.red,
                  pressEvent: () {
                    dialog.dismiss();
                  },
                )
              ],
            ),
          ),
        ),
      )..show();
    },
  );
}

Widget _loginLabel(BuildContext context) {
  return Center(
    child: Text(
      AppLocalizations.of(context)!.login,
      style: GoogleFonts.ibarraRealNova(
        textStyle: const TextStyle(
          color: Color(0xff164276),
          fontWeight: FontWeight.w900,
          fontSize: 34,
        ),
      ),
    ),
  );
}

Widget _logo() {
  return Center(
    child: SizedBox(
      child: Image.asset("assets/images/hesperis.png"),
      height: 80,
    ),
  );
}
