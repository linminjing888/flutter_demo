import 'package:flutter/material.dart';
import 'package:flutter_demo/Home/home_content.dart';

class MJHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: MJHomeContent(),
    );
  }
}
