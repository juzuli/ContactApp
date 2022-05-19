import 'package:contact_app/src/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, this.chatModel}) : super(key: key);

  final ChatModel? chatModel;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        leadingWidth: 65,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back,
                size: 24,
              ),
              CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 20,
                child: SvgPicture.asset(
                  widget.chatModel?.isGroup ?? false
                      ? 'assets/images/groups.svg'
                      : 'assets/images/person.svg',
                  color: Colors.white,
                  width: 38,
                  height: 38,
                ),
              ),
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.chatModel?.name ?? '',
                style: const TextStyle(
                  fontSize: 18.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Last seen today 12:00 am',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.videocam,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                color: Colors.white,
              )),
          PopupMenuButton(
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text("View contact"),
                      value: 1,
                    ),
                    const PopupMenuItem(
                      child: Text("Media,links,and docs"),
                      value: 2,
                    ),
                    const PopupMenuItem(
                      child: Text("Search"),
                      value: 3,
                    ),
                    const PopupMenuItem(
                      child: Text("Mute notifications"),
                      value: 4,
                    ),
                    const PopupMenuItem(
                      child: Text("Wallpaper"),
                      value: 4,
                    ),
                    const PopupMenuItem(
                      child: Text("More"),
                      value: 5,
                    ),
                  ]),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 55,
                    child: Card(
                      margin: const EdgeInsets.only(
                        left: 2,
                        right: 2,
                        bottom: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          hintText: 'Type a message',
                          prefixIcon: IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.emoji_emotions)),
                        ),
                      ),
                    ),
                  ),
                  const CircleAvatar()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
