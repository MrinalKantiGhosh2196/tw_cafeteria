import 'package:flutter/material.dart';
import 'package:tw_cafeteria/widget/tw_cafeteria.dart';
import 'package:tw_cafeteria/service/time_provider_service.dart';
import 'package:tw_cafeteria/widget/login.dart';

 class Route extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => new TwCafeteria(new TimeProvider()),
        '/login' : (context) => new Login()
      },
    );
  }

 }