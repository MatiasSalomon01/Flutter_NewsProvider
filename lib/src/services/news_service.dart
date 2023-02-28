import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '992ece114f6d4d50ad6e3f06d5f439ed';

class NewsService with ChangeNotifier{

  List<Article> headlines = [];

  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology')
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService(){
    getTopHeadLines();
    categories.forEach((item) {
      categoryArticles[item.name] = List.empty(growable: true);
    });
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String valor){
    _selectedCategory = valor;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article>? get getArticulosCategoriaSeleccionada => categoryArticles[selectedCategory];

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

  getArticlesByCategory(String category)async{

    if(categoryArticles[category]!.length > 0){
      return categoryArticles[category];
    }

    final url = Uri.parse('$_URL_NEWS/top-headlines?country=us&apiKey=$_APIKEY&category=$category');
    final res = await http.get(url);
    final newsResponse = NewsResponse.fromRawJson(res.body);

    categoryArticles[category]?.addAll(newsResponse.articles);

    notifyListeners();
  }

} 