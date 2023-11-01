import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:async';
import 'login.dart';
import '../widgets/bottombutton.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // const Main({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        // 상단바, 하단바, 메인화면으로 나눌때 주로 사용
        appBar: AppBar(
          title: Text('Dongkey'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 177, 0),
          toolbarHeight: 60,
          // leading : 아이콘 버튼이나 간단한 위젯을 왼쪽에 배치할 때 사용

          // actions : 복수의 아이콘 버튼 등을 오른쪽에 배치할 때 사용
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
        ),
        bottomNavigationBar:
            MyBottomNavigationBar(), // MyBottomNavigationBar 위젯 사용
      ),
    );
  }
}
