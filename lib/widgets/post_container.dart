import 'package:cached_network_image/cached_network_image.dart';
import 'package:fbmak/config/palette.dart';
import 'package:fbmak/models/models.dart';
import 'package:fbmak/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  PostContainer({
    Key key,
    @required this.post,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                SizedBox(height: 4),
                Text(post.caption),
                post.imageUrl != null 
                ? SizedBox.shrink()
                : SizedBox(height: 6,),
              ]
            ),
          ),
          post.imageUrl != null ? Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: CachedNetworkImage(
              imageUrl: post.imageUrl
            ),
          ) : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  
  const _PostHeader({
    Key key, 
    @required this.post
    }) : super(key: key);
    
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfilAvatar(imageUrl: post.user.imageUrl),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
                ),
              Row(
                children: [
                Text('${post.timeAgo} ° ', style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12
                  ),),
                Icon(
                  Icons.public,
                  color: Colors.grey[600],
                  size: 12,
                )
            ],
            ),
          ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_horiz), 
          onPressed: ()=>print('More')
          )
      ],
    );
  }
}


class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({
    Key key,
    @required this.post
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Palette.facebookBlue,
              shape: BoxShape.circle,
            ),
            child : Icon(
              Icons.thumb_up,
              color: Colors.white,
              size: 10,
            )
          ),
          SizedBox(width: 4),
          Expanded(
            child: Text(
              '${post.likes}',
              style: TextStyle(
                color: Colors.grey[600]
              ),
            ),
          ),
          Text(
            '${post.comments} Comments',
            style: TextStyle(
              color: Colors.grey[600]
            ),
          ),
          SizedBox(width: 10),
          Text(
            '${post.shares} Shares',
            style: TextStyle(
              color: Colors.grey[600]
            ),
          )
        ],
        ),
        Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
              MdiIcons.thumbUpOutline,
              color: Colors.grey[600],
              size: 20,
              ),
              label: 'Like',
              onTap: ()=>print('Like'),
            ),
            _PostButton(
              icon: Icon(
              MdiIcons.commentOutline,
              color: Colors.grey[600],
              size: 20,
              ),
              label: 'Like',
              onTap: ()=>print('Like'),
            ),
            _PostButton(
              icon: Icon(
              MdiIcons.shareOutline,
              color: Colors.grey[600],
              size: 20,
              ),
              label: 'Like',
              onTap: ()=>print('Like'),
            ),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({
    Key key, 
    @required this.icon,
    @required this.label,
    @required this.onTap
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(width: 4),
                Text(label)
              ],
            ),
          ),
        ),
      ),
    );
  }
}