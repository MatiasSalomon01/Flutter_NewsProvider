import 'package:flutter/material.dart';
import 'package:news_app/src/services/services.dart';
import 'package:news_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';


class Tab1Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final headlines = Provider.of<NewsService>(context).headlines;
    
    return Scaffold(
      body: ListaNoticias(headlines)
   );
  }
}