// ignore_for_file: file_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/models/statut.dart';
import 'package:hesperis_tamuda/services/data_service.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';
// import 'package:hesperis_tamuda/views/pages/user/dashboard.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hesperis_tamuda/views/pages/user/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    Future<String?> _authUser(LoginData data) async {
      Statut statut;
      try {
        statut = await authenticate(data.name, data.password);
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
        } else if (statut.error == null && statut.success!.isNotEmpty) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            headerAnimationLoop: true,
            animType: AnimType.BOTTOMSLIDE,
            title: 'SUCCESS',
            desc: statut.success,
            btnOkOnPress: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('email', statut.user!.email);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const DashboardScreen(),
              ));
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
      return null;
    }

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
        body: orientation == Orientation.portrait
            ? FlutterLogin(
                theme: LoginTheme(
                  buttonTheme: const LoginButtonTheme(
                      backgroundColor: Color.fromARGB(255, 221, 143, 231)),
                  inputTheme: const InputDecorationTheme(
                      fillColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white)),
                  textFieldStyle: const TextStyle(color: Colors.white),
                  cardTheme: const CardTheme(
                    color: Color(0xff3b5998),
                  ),
                  primaryColor: Colors.white,
                ),
                title: AppLocalizations.of(context)!.login,
                logo: const AssetImage('assets/images/hesperis.png'),
                onLogin: _authUser,
                onSignup: _signupUser,
                onSubmitAnimationCompleted: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
                },
                onRecoverPassword: _recoverPassword,
              )
            : FlutterLogin(
                disableCustomPageTransformer: false,
                theme: LoginTheme(
                  buttonTheme: const LoginButtonTheme(
                      backgroundColor: Color.fromARGB(255, 221, 143, 231)),
                  inputTheme: const InputDecorationTheme(
                      fillColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white)),
                  textFieldStyle: const TextStyle(color: Colors.white),
                  cardTheme: const CardTheme(
                    color: Color(0xff3b5998),
                  ),
                  primaryColor: Colors.white,
                ),
                title: AppLocalizations.of(context)!.login,
                logo: const AssetImage('assets/images/hesperis.png'),
                onLogin: _authUser,
                onSignup: _signupUser,
                onSubmitAnimationCompleted: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
                },
                onRecoverPassword: _recoverPassword,
              ),
      ),
    );
  }
}