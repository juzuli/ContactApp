import 'package:contact_app/src/constants/strings.dart';
import 'package:contact_app/src/custom_ui/own_message_card.dart';
import 'package:contact_app/src/custom_ui/reply_card.dart';
import 'package:contact_app/src/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IndividualChatPage extends StatefulWidget {
  const IndividualChatPage({Key? key, this.chatModel}) : super(key: key);

  final ChatModel? chatModel;

  @override
  _IndividualChatPageState createState() => _IndividualChatPageState();
}

class _IndividualChatPageState extends State<IndividualChatPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/background-white.jpg',
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 72,
              titleSpacing: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                  mainAxisSize: MainAxisSize.min,
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
                            child: Text(Strings.viewContacts),
                            value: 1,
                          ),
                          const PopupMenuItem(
                            child: Text(Strings.mediaLinksAndDocs),
                            value: 2,
                          ),
                          const PopupMenuItem(
                            child: Text(Strings.search),
                            value: 3,
                          ),
                          const PopupMenuItem(
                            child: Text(Strings.muteNotifications),
                            value: 4,
                          ),
                          const PopupMenuItem(
                            child: Text(Strings.wallpaper),
                            value: 4,
                          ),
                          const PopupMenuItem(
                            child: Text(Strings.more),
                            value: 5,
                          ),
                        ]),
              ],
            ),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height-180,
                  child: ListView(
                    shrinkWrap: true,
                    children: const [
                      OwnMessageCard(),
                      ReplyCard(),
                      OwnMessageCard(),
                      ReplyCard(),
                      OwnMessageCard(),
                      ReplyCard(),
                      OwnMessageCard(),
                      ReplyCard(),
                      OwnMessageCard(),
                      ReplyCard(),
                      OwnMessageCard(),
                      ReplyCard(),
                      OwnMessageCard(),
                      ReplyCard(),
                      OwnMessageCard(),
                      ReplyCard(),

                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Card(
                          margin: const EdgeInsets.only(
                            left: 4,
                            right: 4,
                            bottom: 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(5),
                              hintText: Strings.typeAMessage,
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.emoji_emotions),
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (builder) {
                                            return bottomSheet();
                                          });
                                    },
                                    icon: const Icon(Icons.attach_file),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.camera_alt),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8, left: 2),
                        child: CircleAvatar(
                          radius: 25,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.mic),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 40,
            runSpacing: 25,
            children: [
              iconCreation(Icons.insert_drive_file, Colors.indigo, Strings.document),
              iconCreation(Icons.camera_alt, Colors.pink, Strings.camera),
              iconCreation(Icons.insert_photo, Colors.purple, Strings.gallery),
              iconCreation(Icons.headset, Colors.deepOrange, Strings.audio),
              iconCreation(Icons.location_pin, Colors.green, Strings.location),
              iconCreation(Icons.person, Colors.blue, Strings.contact),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(
    IconData icon,
    Color color,
    String text,
  ) {
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(icon),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
