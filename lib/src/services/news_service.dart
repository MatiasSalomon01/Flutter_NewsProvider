import 'package:flutter/material.dart';
import 'package:news_app/src/models/models.dart';

class NewsService with ChangeNotifier{

  List<Article> headlines = [];

  NewsService(){
    getTopHeadLines();
  }

  getTopHeadLines(){
    print('cargando headlines');
  }

} 