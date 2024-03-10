import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Movie Reviews",
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                print('My page button pressed');
              },
              icon: Icon(Icons.person),
            )
          ],
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(48.0), // Set the height of the search bar
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ),

        body: HomePage(), // 홈페이지 보여주기
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Movie data
  List<Map<String, dynamic>> dataList = [
    {
      "category": "탑건: 매버릭",
      "imgUrl": "https://i.ibb.co/sR32PN3/topgun.jpg",
    },
    {
      "category": "마녀2",
      "imgUrl": "https://i.ibb.co/CKMrv91/The-Witch.jpg",
    },
    {
      "category": "범죄도시2",
      "imgUrl": "https://i.ibb.co/2czdVdm/The-Outlaws.jpg",
    },
    {
      "category": "헤어질 결심",
      "imgUrl": "https://i.ibb.co/gM394CV/Decision-to-Leave.jpg",
    },
    {
      "category": "브로커",
      "imgUrl": "https://i.ibb.co/MSy1XNB/broker.jpg",
    },
    {
      "category": "문폴",
      "imgUrl": "https://i.ibb.co/4JYHHtc/Moonfall.jpg",
    },
  ];

  // Filtered movie data for search
  List<Map<String, dynamic>> filteredDataList = [];

  @override
  void initState() {
    super.initState();
    filteredDataList = dataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                // Filter the data based on the search query
                setState(() {
                  filteredDataList = dataList
                      .where((movie) => movie["category"]
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Scrollable list view
          Expanded(
            child: ListView.builder(
              itemCount: filteredDataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredDataList[index]["category"]),
                  leading: Image.network(filteredDataList[index]["imgUrl"]),
                  // Add more details or customize the ListTile as needed
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
