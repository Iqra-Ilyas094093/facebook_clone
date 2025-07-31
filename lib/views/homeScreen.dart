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
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
        child: Responsive(
          Desktop: homeScreenDesktop(),
          Mobile: homeScreenMobile(),
        ),
      ),
    );
  }
}
class homeScreenDesktop extends StatelessWidget {
  const homeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Additionalfeatures(user:currentUser),
        ),
        Spacer(),
        Container(
          width: 600,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  sliver: SliverToBoxAdapter(
                    child: CreateStories(stories: stories, user: currentUser),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CreatePostContainer(currentUser: currentUser),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  sliver: SliverToBoxAdapter(child: Room(onlineUsers: onlineUsers)),
                ),

                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final Post post = posts[index];
                    return AddPostContainer(post: post);
                  },childCount: posts.length),

                ),
              ],
            ),
          ),
        ),
        Spacer(),
        Flexible(
          flex: 2,
          child: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 4),
                  child: Row(
                    children: [
                      Text('Contacts',style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500
                      ),),
                     Spacer(),
                     IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 25,color: Colors.grey,)),
                     IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.grey,)),

                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: onlineUsers.length,
                      itemBuilder: (context , index){
                    final user = onlineUsers[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0,left: 8,right: 6,bottom: 4),
                      child: UserCard(user: user),
                    );
                  }),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}




class homeScreenMobile extends StatelessWidget {
  const homeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
    );
  }
}


