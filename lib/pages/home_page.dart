import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/home_page_widgets/home_page_app_bar.dart';
import 'package:flutter_learn/widgets/home_page_widgets/home_page_info_tile.dart';
import 'package:flutter_learn/widgets/home_page_widgets/home_page_tabs.dart';

class HomePage extends StatelessWidget {
  int selected = 0;
  static const List _tabs = ['Tech', 'Sports', 'Cinema'];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(appBar: AppBar(),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 32, 8),
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return HomePageTabs(title: _tabs[index],state:selected,index: index,);
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return HomePageInfoTile();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Saved'),
        ],
      ),
    );
  }
}
