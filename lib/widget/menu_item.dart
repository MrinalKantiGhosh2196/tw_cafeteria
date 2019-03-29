import 'package:flutter/material.dart';
import 'package:tw_cafeteria/widget/BuildButtonIcon.dart';

class MenuItem extends StatefulWidget{
  final String _menuItem;

  MenuItem(this._menuItem);

  @override
  State<StatefulWidget> createState() {
    return new _MenuItemState(_menuItem);
  }

}

class _MenuItemState extends State<MenuItem>{
  final String _menuItemName;
  bool isTappedLikeButton;
  bool isTappedDislikeButton;
  BuildIconButton likeButton;
  BuildIconButton dislikeButton;

  _MenuItemState(this._menuItemName);

  @override
  void initState() {
    super.initState();
    isTappedLikeButton = false;
    isTappedDislikeButton = false;
  }

  @override
  Widget build(BuildContext context) {
    likeButton =  new BuildIconButton(Icons.thumb_up, ()=>{Colors.grey,onTappedLikeButton("like")}, isTappedLikeButton,  paddingRight: 10);
    dislikeButton = new BuildIconButton(Icons.thumb_down, Colors.grey,onTappedDislikeButton, isTappedDislikeButton,  paddingLeft: 10);
    return new Card(
      child: new ListTile(
        title: new Text(_menuItemName),
        trailing: new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[likeButton, dislikeButton],
        ),
      ),
    );
  }

  onLikeBtnTap(){// like or dislike
    //     likeButton.changeColor(Colors.blueAccent);

    if(isTappedDislikeButton == true){
      // dislike = true
    }
    else{
      //like = false
    }
    setState(() {
      isTappedLikeButton = !isTappedLikeButton;
    });
  }

  onTappedDislikeButton(){
    dislikeButton.changeColor(Colors.redAccent);
    setState(() {
      isTappedDislikeButton = !isTappedDislikeButton;
    });
  }

}
