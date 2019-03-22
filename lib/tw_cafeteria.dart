import 'package:flutter/material.dart';
import 'package:tw_cafeteria/widget/homepage.dart';
import 'package:tw_cafeteria/service/time_provider_service.dart';
import 'package:tw_cafeteria/widget/login.dart';
import 'package:tw_cafeteria/constants/constant_texts.dart';

 class TwCafeteria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: ConstantText.appTitle,
      initialRoute: '/',
      routes: {
        '/' : (context) => new Homepage(new TimeProvider()),
        '/login' : (context) => new Login()
      },
    );
  }
 }