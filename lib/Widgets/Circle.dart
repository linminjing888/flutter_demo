/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 11:11:57
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-07 11:12:17
 * @Descripttion: 
 */
import 'package:flutter/material.dart';

class MJCircle extends StatelessWidget {
  final Color color;
  final double radius;
  final bool showShadow;
  final Widget child;

  MJCircle({
    this.color = Colors.blue,
    this.radius = 6,
    this.showShadow = true,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: child == null ? Container() : child,
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          if (showShadow)
            BoxShadow(
              color: Colors.grey,
              offset: Offset(.5, .5),
              blurRadius: .5,
            )
        ],
      ),
    );
  }
}
