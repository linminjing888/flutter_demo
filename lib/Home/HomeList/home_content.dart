/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 09:49:15
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-07 15:17:48
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_demo/Home/HomeList/home_model.dart';
import 'package:flutter_demo/Home/HomeList/home_movie_item.dart';
import 'package:flutter_demo/Home/HomeList/home_request.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();
    HomeRequest.requestMovieList().then((value) {
      setState(() {
        movies.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieWidget(movies[index]);
      },
    );
  }
}
