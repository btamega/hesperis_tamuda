import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
class PDFReader extends StatefulWidget {
  
  const PDFReader({Key? key}) : super(key: key);

  @override
  _PDFReaderState createState() => _PDFReaderState();
}

class _PDFReaderState extends State<PDFReader> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        centerTitle: true,
      ),
      body: Container(
        child: const PDFView(filePath:"https://hesperis-tamuda.com/Downloads/1921-1929/Hesp%C3%A9ris%20Tamuda%201921.pdf"),
        ),
    );
  }
}