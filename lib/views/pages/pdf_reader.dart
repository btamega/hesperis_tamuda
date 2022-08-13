import 'dart:io';
// import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart' as p;
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
class PDFViewerPage extends StatefulWidget {
  final File file;
  final String fileUrl;
  const PDFViewerPage({
     Key? key,
    required this.file,
    required this.fileUrl,
  }) : super(key: key);

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;
  late TextEditingController textEditingController;
  bool downloading = false;
  String progress='0';
  // ignore: unused_field
  bool _isLoading = false;
  // ignore: unused_field
  String _fileFullPath = '';
  late String path;
  int pageNumber =0;
  late Dio dio;
  @override
  void initState(){
    dio = Dio();
    super.initState();
    textEditingController=TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    final text = '${indexPage + 1} of $pages';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3b5998),
        title: Text(widget.file.path.split('/').last),
        actions: pages >= 2
            ? [
                Center(
                  child:Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await _downloadAndSaveFileToStorage(widget.fileUrl, widget.file.path.split('/').last);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Téléchargemnt terminé, votre fichier se trouve dans Téléchargements ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }, 
                        icon: const Icon(Icons.download)),
                      InkWell(
                        child: Text(text, textDirection: TextDirection.ltr,),
                        onTap: () async{
                          final pageNumber = await search();
                          if (pageNumber==null||pageNumber.isNegative) {
                            return;
                          } else {
                            controller.setPage(pageNumber);
                          }
                        },
                      ),
                    ],
                  ),
                  
                  ),
                IconButton(
                  icon: const Icon(Icons.chevron_left, size: 32),
                  onPressed: () {
                    final page = indexPage == 0 ? pages : indexPage - 1;
                    controller.setPage(page);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right, size: 32),
                  onPressed: () {
                    final page = indexPage == pages - 1 ? 0 : indexPage + 1;
                    controller.setPage(page);
                  },
                ),
              ]
            : null,
      ),
      body: PDFView(
        filePath: widget.file.path,
        // autoSpacing: false,
        // swipeHorizontal: true,
        // pageSnap: false,
        // pageFling: false,
        onRender: (pages) => setState(() => this.pages = pages!),
        onViewCreated: (controller) =>
            setState(() => this.controller = controller),
        onPageChanged: (indexPage, _) =>
            setState(() => this.indexPage = indexPage!),
      ),
    );
  }

 Future <int?> search()=>showDialog <int>(
  context: context, 
  builder: (context) =>  AlertDialog(
    title: const Text("Go to page"),
    content: const TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: 'Enter number'),
    ),
    actions: [
      TextButton(
        onPressed: submit, 
        child:const Text("OK"),
        ),
    ],
  )
  );

  void submit() {
    Navigator.of(context).pop();
  }
Future<Directory> _getExternalStoragePath() async{
  Directory directory;
  if (Platform.isIOS) {
        directory = await p.getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) directory = (await p.getExternalStorageDirectory())!;
      }
    return directory;
}

Future _downloadAndSaveFileToStorage(String url, String fileName) async{
  ProgressDialog progressDialog;
  progressDialog = ProgressDialog(context: context  );
  try {
    progressDialog.show(max: 100,msg: "Téléchargement ...",progressType: ProgressType.normal);
    final dirList = await _getExternalStoragePath();
    final path = dirList.path;
    final file = File('$path/$fileName');
    await dio.download(url, file.path,
    onReceiveProgress: (rec, total){
      setState((){
        _isLoading = true;
       int progress = (((rec / total) * 100).toInt());
       progressDialog.update(value: progress);
      });
    });
    
    _fileFullPath = file.path;
  } catch (e) {
    throw Exception(e.toString());
  }

  setState(() {
    _isLoading = false;
  });
}

}