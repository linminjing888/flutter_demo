/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-09 17:51:50
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-10 14:46:25
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Group/Model/group_model.dart';

class DataMenu extends StatelessWidget {
  final List<MenuInfo> infos;
  DataMenu(this.infos);

  @override
  Widget build(BuildContext context) {
    if (infos.length == 0) {
      return SizedBox();
    }
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: infos.map((info) {
          return Column(
            children: [
              Image.asset("assets/${info.icon}"),
              SizedBox(
                height: 5,
              ),
              Text(
                info.title,
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
