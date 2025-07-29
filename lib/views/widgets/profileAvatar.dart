import 'package:flutter/material.dart';

import '../../utilities/palette.dart';

class Profileavatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool isViewed;

  const Profileavatar({
    super.key,
    required this.imageUrl,
    this.isActive = false,
    this.isViewed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isViewed
            ? CircleAvatar(
          radius: 22,
              backgroundColor: Palette.online,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Palette.facebookColor,
                backgroundImage: NetworkImage(imageUrl),
              ),
            )
            : CircleAvatar(
              radius: 20,
              backgroundColor: Palette.facebookColor,
              backgroundImage: NetworkImage(imageUrl),
            ),
        isActive
            ? Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Palette.online,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            )
            : SizedBox.shrink(),
      ],
    );
  }
}
