import 'package:flutter/material.dart';
import 'package:tw_cafeteria/constants/constant_texts.dart';

class TwCafeteria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text(ConstantText.appTitle),
            bottom: new TabBar(tabs: [
              new Tab(text: ConstantText.breakfast),
              new Tab(text: ConstantText.lunch),
              new Tab(text: ConstantText.snacks),
            ]),
          ),
        )
      ),
    );
  }
}
