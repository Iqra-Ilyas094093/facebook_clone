import 'package:facebook_clone/views/widgets/CustomNavigationBar.dart';
import 'package:facebook_clone/views/widgets/circleButton.dart';
import 'package:facebook_clone/views/widgets/profileAvatar.dart';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../model/model.dart';
import '../../utilities/palette.dart';

class CustomTabBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  const CustomTabBar({super.key, required this.icons, required this.selectedIndex, required this.onTap, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Text(
            'facebook',
            style: TextStyle(
              color: Palette.facebookColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
        ),
        SizedBox(
            width: 600,
            child: CustomNavigationBar(icons: icons, selectedIndex: selectedIndex, onTap: onTap,bottomIndicator: true,)),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Profileavatar(imageUrl: currentUser.imageUrl),
              SizedBox(width: 8,),
              Text(currentUser.name,style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
              SizedBox(width: 6,),
              Circlebutton(icon: Icons.search, iconSize: 30),
              Circlebutton(icon: MdiIcons.facebookMessenger, iconSize: 30)
            ],
          ),
        )
      ],
    );
  }
}
