import 'package:facebook_clone/utilities/palette.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool bottomIndicator;

  const CustomNavigationBar({
    super.key,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    this.bottomIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: bottomIndicator?Border(bottom: BorderSide(width: 3, color: Palette.facebookColor)):Border(top: BorderSide(width: 3, color: Palette.facebookColor)),
      ),
      tabs:
          icons
              .asMap()
              .map(
                (i, e) => MapEntry(
                  i,
                  Tab(
                    icon: Icon(
                      e,
                      size: 28,
                      color:
                          i == selectedIndex
                              ? Palette.facebookColor
                              : Colors.black45,
                    ),
                  ),
                ),
              )
              .values
              .toList(),
      onTap: onTap,
    );
  }
}
