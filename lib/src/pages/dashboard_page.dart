import 'package:contact_app/src/pages/camera_screen.dart';
import 'package:contact_app/src/pages/chat_page.dart';
import 'package:contact_app/src/pages/home_page.dart';
import 'package:contact_app/src/pages/profile_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 2;
  List<Widget> bodyFragments = [
    const CameraScreen(),
    const HomePage(),
    const ChatPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyFragments[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined,
              ),
              label: 'Camera'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              backgroundColor: Colors.black,
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              backgroundColor: Colors.black,
              label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              backgroundColor: Colors.black,
              label: "Profile"),

        ],
      ),
    );
  }
}
