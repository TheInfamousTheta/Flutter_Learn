import 'package:flutter/material.dart';

class HomePageTabs extends StatefulWidget {
  String title;
  int state;
  int index;
  HomePageTabs({super.key, required this.title, required this.state,required this.index});

  @override
  State<HomePageTabs> createState() =>
      _HomePageTabsState(title: title, state: state,index: index);
}

class _HomePageTabsState extends State<HomePageTabs> {
  String title;

  _HomePageTabsState({
    required this.title,
    required this.state,
    required this.index,
  });

  int state;
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: InkWell(
        onTap: () {
          setState(() {
            state = index;
          });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: state == index ? Colors.black : Colors.white,
            border: Border.all(width: 3, color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: Text(
              title,
              style: TextStyle(
                color: state == index ? Colors.white : Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
