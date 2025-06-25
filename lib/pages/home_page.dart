import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/bottom_navigation_bar.dart';
import 'package:flutter_learn/widgets/home_page_widgets/home_page_app_bar.dart';
import 'package:flutter_learn/widgets/info_tile.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static String selected = 'Technology';
  static const List TABS = ['Technology', 'Sports', 'Entertainment', 'Health'];
  var Body;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchHeadLines(selected: selected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(appBar: AppBar()),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: TABS.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selected = TABS[index];
                        });
                        fetchHeadLines(selected: selected);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:
                              selected == TABS[index]
                                  ? Colors.black
                                  : Colors.white,
                          border: Border.all(width: 3, color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 4,
                          ),
                          child: Text(
                            TABS[index],
                            style: TextStyle(
                              color:
                                  selected == TABS[index]
                                      ? Colors.white
                                      : Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          isLoading
              ? Padding(
                padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.black,
                  size: 100,
                ),
              )
              : Expanded(
                child: ListView.builder(
                  itemCount: Body['articles'].length,
                  itemBuilder: (context, index) {
                    return HomePageInfoTile(data: Body['articles'][index]);
                  },
                ),
              ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }

  void fetchHeadLines({required String selected}) async {
    isLoading = true;
    final response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=${selected}&apiKey=1d0193cb91e341b894101907e72cb1d7',
      ),
    );
    isLoading = false;
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      setState(() {
        Body = body;
      });
    }
  }
}
