/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-09 17:03:28
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-10 14:45:42
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_demo/Group/Model/group_model.dart';

class DataBander extends StatefulWidget {
  final List<CarouselInfo> imgList;
  DataBander(this.imgList);

  @override
  _DataBanderState createState() => _DataBanderState();
}

class _DataBanderState extends State<DataBander> {
  @override
  Widget build(BuildContext context) {
    if (widget.imgList.length == 0) {
      return SizedBox();
    }
    final List<Widget> imageSliders = imageSlidersMethod;
    return Column(
      children: [
        Container(
          child: CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              // enlargeCenterPage: true,
              // enlargeStrategy: CenterPageEnlargeStrategy.height,
              // onPageChanged: (index, reason) {
              //   setState(() {
              //     _current = index;
              //   });
              // },
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> get imageSlidersMethod {
    return widget.imgList.map((item) {
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(item.imageUrl, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      //阴影
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                        //边距
                        vertical: 10.0,
                        horizontal: 20.0),
                    child: Text(
                      'No. ${widget.imgList.indexOf(item)} image',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      );
    }).toList();
  }
}
