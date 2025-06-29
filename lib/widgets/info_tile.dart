import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/detail_screen.dart';

class HomePageInfoTile extends StatelessWidget {
  final data;

  const HomePageInfoTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(data: data)),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child:
                      data['urlToImage'] != null
                          ? Image.network(data['urlToImage'])
                          : Image.asset('lib/placeholders/funny_minion.jpg'),
                ),
                Container(
                  height: 33,
                  alignment: Alignment(-.9, 1),
                  child: Text(
                    data['source']['name'] ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ), //Image of info tile
          Padding(
            padding: EdgeInsets.fromLTRB(32, 8, 32, 0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                data['title'] ?? '',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
          ), //title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width:150,
                  child: Text(
                    data['author'] ?? '',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  timeElapsed(data['publishedAt']),
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
    );
  }
  String timeElapsed(String date_time){
    final diff = DateTime.now().toUtc().difference(DateTime.parse(date_time));
    if(diff.inDays>0){
      return '${diff.inDays} days ago';
    }
    else{
      if(diff.inHours>0) {
        return '${diff.inHours} hours ago';
      }
      else{
        return'${diff.inMinutes} minutes ago';
      }
    }
  }
}
