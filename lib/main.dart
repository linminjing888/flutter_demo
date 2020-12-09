/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 09:49:15
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-09 11:18:11
 * @Descripttion: 
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Me/Theme/theme_color_model.dart';
import 'package:flutter_demo/Support/mj_routes.dart';
import 'package:flutter_demo/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  // Provider
  runApp(ChangeNotifierProvider(
    create: (context) {
      return ThemeColorModel();
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // Provider
        primarySwatch: context.watch<ThemeColorModel>().color,
        // Provider.of<ThemeColorModel>(context).color,
        // 去除全局水波纹效果
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: MJRouter.initialRoute,
      routes: MJRouter.routes,
      // onGenerateRoute: MJRouter.onGenerateRoute,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate,
      ],
      // home: MainScreenPage(),
    );
  }
}
