import 'package:flutter/material.dart';
import 'package:truong_ngoc_phuong_19110441/views/screens/contentPage.dart';
import 'package:truong_ngoc_phuong_19110441/views/screens/detailPage.dart';
import 'package:truong_ngoc_phuong_19110441/views/screens/homePage.dart';
import 'package:truong_ngoc_phuong_19110441/views/screens/loginPage.dart';


final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (context) => LoginPage(),
  HomePage.routeName: (context) => HomePage(),
  ContentPage.routeName: (context) => const ContentPage(),
  DetailPage.routeName: (context) => const DetailPage(),
};
