import 'package:contact_app/src/constants/strings.dart';
import 'package:contact_app/src/pages/camera_screen.dart';
import 'package:contact_app/src/pages/chat_page.dart';
import 'package:contact_app/src/pages/contact_page.dart';
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
    const ContactPage(),
    const ChatPage(),
    const ProfilePage(),
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
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.camera_alt_outlined,
              ),
              label: Strings.camera),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            backgroundColor: Colors.black,
            label: Strings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            backgroundColor: Colors.black,
            label: Strings.chat,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            backgroundColor: Colors.black,
            label: Strings.profile,
          ),
        ],
      ),
    );
  }
}
