import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 50),
          child: CircleAvatar(
            radius: 80,
            backgroundColor: Colors.blueGrey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              icon: Icon(Icons.account_circle_outlined),
              hintText: 'Name',
            ),
          ),
        ),
        const SizedBox(height: 25.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Email',
            ),
          ),
        ),
        const SizedBox(height: 25.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              hintText: "Phone",
            ),
          ),
        ),
        const SizedBox(height: 15.0),
        ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Text(
              'edit'.toUpperCase(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
