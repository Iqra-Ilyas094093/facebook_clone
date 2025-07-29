import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/utilities/palette.dart';
import 'package:facebook_clone/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../model/model.dart';

class CreateStories extends StatelessWidget {
  final List<Story> stories;
  final User user;

  const CreateStories({super.key, required this.stories, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (context, index) {

          if(index ==0){
            return stroyCard(currentUser: user,isAddStory: true);
          }
          final Story story = stories[index-1];
          print(index);
          return stroyCard(story: story, currentUser: user);
        },
      ),
    );
  }
}



class stroyCard extends StatelessWidget {
  final Story? story;
  final bool isAddStory ;
  final User currentUser;

  const stroyCard({required this.currentUser, this.story,this.isAddStory = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: 140,
        width: 110,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: isAddStory?currentUser.imageUrl:story!.imageUrl,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: isAddStory? CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(Icons.add,color: Palette.facebookColor,size: 30,),
              ):Profileavatar(imageUrl: story!.user.imageUrl,isViewed: story!.isViewed,),
            ),
            Positioned(
                right: 5,
                left: 10,
                bottom: 10,
                child: Text(isAddStory?'Add to Story':story!.user.name,softWrap: true,textAlign: TextAlign.start,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15,height: 1),))
          ],
        ),
      ),
    );
  }
}
