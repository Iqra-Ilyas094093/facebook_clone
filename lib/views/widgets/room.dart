import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/utilities/palette.dart';
import 'package:facebook_clone/views/widgets/profileAvatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/model.dart';

class Room extends StatelessWidget {
  final List<User> onlineUsers;

  const Room({super.key, required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return OutlineCreateRoom();
          }
          final User user = onlineUsers[index - 1];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Profileavatar(imageUrl: user.imageUrl, isActive: true),
          );
        },
      ),
    );
  }

  Widget OutlineCreateRoom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.blue.shade100, width: 3),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.video_call, size: 35, color: Colors.deepPurple),
            SizedBox(width: 4),
            Text(
              'Create\nRoom',
              style: TextStyle(
                height: 1.0,
                color: Palette.facebookColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
