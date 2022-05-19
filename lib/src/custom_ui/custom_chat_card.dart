import 'package:contact_app/src/model/chat_model.dart';
import 'package:contact_app/src/pages/individual_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomChatCard extends StatelessWidget {
  const CustomChatCard({
    Key? key,
    this.chatModel,
  }) : super(key: key);

  final ChatModel? chatModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IndividualPage(chatModel: chatModel,)),
            );
          },
          leading: CircleAvatar(
            radius: 30,
            child: SvgPicture.asset(
              chatModel?.isGroup ?? false
                  ? 'assets/images/groups.svg'
                  : 'assets/images/person.svg',
              color: Colors.white,
              width: 38,
              height: 38,
            ),
            backgroundColor: Colors.blueGrey,
          ),
          title: Text(
            chatModel?.name ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: [
              const Icon(Icons.done_all),
              const SizedBox(
                width: 3,
              ),
              Text(
                chatModel?.currentMessage ?? '',
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          trailing: Text(chatModel?.time ?? ''),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20, left: 80),
          child: Divider(
            thickness: 1,
          ),
        )
      ],
    );
  }
}
