import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesperis_tamuda/models/search.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:hesperis_tamuda/views/menu/language.dart';

class SearchResult extends StatefulWidget {
  final Search? results;
  const SearchResult({Key? key, required this.results}) : super(key: key);

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
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            "Sommaire-Contents-Sumario",
            style: GoogleFonts.ibarraRealNova(
                textStyle: const TextStyle(
              fontSize: 25.0,
            )),
            textAlign: TextAlign.center,
          ),
          Row(children: [
            Text(widget.results!.sommaire!.length.toString()),
            Expanded(
                child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.results!.sommaire!.length,
                    itemBuilder: (context, index) {
                      return ListView(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          children: [
                            Text(
                              widget.results!.sommaire![index]!.titre
                                  .toString(),
                              style: GoogleFonts.ibarraRealNova(
                                  textStyle: const TextStyle(fontSize: 20)),
                              textAlign: TextAlign.left,
                            ),
                            Card(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView(
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    children: [
                                      ListView.builder(
                                          shrinkWrap: true,
                                          itemCount:
                                              widget.results!.articles!.length,
                                          itemBuilder: (context, index1) {
                                            return Card(
                                              color: const Color.fromARGB(
                                                  248, 238, 241, 245),
                                              child: ListView(
                                                physics:
                                                    const ClampingScrollPhysics(),
                                                shrinkWrap: true,
                                                children: const [
                                                  // Row(children: [
                                                  //   // Expanded(
                                                  //   //   flex: 4,
                                                  //   //   child: InkWell(
                                                  //   //     onTap: () async {
                                                  //   //       showDialog(
                                                  //   //           context: context,
                                                  //   //           builder:
                                                  //   //               (context) {
                                                  //   //             return Center(
                                                  //   //               child: Column(
                                                  //   //                 mainAxisSize:
                                                  //   //                     MainAxisSize
                                                  //   //                         .max,
                                                  //   //                 mainAxisAlignment:
                                                  //   //                     MainAxisAlignment
                                                  //   //                         .center,
                                                  //   //                 children: const [
                                                  //   //                   CircularProgressIndicator(),
                                                  //   //                   Text(
                                                  //   //                     "Un instant, nous chargeons le fichier",
                                                  //   //                     textAlign:
                                                  //   //                         TextAlign.center,
                                                  //   //                     style: TextStyle(
                                                  //   //                         color: Color.fromARGB(
                                                  //   //                             255,
                                                  //   //                             35,
                                                  //   //                             218,
                                                  //   //                             193),
                                                  //   //                         fontSize:
                                                  //   //                             20),
                                                  //   //                   ),
                                                  //   //                 ],
                                                  //   //               ),
                                                  //   //             );
                                                  //   //           });
                                                  //   //       final url = rootURL +
                                                  //   //           '/Downloads/' +
                                                  //   //           widget
                                                  //   //               .results!
                                                  //   //               .searcharticles![
                                                  //   //                   index1]!
                                                  //   //               .lienTelechargement
                                                  //   //               .toString();
                                                  //   //       final file =
                                                  //   //           await PDFApi
                                                  //   //               .loadNetwork(
                                                  //   //                   url);
                                                  //   //       Navigator.push(
                                                  //   //         context,
                                                  //   //         MaterialPageRoute(
                                                  //   //             builder: (context) =>
                                                  //   //                 PDFViewerPage(
                                                  //   //                     file:
                                                  //   //                         file,
                                                  //   //                     fileUrl:
                                                  //   //                         url)),
                                                  //   //       );
                                                  //   //       //  Navigator.of(context).pop();
                                                  //   //     },
                                                  //   //     child: Text(
                                                  //   //       widget
                                                  //   //           .results!
                                                  //   //           .searcharticles![
                                                  //   //               index1]!
                                                  //   //           .titre
                                                  //   //           .toString(),
                                                  //   //       textAlign:
                                                  //   //           TextAlign.left,
                                                  //   //       style: const TextStyle(
                                                  //   //           color: Color(
                                                  //   //               0xff2796bd)),
                                                  //   //     ),
                                                  //   //   ),
                                                  //   // ),
                                                  //   // Expanded(
                                                  //   //   child: Text(
                                                  //   //       widget
                                                  //   //           .results!
                                                  //   //           .searcharticles![
                                                  //   //               index1]!
                                                  //   //           .nbrePage
                                                  //   //           .toString(),
                                                  //   //       textAlign:
                                                  //   //           TextAlign.right),
                                                  //   // ),
                                                  // ])
                                                ],
                                              ),
                                            );
                                          })
                                    ],
                                  )),
                            )
                          ]);
                    }))
          ]),
        ],
      ),
    ));
  }
}
