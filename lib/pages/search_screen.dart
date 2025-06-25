import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/bottom_navigation_bar.dart';
import 'package:flutter_learn/widgets/info_tile.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String search_text = '';
  var Body;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    initialFetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 70,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
              ),
              child: Image.asset('lib/icons/img.png', fit: BoxFit.cover),
            ),
          ),
        ),
        title: Text(
          'NewsApp',
          style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: IconButton(
              onPressed: () {},
              icon: ImageIcon(AssetImage('lib/icons/img_1.png')),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 48, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: TextField(
                      onChanged: (value) => search_text = value,
                      onTapOutside: (value) {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      keyboardType: TextInputType.webSearch,
                      decoration: InputDecoration(
                        hintText: 'Search here',
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(344, 26, 0, 0),
                  child: IconButton(
                    onPressed: () {
                      search_text==''?initialFetch():fetchHeadLines(Query: search_text);
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: Color(0xff2D2D2D),
                      foregroundColor: Colors.white60,
                    ),
                    icon: Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),
          isLoading
              ? LoadingAnimationWidget.fourRotatingDots(
                color: Colors.black,
                size: 100,
              )
              : Body['totalResults'] != 0
              ? Expanded(
                child: ListView.builder(
                  itemCount: Body['articles'].length,
                  itemBuilder: (context, index) {
                    return HomePageInfoTile(data: Body['articles'][index]);
                  },
                ),
              )
              : Text(
                'no search results found',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }

  void fetchHeadLines({required String Query}) async {
    isLoading = true;
    final response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/top-headlines?q=${Query}&apiKey=1d0193cb91e341b894101907e72cb1d7',
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

  void initialFetch() async {
    isLoading = true;
    final response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=1d0193cb91e341b894101907e72cb1d7',
      ),
    );
    isLoading = false;
    final body = jsonDecode(response.body);
    setState(() {
      Body = body;
    });
  }
}
