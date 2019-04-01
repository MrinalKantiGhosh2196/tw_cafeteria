import 'package:flutter/material.dart';
import 'package:tw_cafeteria/widget/BuildButtonIcon.dart';
import 'package:tw_cafeteria/model/menu_item_events.dart';


class MenuItem extends StatefulWidget{
  final String _menuItem;

  MenuItem(this._menuItem);

  @override
  State<StatefulWidget> createState() {
    return new _MenuItemState();
  }

}

class _MenuItemState extends State<MenuItem>{
  bool isLiked;
  bool isDisliked;
  BuildIconButton likeButton;
  BuildIconButton dislikeButton;

  _MenuItemState();

  @override
  void initState() {
    super.initState();
    isLiked = false;
    isDisliked = false;
  }

  @override
  Widget build(BuildContext context) {
    likeButton =  new BuildIconButton(Icons.thumb_up,() => onTappedIconButton(MenuItemEvents.like), isLiked,  Colors.blueAccent, initialColor: Colors.grey, paddingRight: 10);
    dislikeButton = new BuildIconButton(Icons.thumb_down,() => onTappedIconButton(MenuItemEvents.dislike), isDisliked,  Colors.redAccent, initialColor: Colors.grey, paddingLeft: 10);

    return new Card(
      child: new ListTile(
        title: new Text(widget._menuItem),
        trailing: new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            likeButton, dislikeButton
          ],
        ),
      ),
    );
  }

  onTappedIconButton(MenuItemEvents event){
    if(event == MenuItemEvents.like) {
      setState(() {
        isLiked = !isLiked;
        isDisliked = false;
      });
    } else {
      setState(() {
        isDisliked = !isDisliked;
        isLiked = false;
      });
    }
  }

}
