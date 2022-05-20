import 'package:contact_app/src/custom_ui/chat_card.dart';
import 'package:contact_app/src/model/chat_model.dart';
import 'package:contact_app/src/pages/custom_search_delegate.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<ChatModel> chats=[
    ChatModel(
      name: 'juzuli',
      isGroup: false,
      icon: 'person.svg',
      time: '04:30',
      currentMessage: 'Hey juzuli!'
    ),
    ChatModel(
        name: 'deepak',
        isGroup: false,
        icon: 'person.svg',
        time: '05:30',
        currentMessage: 'Hi'
    ),
    ChatModel(
        name: 'NDZians',
        isGroup: true,
        icon: 'group.svg',
        time: '03:30',
        currentMessage: 'Hey Everyone!'
    ),
    ChatModel(
        name: 'Dipesh',
        isGroup: false,
        icon: 'person.svg',
        time: '04:25',
        currentMessage: 'Loo'
    ),
    ChatModel(
        name: 'Family Group',
        isGroup: true,
        icon: 'group.svg',
        time: '04:45',
        currentMessage: 'hello all'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ChatCard(chatModel: chats[index],);
        },
      ),
    );
  }
}
