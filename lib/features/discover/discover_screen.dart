import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final tabs = [
    "Top",
    "Users",
    "Videos",
    "Sounds",
    "LIVE",
    "Shopping",
    "Brands",
  ];

  final TextEditingController _editingController = TextEditingController();

  bool _isWriting = false;

  @override
  void initState() {
    super.initState();
    _editingController.addListener(() {});
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  void _startWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  void _stopWriting() {
    setState(() {
      _isWriting = false;
    });
  }

  void _clearSearch() {
    _editingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            FocusScope.of(context).unfocus();
            _stopWriting();
          });
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 1,
              title: Expanded(
                child: SizedBox(
                  height: Sizes.size44,
                  child: TextField(
                    controller: _editingController,
                    onTap: _startWriting,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.size12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size12,
                        vertical: Sizes.size10,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                          left: Sizes.size16,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.magnifyingGlass,
                              size: Sizes.size16,
                              color: Colors.grey.shade600,
                            ),
                          ],
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(
                          right: Sizes.size16,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _isWriting
                                ? GestureDetector(
                                    onTap: _clearSearch,
                                    child: FaIcon(
                                      FontAwesomeIcons.circleXmark,
                                      size: Sizes.size16,
                                      color: Colors.grey.shade600,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              bottom: TabBar(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size16,
                ),
                indicatorColor: Colors.black,
                isScrollable: true,
                labelColor: Colors.black,
                labelStyle: const TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w600,
                ),
                splashFactory: NoSplash.splashFactory,
                unselectedLabelColor: Colors.grey.shade500,
                tabs: [
                  for (var tab in tabs)
                    Tab(
                      text: tab,
                    ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 20,
                  padding: const EdgeInsets.all(
                    Sizes.size6,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: Sizes.size10,
                    crossAxisSpacing: Sizes.size10,
                    childAspectRatio: (9 / 20),
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                          Sizes.size4,
                        )),
                        child: AspectRatio(
                          aspectRatio: 9 / 16,
                          child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/p2.jpg',
                            image:
                                'https://images.unsplash.com/photo-1676746424139-77f8bd8922a8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwcm9maWxlLXBhZ2V8MXx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=60',
                          ),
                        ),
                      ),
                      Gaps.v10,
                      const Text(
                        "This is a very long caption for my tiktok that im upload just now currently.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.v8,
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/3612017",
                            ),
                          ),
                          Gaps.h4,
                          const Expanded(
                            child: Text(
                              "My avata is going to very long",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Gaps.h4,
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size16,
                            color: Colors.grey.shade600,
                          ),
                          Gaps.h2,
                          const Text("2.5M")
                        ],
                      )
                    ],
                  ),
                ),
                for (var tab in tabs.skip(1))
                  Center(
                    child: Text(
                      tab,
                      style: const TextStyle(
                        fontSize: Sizes.size48,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
