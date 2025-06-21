import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/bottom_navigation_bar.dart';

class DetailScreen extends StatelessWidget {
  var data;

  DetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'NewsApp',
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),

                border: Border.all(color: Colors.black, width: 3),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(999),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 20,
                  weight: 99,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child:
                      data['urlToImage'] != null
                          ? Image.network(data['urlToImage'])
                          : Image.asset('lib/placeholders/funny_minion.jpg'),
                ),
                Container(
                  height: 200,
                  alignment: Alignment(-.85, -.85),
                  child: Text(
                    data['source']['name'] ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  alignment: Alignment(.99, -.80),
                  child: Icon(Icons.more_vert, color: Colors.white),
                ),
              ],
            ), //Image with overlays
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                data['title'],
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
            ), //Title
            Expanded(
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      data['description'] ?? '',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data['author'] ?? '',
                    style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'time elapsed',
                    style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
