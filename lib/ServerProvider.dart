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
  NewsPageEntity newsList =
      NewsPageEntity.fromJson(utf8.decode(response.bodyBytes));
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

Future<CoachListEntity> loadCoachList(String url) async {
  final response = await http.get(url);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new CoachListEntity.fromJson(jsonResPonse);
  return product;
}

Future<AboutProgrammerListEntity> loadAboutProgrammer(String url) async {
  final response = await http.get(url);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new AboutProgrammerListEntity.fromJson(jsonResPonse);
  return product;
}

Future<SocailListEntity> loadSocail(String url) async {
  final response = await http.get(url);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new SocailListEntity.fromJson(jsonResPonse);
  return product;
}

Future<SendCommentEntity> postComment(
    {String url, String name, String family, String content}) async {
  Map data = {
    'first_name': name,
    'last_name': family,
    'description': content,
  };

  final response = await http.post(url, body: data);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new SendCommentEntity.fromJson(jsonResPonse);
  return product;
}

Future<SendPhoneEntity> sendCode({String url, String mobile}) async {
  Map data = {
    'mobile': mobile,
  };

  final response = await http.post(url, body: data);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new SendPhoneEntity.fromJson(jsonResPonse);
  return product;
}

Future<SendCodEntity> checkCode({String url, String mobile,String code}) async {
  Map data = {
    'mobile': mobile,
    'pin': code,
  };
  final response = await http.post(url, body: data);
  try{
    final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
    var product = new SendCodEntity.fromJson(jsonResPonse);
    return product;
  }catch(ex){
    return null;
  }
}
