import 'package:facebook_clone/utilities/palette.dart';
import 'package:facebook_clone/views/widgets/circleButton.dart';
import 'package:facebook_clone/views/widgets/create_post_container.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../data/data.dart';



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
              Circlebutton(icon: Icons.search, iconSize: 30,),
              Circlebutton(icon: MdiIcons.facebookMessenger, iconSize: 30),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser)
          )
        ],
      ),
    );
  }
}
