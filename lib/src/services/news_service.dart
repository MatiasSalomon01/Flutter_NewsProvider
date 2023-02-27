import 'package:flutter/material.dart';
import 'package:news_app/src/models/models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '992ece114f6d4d50ad6e3f06d5f439ed';

class NewsService with ChangeNotifier{

  List<Article> headlines = [];

  NewsService(){
    getTopHeadLines();
  }

  getTopHeadLines() async{
    final url = Uri.parse('$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY');
    // final url = Uri.https(_URL_NEWS, '/v2/top-headlines?', {
    //   "country": "us",
    //   "apiKey":_APIKEY
    // });
    final res = await http.get(url);
    final newsResponse = NewsResponse.fromRawJson(res.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }

} 