import 'dart:async' show Future;
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart' as http;

Future loadGallery(String url) async {
  final response = await http.get(url);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new PhotoList.fromJson(jsonResPonse);
  return product;
}
