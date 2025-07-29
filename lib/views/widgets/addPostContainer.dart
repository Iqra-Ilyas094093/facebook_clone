import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/utilities/palette.dart';
import 'package:facebook_clone/views/widgets/categoryButton.dart';
import 'package:facebook_clone/views/widgets/profileAvatar.dart';
import 'package:flutter/material.dart';

import '../../model/model.dart';

class AddPostContainer extends StatelessWidget {
  final Post post;

  const AddPostContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            postHeader(post: post),
            SizedBox(height: 4),
            Text(post.caption),
            post.imageUrl != null
                ? const SizedBox(height: 4)
                : const SizedBox.shrink(),
            post.imageUrl != null
                ? CachedNetworkImage(
                  imageUrl: post.imageUrl!,
                  width: double.infinity,
                )
                : SizedBox(),
            postSocialDetails(post: post),
          ],
        ),
      ),
    );
  }
}

class postHeader extends StatelessWidget {
  final Post post;

  const postHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Profileavatar(imageUrl: post.user.imageUrl),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    post.timeAgo + ' . ',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  Icon(Icons.public, color: Colors.grey.shade600, size: 18),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz, color: Colors.black),
        ),
      ],
    );
  }
}

class postSocialDetails extends StatelessWidget {
  final Post post;

  const postSocialDetails({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.facebookColor,
              ),
              child: Icon(Icons.thumb_up, color: Colors.white, size: 12),
            ),
            SizedBox(width: 4),
            Expanded(child: Text(post.likes.toString(),style: TextStyle(color: Colors.grey.shade600),)),
            Text('${post.comments.toString()} Comments ',style: TextStyle(color: Colors.grey.shade600),),
            Text('${post.shares.toString()} Shares',style: TextStyle(color: Colors.grey.shade600),),
          ],
        ),
        Divider(thickness: 1,color: Palette.scaffold,),
        Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Categorybutton(
                label: "Likes",
                icon: Icons.thumb_up_alt_outlined,
                iconColor: Colors.black,
                onPressed: () {},
              ),
              VerticalDivider(width: 2,thickness: 1,color: Palette.scaffold,),
              Categorybutton(
                label: "Comment",
                icon: Icons.comment,
                iconColor: Colors.black,
                onPressed: () {},
              ),
              VerticalDivider(width: 2,thickness: 1,color: Palette.scaffold,),
              Categorybutton(
                label: "Share",
                icon: Icons.share,
                iconColor: Colors.black,
                onPressed: () {},
              ),
            ],
          ),
        ),

      ],
    );
  }
}
