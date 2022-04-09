import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade800,
        leading: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Colors.white,
                )),
            const Padding(
              padding: EdgeInsets.only(left: 2.0),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(''),
              ),
            )
          ],
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Text(
            '',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.videocam,
                size: 25,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                size: 25,
                color: Colors.white,
              )),
          PopupMenuButton(
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text(
                        "View contact",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      value: 1,
                    ),
                    const PopupMenuItem(
                      child: Text("Media,links,and docs",
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                      value: 2,
                    ),
                    const PopupMenuItem(
                      child: Text("Search",
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                      value: 3,
                    ),
                    const PopupMenuItem(
                      child: Text("Mute notifications",
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                      value: 4,
                    ),
                    const PopupMenuItem(
                      child: Text("Wallpaper",
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                      value: 4,
                    ),
                    const PopupMenuItem(
                      child: Text("More",
                          style: TextStyle(color: Colors.black, fontSize: 14)),
                      value: 5,
                    ),
                  ]),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.grey.shade600,
                  size: 23,
                )),
            const Padding(
              padding: EdgeInsets.only(left: 0.7),
              child: Text(
                'Message',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.attachment,
                    color: Colors.grey.shade600,
                    size: 23,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.euro_symbol,
                    color: Colors.grey.shade600,
                    size: 23,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.8),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.grey.shade600,
                    size: 23,
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.teal.shade800,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_voice,
                        color: Colors.white,
                        size: 23,
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
