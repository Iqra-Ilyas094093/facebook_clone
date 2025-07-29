import 'package:facebook_clone/utilities/palette.dart';
import 'package:facebook_clone/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../data/data.dart';
import '../model/model.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            title: Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
            actions: [
              Circlebutton(icon: Icons.search, iconSize: 30),
              Circlebutton(icon: MdiIcons.facebookMessenger, iconSize: 30),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10),
            sliver: SliverToBoxAdapter(child: Room(onlineUsers: onlineUsers)),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 5),
            sliver: SliverToBoxAdapter(
              child: CreateStories(stories: stories, user: currentUser),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final Post post = posts[index];
              return AddPostContainer(post: post);
            },childCount: posts.length),

          ),
        ],
      ),
    );
  }
}
