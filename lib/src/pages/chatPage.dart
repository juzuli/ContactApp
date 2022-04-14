import 'package:contact_app/src/pages/messages.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        leading: const Text('Chats'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIconColor: Colors.grey,
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none),
              contentPadding: EdgeInsets.zero,
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(children: [
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Messages()),
            );
          },
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(''),
          ),
          title: const Text(
            '',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text('', style: TextStyle(color: Colors.black38)),
          trailing: const Text(''),
        )
      ]),
    );
  }
}
