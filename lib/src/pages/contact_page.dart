import 'package:contact_app/src/custom_ui/contact_card.dart';
import 'package:contact_app/src/pages/custom_search_delegate.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool isLoading = true;
  List<Contact> contacts = [];

  @override
  void initState() {
    getAllContacts();
    super.initState();
  }

  getAllContacts ()async{
    PermissionStatus permissionStatus = await Permission.contacts.request();
    if (permissionStatus.isGranted){
      List<Contact> contactsTemp = await ContactsService.getContacts();
     setState(() {
       contacts = contactsTemp;
       isLoading = false;
     });
    }
  }


  @override
  Widget build(BuildContext context) {
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
      body: Visibility(
         visible: !isLoading,
        replacement: const Center(child: CupertinoActivityIndicator(),),
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return ContactCard(contacts: contacts[index],);
          },
        ),
      ),
    );
  }
}
