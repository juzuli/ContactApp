import 'package:contact_app/src/pages/chatPage.dart';
import 'package:contact_app/src/pages/homepage.dart';
import 'package:contact_app/src/pages/profilepage.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  int selectedIndex = 0;
  List<Widget> bodyFragments = [
    HomePage(),
    ChatPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyFragments[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            backgroundColor: Colors.black,
            label:"Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            backgroundColor: Colors.black,
              label:"Chat"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            backgroundColor: Colors.black,
              label:"Profile"
          ),
        ],
      ),
    );
  }
}
