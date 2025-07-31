import 'package:facebook_clone/utilities/palette.dart';
import 'package:facebook_clone/views/widgets/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../model/model.dart';

class Additionalfeatures extends StatelessWidget {
  final List<List>  moreOptionList = [
    [MdiIcons.shieldAccount,Colors.deepPurple,'COVID-19 Info Center'],
    [MdiIcons.accountMultiple,Colors.cyan,'Friends'],
    [MdiIcons.facebookMessenger,Palette.facebookColor,'Messenger'],
    [MdiIcons.flag,Colors.orange,'Pages'],
    [MdiIcons.storefront,Palette.facebookColor,'MarketPlace'],
    [Icons.ondemand_video,Palette.facebookColor,'Watch'],
    [MdiIcons.calendarStar,Colors.red,'Events'],
  ];
  final User user;
  Additionalfeatures({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0,top: 12),
      child: ListView.builder(
          itemCount: moreOptionList.length,
          itemBuilder: (context,index){
        if(index == 0){
          return Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 6,right: 2,bottom: 12),
            child: UserCard(user: user),
          );
        }
        final option = moreOptionList[index];
        return Padding(
          padding: const EdgeInsets.only(top: 8.0,left: 6,right: 2,bottom: 4),
          child: optionList(icon: option[0], iconColor: option[1], label: option[2]),
        );
      }),
    );
  }
}
class optionList extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  const optionList({super.key, required this.icon, required this.iconColor, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 30,color: iconColor,),
        SizedBox(width: 6,),
        Text(label),
      ],
    );
  }
}

