/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-09 18:12:23
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-09 18:12:24
 * @Descripttion: 
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Support/mj_color.dart';

class NovelCoverImage extends StatelessWidget {
  final String imgUrl;
  final double width;
  final double height;
  NovelCoverImage(this.imgUrl, {this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: CachedNetworkImageProvider(imgUrl),
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: MJColor.paper),
      ),
    );
  }
}
