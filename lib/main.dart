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
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                print('My page button pressed');
              },
              icon: Icon(
                Icons.person,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 30.0,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                _buildSearchBar(),
                _buildMovieList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: 355,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Set the border color
          width: 1.0, // Set the border width
        ),
        borderRadius: BorderRadius.circular(4.0), // Set border radius
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: "  영화 제목을 검색해주세요 🩵",
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none, // Remove TextField border
        ),
      ),
    );
  }

  Widget _buildMovieList() {
    // Sample movie data
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
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                dataList[index]["imgUrl"],
                width: 450,
                height: 175,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: 450,
                  height: 175,
                  color: Colors.black.withOpacity(0.5),
                  padding: EdgeInsets.all(60.0),
                  child: Text(
                    dataList[index]["category"],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
