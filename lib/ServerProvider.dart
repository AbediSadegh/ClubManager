import 'dart:async' show Future;
import 'package:club_manager/LoginData.dart';
import 'package:club_manager/entity/PhotoEntity.dart';
import 'package:club_manager/entity/news_page_entity.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String token = "Token 9a21590cc1840b82c8911c47302faaaa410693a9";

Future loadGallery({String url,int id}) async {
  print("hellllllllllllllllllllllllllllllllllllllllllo");
  Map<String, String> requestHeaders = {
    'Authorization': token,
  };//http://185.213.166.42:8000/api/gallery/category/
  print(id.toString());
  Map<String, String> data = {
    'category': id.toString(),
  };
  final response = await http.post(url+"/",body: data);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new PhotoList.fromJson(jsonResPonse);
  return product;
}
Future<CategoryItemList> getCategoryList(
    {String url}) async {
//  Map<String, String> requestHeaders = {
//    'Authorization': token,
//    // todo change
//  };
//  Map<String, dynamic> data = {
//    'letter': letter,
//  };
  final response = await http.get(url,);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new CategoryItemList.fromJson(jsonResPonse);
  return product;
}

Future<NewsPageEntity> loadNewsList(String url) async {
  final response = await http.get(url);
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

Future<CommerceListEntity> getCommerceList(String url) async {
  Map<String, String> requestHeaders = {
    'Authorization': token,
    // todo change
  };

  final response = await http.get(url, headers: requestHeaders);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new CommerceListEntity.fromJson(jsonResPonse);
  return product;
}

Future<CheckListEntity> getCheckList(String url) async {
  Map<String, String> requestHeaders = {
    'Authorization': token,
    // todo change
  };

  final response = await http.get(url, headers: requestHeaders);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new CheckListEntity.fromJson(jsonResPonse);
  return product;
}

Future<CheckPassEntity> passedCheck({String url, String id}) async {
  Map<String, String> requestHeaders = {
    'Authorization': token,
    // todo change
  };
  Map data = {
    'id': id,
  };
  final response = await http.post(url, body: data, headers: requestHeaders);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new CheckPassEntity.fromJson(jsonResPonse);
  return product;
}

Future<CommerceList> createCommerce(
    {String url, String title, bool is_income, String price}) async {
  Map<String, String> requestHeaders = {
    'Authorization': token,
    // todo change
  };
  Map<String, dynamic> data = {
    'title': title,
    'is_income': is_income ? 'true' : 'false',
    'price': price,
  };
  final response = await http.post(url, headers: requestHeaders, body: data);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new CommerceList.fromJson(jsonResPonse);
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

Future<SendCodEntity> checkCode(
    {String url, String mobile, String code}) async {
  Map data = {
    'mobile': mobile,
    'pin': code,
  };
  final response = await http.post(url, body: data);
  try {
    final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
    var product = new SendCodEntity.fromJson(jsonResPonse);
    return product;
  } catch (ex) {
    return null;
  }
}

Future<RegisterEntity> register({String url}) async {
  Map<String, dynamic> data = {
    'first_name': LoginData.name,
    'last_name': LoginData.family,
    'player': {
      'national_code': LoginData.cardNumber,
      'school': LoginData.schoolName,
      'school_trainer': LoginData.coachName,
      'former_club': LoginData.lastTeam,
      'dad_phone': LoginData.fatherPhone,
      'mom_phone': LoginData.motherPhone,
      'home_phone': LoginData.homePhone,
      'dad_work': LoginData.fatherWorks,
      'address': LoginData.address,
      'disease': LoginData.patient,
      'position': LoginData.favorite,
    }
  };
  Map<String, String> requestHeaders = {
    'Content-Type': 'application/json',
  };

  final response =
      await http.put(url, body: json.encode(data), headers: requestHeaders);
  try {
    final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
    var product = new RegisterEntity.fromJson(jsonResPonse);
    return product;
  } catch (ex) {
    print("sa");
    return null;
  }
}

Future<StudentList> getStudentList({String letter, String url}) async {
  Map<String, String> requestHeaders = {
    'Authorization': token,
    // todo change
  };
  Map<String, dynamic> data = {
    'letter': letter,
  };
  final response = await http.post(url, headers: requestHeaders, body: data);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new StudentList.fromJson(jsonResPonse);
  return product;
}

Future<ProfileEntity> getProfileData({String userName, String url}) async {
  Map<String, String> requestHeaders = {
    'Authorization': token,
    // todo change
  };
  Map<String, dynamic> data = {
    'username': userName,
  };
  final response = await http.post(url, headers: requestHeaders, body: data);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new ProfileEntity.fromJson(jsonResPonse);
  return product;
}

Future<ExerciseListEntity> getExercise({String url}) async {
  final response = await http.get(url);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new ExerciseListEntity.fromJson(jsonResPonse);
  return product;
}

Future<ExerciseUserListEntity> getPayment({String url, String userName}) async {
  Map<String, String> requestHeaders = {
    'Authorization': token,
    // todo change
  };
  Map<String, dynamic> data = {
    'username': userName,
  };
  final response = await http.post(url, body: data, headers: requestHeaders);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new ExerciseUserListEntity.fromJson(jsonResPonse);
  return product;
}

Future<CheckCreateEntity> createCheck(
    {String url,
    String userName,
    String name,
    String number,
    String price,
    String date}) async {
  Map<String, String> requestHeaders = {
    'Authorization': token,
    // todo change
  };
  print(date.toString());
  Map<String, dynamic> data = {
    'user': userName,
    'name': name,
    'number': number,
    'price': price,
    'date': date.replaceAll("/", "")
  };
  final response = await http.post(url, body: data, headers: requestHeaders);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new CheckCreateEntity.fromJson(jsonResPonse);
  return product;
}

Future<PresenceEntity> setPresence(
    {String url, String userName, String date, bool attendance}) async {
  Map<String, String> requestHeaders = {
    'Authorization': token,
    // todo change
  };
  Map<String, dynamic> data = {
    'username': userName,
    'date': date,
    'attendance': attendance ? 'True' : 'False',
  };
  final response = await http.post(url, body: data, headers: requestHeaders);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new PresenceEntity.fromJson(jsonResPonse);
  return product;
}

Future<PeriodListEntity> getPlane({String url}) async {
  final response = await http.get(url);
  final jsonResPonse = json.decode(utf8.decode(response.bodyBytes));
  var product = new PeriodListEntity.fromJson(jsonResPonse);
  return product;
}
