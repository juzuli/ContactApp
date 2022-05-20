import 'package:contact_app/src/custom_ui/contact_card.dart';
import 'package:contact_app/src/model/chat_model.dart';
import 'package:contact_app/src/pages/custom_search_delegate.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts=[
      ChatModel(
        name: 'juzuli',
        status: 'Flutter developer'
      ),
      ChatModel(
        name: 'Dipesh',
        status: 'Flutter developer'
      ),
      ChatModel(
          name: 'Deepak',
          status: 'Flutter developer'
      ),
      ChatModel(
          name: 'Backershan',
          status: 'Flutter developer'
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
          style: TextStyle(fontWeight: FontWeight.bold),
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
          PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  child: Text("Invite a friend"),
                  value: 0,
                ),
                const PopupMenuItem(
                  child: Text("Contacts"),
                  value: 1,
                ),
                const PopupMenuItem(
                  child: Text("Refresh"),
                  value: 2,
                ),
                const PopupMenuItem(
                  child: Text("Help"),
                  value: 3,
                ),
              ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.person_add),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ContactCard(contacts: contacts[index],);
        },
      ),
    );
  }
}
