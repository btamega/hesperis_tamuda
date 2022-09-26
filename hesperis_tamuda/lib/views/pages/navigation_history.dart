import 'package:flutter/material.dart';

class NavigationHistory extends StatefulWidget {
  const NavigationHistory({Key? key}) : super(key: key);

  @override
  _NavigationHistoryState createState() => _NavigationHistoryState();
}

class _NavigationHistoryState extends State<NavigationHistory> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: const <Widget>[
        Tile(text: Text("a")),
        Tile(text: Text("b")),
        Tile(text: Text("c")),
      ],
    ));
  }
}

int count = 0;
List<History> historyList = [];

class History {
  String data;
  DateTime dateTime;

  History({required this.data, required this.dateTime});
}

class Tile extends StatefulWidget {
  final Text text;
  const Tile({Key? key, required this.text}) : super(key: key);

  @override
  TileState createState() => TileState();
}

class TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: widget.text,
      onTap: () {
        count++;
        historyList.add(History(
            data: widget.text.data.toString(), dateTime: DateTime.now()));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HistoryPage(),
            ));
      },
    );
  }
}

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              })),
      body: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
                ' ${historyList[index].data}   ${historyList[index].dateTime.toString()}'),
          );
        },
      ),
    );
  }
}
