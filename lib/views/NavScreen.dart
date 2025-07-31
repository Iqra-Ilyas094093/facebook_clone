import 'package:facebook_clone/views/homeScreen.dart';
import 'package:facebook_clone/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../data/data.dart';

class Navscreen extends StatefulWidget {
  Navscreen({super.key});

  @override
  State<Navscreen> createState() => _NavscreenState();
}

class _NavscreenState extends State<Navscreen> {
  final List<Widget> screen = [
    Homescreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> icons = [
    Icons.home,
    Icons.ondemand_video,
    Icons.account_circle_outlined,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: icons.length,
      child: Scaffold(
        appBar:
            Responsive.isDesktop(context)
                ? PreferredSize(
                  preferredSize: Size(size.width, 100),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 4,8,0),
                    child: Container(
                      color: Colors.white,
                      child: CustomTabBar(
                        icons: icons,
                        selectedIndex: selectedIndex,
                        onTap:
                            (index) => setState(() {
                              selectedIndex = index;
                            }),
                        currentUser: currentUser,
                      ),
                    ),
                  ),
                )
                : null,
        body: IndexedStack(index: selectedIndex, children: screen),
        bottomNavigationBar:
            !Responsive.isDesktop(context)
                ? Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: CustomNavigationBar(
                      bottomIndicator: false,
                      icons: icons,
                      selectedIndex: selectedIndex,
                      onTap:
                          (index) => setState(() {
                            selectedIndex = index;
                          }),
                    ),
                  ),
                )
                : SizedBox.shrink(),
      ),
    );
  }
}
