/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-08 16:38:39
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-08 16:39:12
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/generated/l10n.dart';

class MJFairPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).fair),
        automaticallyImplyLeading: false,
      ),
      body: Container(),
    );
  }
}
