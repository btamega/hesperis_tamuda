// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/home.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.black87,
      backgroundColor: Colors.grey[300],
      minimumSize: const Size(88, 36),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );
    return SafeArea(
      child: Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.httpError,
            style: GoogleFonts.ibarraRealNova(),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff3b5998),
          actions: const [LanguagePickerWidget()],
        ),
        body: orientation == Orientation.portrait
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/animation_500_l8rqndep.gif",
                      width: width * .50,
                    ),
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.noInternet.toString(),
                        style: GoogleFonts.ibarraRealNova(
                            textStyle: const TextStyle(fontSize: 25)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Center(
                        child: ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () {},
                      child: const Text('Actualiser'),
                    )),
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/animation_500_l8rqndep.gif",
                      width: width * .25,
                    ),
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.noInternet.toString(),
                        style: GoogleFonts.ibarraRealNova(
                            textStyle: const TextStyle(fontSize: 25)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Center(
                        child: ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () async {
                        try {
                          final result =
                              await InternetAddress.lookup('www.google.com');
                          if (result.isNotEmpty &&
                              result[0].rawAddress.isNotEmpty) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                          }
                        } on SocketException catch (_) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ErrorPage(),
                          ));
                        }
                      },
                      child: const Text('Actualiser'),
                    )),
                  ],
                ),
              ),
      ),
    );
  }
}
