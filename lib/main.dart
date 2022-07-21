import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/provider/locale_provider.dart';
import 'views/include/navbar.dart';
import 'views/menu/language.dart';
import 'views/pages/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => LocaleProvider(),
    builder: (context, child) {
    final provider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      title: 'Hespéris Tamuda',
      color:const Color(0xff3b5998),
      localizationsDelegates: const[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const[
        Locale('en', ''), 
        Locale('fr', ''), 
        Locale('ar', ''), 
      ],
      locale: provider.locale,
     home: const MyHomePage(title: 'Hespéris Tamuda'),
    );
  }
  );
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
   return const Scaffold(
    drawer:  NavigationDrawerWidget(),
    body: HomePage(),
   );
      
  }

  
}

