/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-08 10:26:40
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-08 11:41:08
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Me/Theme/cons.dart';
import 'package:flutter_demo/Me/Theme/theme_color_model.dart';
import 'package:flutter_demo/Widgets/Circle.dart';
import 'package:flutter_demo/Widgets/feedback_widget.dart';
import 'package:flutter_demo/global.dart';
import 'package:provider/provider.dart';

class MJThemeColorPage extends StatelessWidget {
  static const String routeName = "/theme";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主题色设置"),
      ),
      body: _buildBodyCell(context),
    );
  }

  Widget _buildBodyCell(BuildContext context) {
    final List<MaterialColor> themeColors = Cons.themeColors.keys.toList();

    return GridView.count(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1.5,
      shrinkWrap: true,
      children: themeColors.map((e) {
        return Consumer<ThemeColorModel>(
          builder: (context, value, child) {
            return FeedbackWidget(
              a: 0.95,
              onPressed: () {
                context.read<ThemeColorModel>().changeColor(e);
                int themeIndex = Cons.themeColors.keys.toList().indexOf(e);
                preferences.setInt(Cons.themeIndexKey, themeIndex);
              },
              child: GridTile(
                header: _buildCellHeader(value.color, e),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(colors: [
                      e[200],
                      e[500],
                      e[900],
                    ]),
                  ),
                  alignment: Alignment(0, 0.35),
                  child: Text(
                    Cons.themeColors[e],
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildCellHeader(MaterialColor color, MaterialColor e) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        color:
            color == e ? Colors.blue.withAlpha(88) : Colors.grey.withAlpha(55),
      ),
      padding: EdgeInsets.only(left: 10, right: 5),
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            colorToString(e),
            style: TextStyle(color: Colors.white),
          ),
          Spacer(),
          if (color == e)
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: MJCircle(
                color: Colors.white,
                radius: 6,
              ),
            ),
        ],
      ),
    );
  }

  String colorToString(Color color) {
    return "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";
  }
}

class Circle {}
