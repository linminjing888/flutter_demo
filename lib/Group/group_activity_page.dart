/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-09 17:24:19
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-09 18:13:57
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Group/group_bander.dart';
import 'package:flutter_demo/Group/group_menu.dart';
import 'package:flutter_demo/Group/group_model.dart';
import 'package:flutter_demo/Group/group_novel_cell.dart';
import 'package:flutter_demo/Request/request.dart';
import 'package:flutter_demo/Support/mj_toast.dart';

class MJActivityPage extends StatefulWidget {
  @override
  _MJActivityPageState createState() => _MJActivityPageState();
}

class _MJActivityPageState extends State<MJActivityPage> {
  DataModel dataModel;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      var responseJson = await Request.get(action: "books");

      DataModel dataModel = DataModel.fromJson(responseJson);

      setState(() {
        this.dataModel = dataModel;
      });
    } catch (e) {
      MJToast.show(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataModel.books.length + 2,
      itemBuilder: (context, index) {
        return _buildModule(index);
      },
    );
  }

  Widget _buildModule(int index) {
    if (index == 0) {
      return DataBander(dataModel.carousels);
    } else if (index == 1) {
      return DataMenu(dataModel.menus);
    }
    return NovelBookCell(dataModel.books[index - 2]);
  }
}
