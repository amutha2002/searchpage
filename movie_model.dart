import 'package:flutter/material.dart';

class NameList extends StatefulWidget {
  @override
  _NameListState createState() => _NameListState();
}

class _NameListState extends State<NameList> {
  TextEditingController searchController = TextEditingController();
  List<String> names = [
    'amutha',
    'anu',
    'amirtha',
    'raj',
    'fahad',
    'kiskore',
    'mano',
    'maha',
    'selva',
    'subash',
    'deva',
    'vidhya',
    'karthi',
    'fimena',
    'jeeva',
    'kani',
    'harish',
    'preetha',
    'monika',
    'khaleel',
    'sharmi',
    'deepak',
    'govinth',
    'viji'
  ];
  List<String> filteredNames = [];

  @override
  void initState() {
    super.initState();
    filteredNames = names;
  }

  void filterNames(String query) {
    List<String> filteredList = [];
    if (query.isNotEmpty) {
      names.forEach((name) {
        if (name.toLowerCase().contains(query.toLowerCase())) {
          filteredList.add(name);
        }
      });
    } else {
      filteredList = names;
    }
    setState(() {
      filteredNames = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name List'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
              ),
              onChanged: (value) {
                filterNames(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredNames.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(filteredNames[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
