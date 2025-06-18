import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/detail_screen.dart';

class HomePageInfoTile extends StatelessWidget {
  const HomePageInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen()),
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
                  child: Image.asset('lib/placeholders/funny_minion.jpg'),
                ),
                Container(
                  height: 200,
                  alignment: Alignment(-.9, -.925),
                  child: Text(
                    'placeholder source',
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
                'placeholder titlef f  f f f  f f  f f  f f  f',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
          ), //title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'writer',
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
    );
  }
}
