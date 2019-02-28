import 'package:flutter/material.dart';

class TwCafeteria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'TW Cafeteria',
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('TW Cafeteria'),
        ),
        body: const Center(
          child: const Text('An app for ThoughtWorks Cafeteria'),
        ),
      ),
    );
  }
}
