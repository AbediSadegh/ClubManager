import 'dart:async' show Future;
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/entity/news_page_entity.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart' as http;

Future loadGallery(String url) async {
  final response = await http.get(url);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new PhotoList.fromJson(jsonResPonse);
  return product;
}
Future<NewsPageEntity> loadNewsList(String url) async {
  final response = await http.get(url);
//  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  NewsPageEntity newsList = NewsPageEntity.fromJson(utf8.decode(response.bodyBytes));
  return newsList;
}
Future<NewsEntity> loadNews(String url) async {
  final response = await http.get(url);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new NewsEntity.fromJson(jsonResPonse);
  return product;
}
Future<FameList> loadFade(String url) async {
  final response = await http.get(url);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new FameList.fromJson(jsonResPonse);
  return product;
}
