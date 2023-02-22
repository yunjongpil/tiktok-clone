import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  bool _isWriting = false;

  void _onStopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onStopWriting,
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Stack(
              children: [
                const CircleAvatar(
                  radius: Sizes.size24,
                  foregroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/3612017"),
                  child: Text("Nico"),
                ),
                Positioned(
                    width: Sizes.size20,
                    height: Sizes.size20,
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: Sizes.size20,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: Sizes.size3,
                        ),
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ))
              ],
            ),
            title: const Text("니꼬"),
            subtitle: const Text("Active now"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                FaIcon(
                  FontAwesomeIcons.flag,
                  color: Colors.black,
                  size: Sizes.size16,
                ),
                Gaps.h32,
                FaIcon(
                  FontAwesomeIcons.ellipsis,
                  color: Colors.black,
                  size: Sizes.size16,
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size14,
                  vertical: Sizes.size20,
                ),
                itemBuilder: (context, index) {
                  final isMine = index % 2 == 0;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: isMine
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(
                          Sizes.size14,
                        ),
                        decoration: BoxDecoration(
                          color: isMine
                              ? Colors.blue
                              : Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(
                              Sizes.size20,
                            ),
                            topRight: const Radius.circular(
                              Sizes.size20,
                            ),
                            bottomLeft: Radius.circular(
                              isMine ? Sizes.size20 : Sizes.size5,
                            ),
                            bottomRight: Radius.circular(
                              isMine ? Sizes.size5 : Sizes.size20,
                            ),
                          ),
                        ),
                        child: const Text(
                          "this is a message!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size16,
                          ),
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => Gaps.v10,
                itemCount: 10),
            Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: BottomAppBar(
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size16,
                      horizontal: Sizes.size12,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: _onStartWriting,
                            child: TextField(
                              decoration: InputDecoration(
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    FaIcon(
                                      FontAwesomeIcons.faceSmile,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                hintText: "Send a message...",
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.size10,
                                  vertical: Sizes.size10,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      Sizes.size10,
                                    ),
                                    topRight: Radius.circular(
                                      Sizes.size10,
                                    ),
                                    bottomLeft: Radius.circular(
                                      Sizes.size10,
                                    ),
                                    bottomRight: Radius.circular(
                                      Sizes.size1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Gaps.h20,
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FaIcon(
                              FontAwesomeIcons.paperPlane,
                              size: Sizes.size20,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
