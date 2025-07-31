import 'package:facebook_clone/views/widgets/profileAvatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/model.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Profileavatar(imageUrl: user.imageUrl),
        SizedBox(width: 8,),
        Text(user.name,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
      ],
    );
  }
}
