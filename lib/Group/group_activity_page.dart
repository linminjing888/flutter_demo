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
import 'package:flutter_demo/Group/novel_four_view.dart';
import 'package:flutter_demo/Request/request.dart';
import 'package:flutter_demo/Support/mj_toast.dart';

class MJActivityPage extends StatefulWidget {
  @override
  _MJActivityPageState createState() => _MJActivityPageState();
}

class _MJActivityPageState extends State<MJActivityPage> {
  List<CarouselInfo> carouselInfos = [];
  List<DataModel> modules = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      var responseJson = await Request.get(action: "books");
      List moduleData = responseJson["module"];
      List<DataModel> models = [];
      moduleData.forEach((element) {
        models.add(DataModel.fromJson(element));
      });

      setState(() {
        this.modules = models;
        this.carouselInfos = carouselInfos;
      });
    } catch (e) {
      MJToast.show(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: modules.length,
      itemBuilder: (context, index) {
        return _buildModule(modules[index]);
      },
    );
  }

  Widget _buildModule(DataModel model) {
    if (model.carousels != null) {
      return DataBander(model.carousels);
    } else if (model.menus != null) {
      return DataMenu(model.menus);
    } else if (model.books != null) {
      return _bookCardInfo(model);
    }
    return Container();
  }

  Widget _bookCardInfo(DataModel module) {
    Widget card;
    switch (module.style) {
      case 4:
        card = NovelNormalView(module);
        break;
      default:
    }
    return card;
  }
}
