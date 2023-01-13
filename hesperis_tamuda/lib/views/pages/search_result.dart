import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/models/search.dart';
import 'package:hesperis_tamuda/services/data_service.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';
import 'package:hesperis_tamuda/views/pages/errorPage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(
          "RESULTS",
          style: GoogleFonts.ibarraRealNova(),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff3b5998),
        actions: const [LanguagePickerWidget()],
      ),
    ));
  }
}
