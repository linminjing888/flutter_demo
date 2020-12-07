/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-07 09:49:15
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-07 17:32:13
 * @Descripttion: 
 */
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_demo/Home/HomeList/home_model.dart';

class HomeRequest {
  static Future<List<MovieItem>> requestMovieList() async {
    // final movieUrl =
    //     "/api/v2/subject_collection/movie_real_time_hotest/items";
    // final result = await DBHttpRquest.request(movieUrl);
    // final subjects = result["subject_collection_items"];

    String jsonString = await rootBundle.loadString("mock/movies.json");
    final jsonResult = json.decode(jsonString);
    final items = jsonResult["subject_collection_items"];

    List<MovieItem> movies = [];
    for (var item in items) {
      movies.add(MovieItem.fromMap(item));
    }
    return movies;
  }
}
