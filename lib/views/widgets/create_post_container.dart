import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/utilities/palette.dart';
import 'package:facebook_clone/views/widgets/categoryButton.dart';
import 'package:facebook_clone/views/widgets/profileAvatar.dart';
import 'package:facebook_clone/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../model/model.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: Responsive.isDesktop(context)?BorderRadius.circular(20):null,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
              child: Row(
                children: [
                  Profileavatar(imageUrl: currentUser.imageUrl),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'What\'s on your mind?',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(thickness: 1,height: 11,color: Palette.scaffold,),
            ),
            Container(
              // color: Colors.blue,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Categorybutton(label: 'Live', icon: Icons.videocam, iconColor: Colors.red, onPressed: (){}),
                  VerticalDivider(width: 8, color: Palette.scaffold,),
                  Categorybutton(label: 'Photos', icon: Icons.photo_library, iconColor: Colors.green, onPressed: (){}),
                  VerticalDivider(width: 8,color: Palette.scaffold, ),
                  Categorybutton(label: 'Room', icon: Icons.video_call, iconColor: Colors.purpleAccent, onPressed: (){}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
