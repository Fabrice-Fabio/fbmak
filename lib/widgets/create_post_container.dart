import 'package:fbmak/models/models.dart';
import 'package:fbmak/widgets/profil_avatar.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key key,
    @required this.currentUser,
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfilAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(width: 8.0,),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "What's your big dream?"
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 10,thickness: 0.5,),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: ()=>print('live'),
                   icon: Icon(Icons.videocam, color: Colors.red,),
                    label: Text('Live'),
                  ),
                  VerticalDivider(width: 8.0,),
                FlatButton.icon(
                  onPressed: ()=>print('Photo'),
                   icon: Icon(Icons.photo_library, color: Colors.green,),
                    label: Text('Photo'),
                  ),
                  VerticalDivider(width: 8.0,),
                FlatButton.icon(
                  onPressed: ()=>print('Room'),
                   icon: Icon(Icons.video_call, color: Colors.purpleAccent,),
                    label: Text('Room'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}