import 'package:contact_app/src/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  ContactCard({
    Key? key,this.contacts
  }) : super(key: key);

  ChatModel? contacts;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){},
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueGrey[200],
          radius: 23,
          child: SvgPicture.asset("assets/images/person.svg",
            color: Colors.white,
            height: 30,
            width: 30,
          ),
        ),
        title: Text(
            contacts?.name??'',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        subtitle: Text(contacts?.status??'',
          style: const TextStyle(
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}