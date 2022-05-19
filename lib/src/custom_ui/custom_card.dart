import 'package:contact_app/src/pages/individual_page.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(''),
      ),
      title: const Text(
          'Title'
      ),
      subtitle: const Text('Subtitle'),
      trailing: IconButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const IndividualPage()),
            );
          },
          icon: const Icon(Icons.message)),
    );
  }
}