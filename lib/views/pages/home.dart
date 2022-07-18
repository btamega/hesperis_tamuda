import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hesperis_tamuda/views/include/navbar.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;

 String htmlData = """ 
    <section id="section-id-1489028018413" class="sppb-section ">
        <div class="sppb-row-container">
            <div class="sppb-row">
                <div class="sppb-col-md-12">
                    <div id="column-id-1489028018414" class="sppb-addon-container" >
                        <div id="sppb-addon-1488967667781" class="clearfix">
                            <div class="sppb-addon sppb-addon-module ">
                                <div class="sppb-addon-content">
                                    <div class="custom"  >
                                        <ul class="custom-1">
                                            <li class="item">
                                                <div class="main"><img src="assets/images/UM5.png" width="56" height="47" alt="not found"/><br />
                                                    <div class="content">
                                                        <h3><a href="http://www.um5.ac.ma/um5r/">Université Mohamed 5</a></h3>
                                                        <p>Rabat- Maroc</p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="main"><img src="../assets/images/faculté des lettres.jpeg" width="56" height="47" /><br />
                                                    <div class="content">
                                                        <h3><a href="http://www.um5.ac.ma/um5r/">Faculté des lettres</a></h3>
                                                        <p>Rabat- Maroc</p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="item">
                                                <div class="main"><img style="font-size: 12.16px;" src="data:image/png;base64,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" width="47" height="47" /><br />
                                                    <div class="content">
                                                        <h3><a href="https://clarivate.com/">Clarivate Analytics</a></h3>
                                                        <p>Jersey - USA</p>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> <br> 
   """;
  dom.Document document = htmlparser.parse(htmlData);
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
                        padding: const EdgeInsets.all(15),
                        child: Column(
                        children: <Widget> [
                           DropCapText(
                            "The academic journal Hespéris was founded in 1921, only a year after the creation of the Institut des Hautes Etudes Marocaines in Rabat by the French protectorate authorities. The balance sheet of this publication until 1959 totals the production of 47 volumes, with one or more issues per year containing background articles, historical and geographical studies, unpublished documents, as well as reviews of new publications on Morocco and the Muslim West. The Spanish protectorate authorities in the Khalifian Zone (northern Morocco) had created a similar review entitled Tamuda, which published texts of the same nature as Hespéris in Spanish.\n", 
                            dropCap: DropCap(
                            width: 100,
                            height: 200,
                            child: const Image(image: AssetImage('assets/images/accueil.jpeg'),),
                            ),
                            style: const TextStyle(fontSize: 20, ), textAlign: TextAlign.justify,
                        ),
                         const Text("After the independence of Morocco and the creation of the Faculty of Arts and Humanities in Rabat in 1957, Hespéris was merged with Tamuda, which appeared in Tetouan, in 1960 thus giving birth to Hespéris-Tamuda. It was the beginning of an academic and multidisciplinary journal devoted to the study of Morocco and the dissemination of knowledge relating to its society, history, culture and the social sciences of the Muslim West and the Mediterranean. Hespéris-Tamuda has been published annually since 1960 in one or more fascicles, with the emergence of articles and book reviews written in Arabic from 1991 onwards.\n", 
                            style: TextStyle(fontSize: 20, ), textAlign: TextAlign.justify,
                          ),
                        const  Text("While remaining faithful to its spirit of scientific rigor under the patronage of the current dean of the Faculty of Arts and Humanities of Rabat Professor Jamal Eddine El Hani since the beginning of 2015, Hespéris-Tamuda has published original articles, papers on bibliographical and archival studies and book reviews in Arabic, French, English and Spanish. The emphasis has been on the multidisciplinary enlargement of its scientific and editorial committee, both nationally and internationally, with the adoption of a new strategy based on openness to other fields of research in the human and social sciences. Morocco’s premium academic journal has been put on the rails of international indexing, as was the case recently with Thomson Reuters Web of Science Core Collection located in Philadelphia (USA).\n", 
                            style: TextStyle(fontSize: 20, ), textAlign: TextAlign.justify,
                          ),
                         const Text("Published by the Faculty of Arts and Humanities (Mohammed V University Rabat, Morocco), Hespéris-Tamuda (Annual ISSN: 0018-1005) has been selected to feature in the products and services of Clarivate Analytics since 2016. The journal has been indexed in the category titled Emerging Sources Citation Index (ESCI). In the future, Hespéris-Tamuda could be submitted for inclusion in other Clarivate Analytics products and services to be able to better meet the needs of researchers around the world. In this year (2021), the journal celebrated the centenary of its existence with new scientific activities, in collaboration with major partners, in Morocco, Europe, and the United States.\n", 
                            style: TextStyle(fontSize: 20, ), textAlign: TextAlign.justify,
                          ),
                          Html(data: htmlData,
                          style: {
                            '.layout2 .custom-1 li.item' : Style(padding: const EdgeInsets.fromLTRB(1.0, 2.0, 3.0, 4.0))
                          },)
                        ]
                        )
                      ),
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

