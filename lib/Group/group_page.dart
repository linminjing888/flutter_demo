/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 09:49:15
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-08 16:35:23
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/generated/l10n.dart';

class MJGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).group),
        automaticallyImplyLeading: false,
      ),
      body: Container(),
    );
  }
}
