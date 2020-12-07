/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 09:49:15
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-07 11:41:14
 * @Descripttion: 
 */
import 'package:flutter/material.dart';

// 虚线
class MJDashedLine extends StatelessWidget {
  final Axis lineAxis;
  final double lineWidth;
  final double lineHeight;
  final Color lineColor;
  final int lineCount;
  MJDashedLine({
    this.lineAxis = Axis.horizontal,
    this.lineWidth = 1,
    this.lineHeight = 1,
    this.lineColor = Colors.grey,
    this.lineCount = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
        direction: lineAxis,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(lineCount, (index) {
          return SizedBox(
            width: lineWidth,
            height: lineHeight,
            child: DecoratedBox(decoration: BoxDecoration(color: lineColor)),
          );
        }));
  }
}
